import 'package:flutter/material.dart';

/// Configuration options for customizing snackbars
class SnackbarConfig {
  /// The duration for which the snackbar will be displayed
  final Duration duration;
  
  /// The position of the snackbar on the screen
  final SnackbarPosition position;
  
  /// The background color of the snackbar
  /// If null, will use type-specific default colors
  final Color? backgroundColor;
  
  /// The text color for the snackbar message
  /// If null, will use type-specific default colors
  final Color? textColor;
  
  /// The icon to display in the snackbar
  /// If null, will use type-specific default icons
  final IconData? icon;
  
  /// The color of the icon
  /// If null, will use type-specific default colors
  final Color? iconColor;
  
  /// The optional action button text
  final String? actionLabel;
  
  /// The callback when the action button is pressed
  final VoidCallback? onActionPressed;
  
  /// The color of the action button text
  final Color? actionTextColor;
  
  /// The border radius of the snackbar
  final BorderRadius borderRadius;
  
  /// The padding inside the snackbar
  final EdgeInsets padding;
  
  /// The margin around the snackbar
  final EdgeInsets margin;
  
  /// The animation duration for entry and exit
  final Duration animationDuration;
  
  /// The maximum width of the snackbar
  final double? maxWidth;
  
  /// The minimum width of the snackbar
  final double? minWidth;
  
  /// The elevation (shadow) of the snackbar
  final double elevation;
  
  /// Whether to show a close button
  final bool showCloseButton;
  
  /// Custom animation type
  final SnackbarAnimationType animationType;
  
  /// Creates a configuration for custom snackbars
  const SnackbarConfig({
    this.duration = const Duration(seconds: 3),
    this.position = SnackbarPosition.bottom,
    this.backgroundColor,
    this.textColor,
    this.icon,
    this.iconColor,
    this.actionLabel,
    this.onActionPressed,
    this.actionTextColor,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
    this.margin = const EdgeInsets.all(16),
    this.animationDuration = const Duration(milliseconds: 250),
    this.maxWidth ,
    this.minWidth,
    this.elevation = 6,
    this.showCloseButton = false,
    this.animationType = SnackbarAnimationType.slideUp,
  });
  
  /// Creates a copy of this configuration with the given fields replaced
  SnackbarConfig copyWith({
    Duration? duration,
    SnackbarPosition? position,
    Color? backgroundColor,
    Color? textColor,
    IconData? icon,
    Color? iconColor,
    String? actionLabel,
    VoidCallback? onActionPressed,
    Color? actionTextColor,
    BorderRadius? borderRadius,
    EdgeInsets? padding,
    EdgeInsets? margin,
    Duration? animationDuration,
    double? maxWidth,
    double? minWidth,
    double? elevation,
    bool? showCloseButton,
    SnackbarAnimationType? animationType,
  }) {
    return SnackbarConfig(
      duration: duration ?? this.duration,
      position: position ?? this.position,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
      icon: icon ?? this.icon,
      iconColor: iconColor ?? this.iconColor,
      actionLabel: actionLabel ?? this.actionLabel,
      onActionPressed: onActionPressed ?? this.onActionPressed,
      actionTextColor: actionTextColor ?? this.actionTextColor,
      borderRadius: borderRadius ?? this.borderRadius,
      padding: padding ?? this.padding,
      margin: margin ?? this.margin,
      animationDuration: animationDuration ?? this.animationDuration,
      maxWidth: maxWidth ?? this.maxWidth,
      minWidth: minWidth ?? this.minWidth,
      elevation: elevation ?? this.elevation,
      showCloseButton: showCloseButton ?? this.showCloseButton,
      animationType: animationType ?? this.animationType,
    );
  }
}

/// Enum defining the position of the snackbar on screen
enum SnackbarPosition {
  /// Display at the top of the screen
  top,
  
  /// Display at the bottom of the screen
  bottom,
  
  /// Display in the center of the screen
  center,
}

/// Enum defining the animation type for snackbar entry and exit
enum SnackbarAnimationType {
  /// Slide up from the bottom (or down from the top)
  slideUp,
  
  /// Fade in/out
  fade,
  
  /// Scale up/down
  scale,
  
  /// Slide + fade combined
  slideAndFade,
}