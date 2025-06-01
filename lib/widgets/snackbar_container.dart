import 'package:flutter/material.dart';
import '../models/snackbar_config.dart';
import '../models/snackbar_type.dart';
import 'base_snackbar.dart';

/// Container widget that handles positioning and animation of snackbars
class SnackbarContainer extends StatefulWidget {
  /// The message to display
  final String message;
  
  /// The type of snackbar
  final SnackbarType type;
  
  /// Configuration options
  final SnackbarConfig config;
  
  /// Animation controller
  final AnimationController animationController;
  
  /// Callback when dismiss is requested
  final VoidCallback onDismiss;

  /// Creates a snackbar container
  const SnackbarContainer({
    Key? key,
    required this.message,
    required this.type,
    required this.config,
    required this.animationController,
    required this.onDismiss,
  }) : super(key: key);

  @override
  State<SnackbarContainer> createState() => _SnackbarContainerState();
}

class _SnackbarContainerState extends State<SnackbarContainer> {
  // Animations
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    
    // Set up animations based on the animation type
    _setupAnimations();
  }

  void _setupAnimations() {
    // Configure animations based on type
    switch (widget.config.animationType) {
      case SnackbarAnimationType.slideUp:
        _fadeAnimation = Tween<double>(begin: 1.0, end: 1.0)
            .animate(widget.animationController);
        
        final beginOffset = widget.config.position == SnackbarPosition.top
            ? const Offset(0, -1)
            : const Offset(0, 1);
        
        _slideAnimation = Tween<Offset>(
          begin: beginOffset,
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: widget.animationController,
          curve: Curves.easeOutCubic,
          reverseCurve: Curves.easeInCubic,
        ));
        
        _scaleAnimation = Tween<double>(begin: 1.0, end: 1.0)
            .animate(widget.animationController);
        break;
        
      case SnackbarAnimationType.fade:
        _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0)
            .animate(CurvedAnimation(
          parent: widget.animationController,
          curve: Curves.easeOut,
        ));
        
        _slideAnimation = Tween<Offset>(
          begin: Offset.zero,
          end: Offset.zero,
        ).animate(widget.animationController);
        
        _scaleAnimation = Tween<double>(begin: 1.0, end: 1.0)
            .animate(widget.animationController);
        break;
        
      case SnackbarAnimationType.scale:
        _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0)
            .animate(CurvedAnimation(
          parent: widget.animationController,
          curve: Curves.easeOut,
        ));
        
        _slideAnimation = Tween<Offset>(
          begin: Offset.zero,
          end: Offset.zero,
        ).animate(widget.animationController);
        
        _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0)
            .animate(CurvedAnimation(
          parent: widget.animationController,
          curve: Curves.easeOutCubic,
        ));
        break;
        
      case SnackbarAnimationType.slideAndFade:
        _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0)
            .animate(CurvedAnimation(
          parent: widget.animationController,
          curve: Curves.easeOut,
        ));
        
        final beginOffset = widget.config.position == SnackbarPosition.top
            ? const Offset(0, -0.3)
            : const Offset(0, 0.3);
        
        _slideAnimation = Tween<Offset>(
          begin: beginOffset,
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: widget.animationController,
          curve: Curves.easeOutCubic,
          reverseCurve: Curves.easeInCubic,
        ));
        
        _scaleAnimation = Tween<double>(begin: 1.0, end: 1.0)
            .animate(widget.animationController);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animationController,
      builder: (_, child) {
        return FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: SafeArea(
                child: Material(
                  color: Colors.transparent,
                  child: _positionSnackbar(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _positionSnackbar() {
    final snackbar = BaseSnackbar(
      message: widget.message,
      type: widget.type,
      config: widget.config,
      onDismiss: widget.onDismiss,
    );

    switch (widget.config.position) {
      case SnackbarPosition.top:
        return Align(
          alignment: Alignment.topCenter,
          child: snackbar,
        );
      case SnackbarPosition.center:
        return Center(child: snackbar);
      case SnackbarPosition.bottom:
        return Align(
          alignment: Alignment.bottomCenter,
          child: snackbar,
        );
    }
  }
}