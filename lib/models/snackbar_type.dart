import 'package:flutter/material.dart';

/// Enum defining the type of snackbar to display
enum SnackbarType {
  /// Success snackbar for positive confirmations
  success,
  
  /// Error snackbar for errors and failures
  error,
  
  /// Info snackbar for neutral information
  info,
}

/// Extension methods for [SnackbarType] to get type-specific properties
extension SnackbarTypeExtension on SnackbarType {
  /// Get the default background color for this snackbar type
  Color get backgroundColor {
    switch (this) {
      case SnackbarType.success:
        return const Color(0xFF4CAF50); // Green
      case SnackbarType.error:
        return const Color(0xFFF44336); // Red
      case SnackbarType.info:
        return const Color(0xFF2196F3); // Blue
    }
  }
  
  /// Get the default text color for this snackbar type
  Color get textColor {
    switch (this) {
      case SnackbarType.success:
      case SnackbarType.error:
      case SnackbarType.info:
        return Colors.white;
    }
  }
  
  /// Get the default icon for this snackbar type
  IconData get icon {
    switch (this) {
      case SnackbarType.success:
        return Icons.check_circle_outline;
      case SnackbarType.error:
        return Icons.error_outline;
      case SnackbarType.info:
        return Icons.info_outline;
    }
  }
  
  /// Get the default icon color for this snackbar type
  Color get iconColor {
    return Colors.white.withOpacity(0.9);
  }
}