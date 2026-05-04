import 'dart:async';
import 'package:flutter/material.dart';
import 'models/snackbar_config.dart';
import 'models/snackbar_type.dart';
import 'widgets/snackbar_container.dart';

/// Singleton manager that ensures only one snackbar is visible at a time
class SnackbarXManager {
  /// Singleton instance
  static final SnackbarXManager instance = SnackbarXManager._();

  /// Private constructor
  SnackbarXManager._();

  /// Current overlay entry
  OverlayEntry? _currentOverlayEntry;

  /// Timer for auto-dismissal
  Timer? _dismissTimer;

  /// Animation controller
  AnimationController? _animationController;

  /// Whether the snackbar system has been initialized
  bool _isInitialized = false;

  /// Reference to a navigator key used to find overlay
  GlobalKey<NavigatorState>? _navigatorKey;

  /// Initializes the snackbar service
  ///
  /// This must be called before showing any snackbars.
  /// [navigatorKey] is optional but recommended for reliable overlay access
  void init({GlobalKey<NavigatorState>? navigatorKey}) {
    _navigatorKey = navigatorKey;
    _isInitialized = true;
  }

  /// Shows a snackbar with the given [message] and [type]
  ///
  /// [config] allows customization of snackbar appearance and behavior
  /// [context] can be provided to ensure proper overlay access
  void show({
    required String message,
    required SnackbarType type,
    required SnackbarConfig config,
    BuildContext? context,
  }) {
    if (!_isInitialized) {
      throw Exception('SnackbarX not initialized. Call SnackbarX.init() first.');
    }

    // Make sure any previous snackbars are dismissed
    _dismissCurrentSnackbar();

    // Get the overlay state - try multiple approaches
    OverlayState? overlayState;

    // First try using provided context if available
    if (context != null) {
      overlayState = Overlay.of(context);
    }

    // Next use the overlay owned by the configured navigator (not an ancestor of its context).
    if (overlayState == null && _navigatorKey?.currentState != null) {
      overlayState = _navigatorKey!.currentState!.overlay;
    }

    // Finally, try using the global navigator state
    if (overlayState == null) {
      try {
        final navigatorState = _findGlobalNavigator();
        if (navigatorState?.overlay != null) {
          overlayState = navigatorState!.overlay;
        }
      } catch (e) {
        // Ignore errors from finding global navigator
      }
    }

    // If we still couldn't find an overlay, throw an error
    if (overlayState == null) {
      throw Exception(
          'No Overlay found. Please provide a context in the show method or pass a navigatorKey during init().\n'
              'Make sure you\'re calling this method after MaterialApp has been created.'
      );
    }

    // Prefer the configured navigator; otherwise use the navigator above this overlay.
    final TickerProvider? vsync = _tickerProviderFor(overlayState);
    if (vsync == null) {
      throw Exception(
        'Could not find a suitable TickerProvider for animations. '
        'Use SnackbarX.init(navigatorKey: ...) matching MaterialApp.navigatorKey.',
      );
    }

    // Create a new controller for this snackbar
    _animationController = AnimationController(
      vsync: vsync,
      duration: config.animationDuration,
    );

    // Create and insert the overlay entry
    _currentOverlayEntry = OverlayEntry(
      builder: (context) => SnackbarContainer(
        message: message,
        type: type,
        config: config,
        animationController: _animationController!,
        onDismiss: dismiss,
      ),
    );

    overlayState.insert(_currentOverlayEntry!);

    // Start the animation
    _animationController!.forward();

    // Set up auto-dismiss timer if duration > 0
    if (config.duration.inMilliseconds > 0) {
      _dismissTimer = Timer(config.duration, () {
        dismiss();
      });
    }
  }

  /// Dismisses the current snackbar if one is visible
  void dismiss() {
    if (_currentOverlayEntry != null && _animationController != null) {
      _animationController!.reverse().then((_) {
        _dismissCurrentSnackbar();
      });
    }
  }

  /// Helper method to clean up resources when dismissing a snackbar
  void _dismissCurrentSnackbar() {
    // Cancel the dismiss timer if it's active
    _dismissTimer?.cancel();
    _dismissTimer = null;

    // Remove the overlay entry if it exists
    _currentOverlayEntry?.remove();
    _currentOverlayEntry = null;

    // Dispose the animation controller
    _animationController?.dispose();
    _animationController = null;
  }

  TickerProvider? _tickerProviderFor(OverlayState overlay) {
    final keyState = _navigatorKey?.currentState;
    if (keyState != null) {
      return keyState as TickerProvider;
    }
    final navigator =
        Navigator.maybeOf(overlay.context, rootNavigator: true);
    return navigator as TickerProvider?;
  }

  /// Attempts to find a global navigator state
  NavigatorState? _findGlobalNavigator() {
    final context = WidgetsBinding.instance.rootElement;
    if (context == null) {
      return null;
    }

    NavigatorState? navigator;

    void findNavigator(BuildContext context) {
      if (navigator != null) return;

      if (context is StatefulElement && context.state is NavigatorState) {
        navigator = context.state as NavigatorState;
        return;
      }

      context.visitChildElements(findNavigator);
    }

    findNavigator(context as BuildContext);

    return navigator;
  }
}