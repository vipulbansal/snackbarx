import 'package:flutter/material.dart';
import '../models/snackbar_config.dart';
import '../models/snackbar_type.dart';

/// Base widget for all snackbar variants
class BaseSnackbar extends StatelessWidget {
  /// The message to display
  final String message;

  /// The type of snackbar
  final SnackbarType type;

  /// Configuration options
  final SnackbarConfig config;

  /// Callback when dismiss is requested
  final VoidCallback onDismiss;

  /// Creates a base snackbar widget
  const BaseSnackbar({
    Key? key,
    required this.message,
    required this.type,
    required this.config,
    required this.onDismiss,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backgroundColor = config.backgroundColor ?? type.backgroundColor;
    final textColor = config.textColor ?? type.textColor;
    final iconData = config.icon ?? type.icon;
    final iconColor = config.iconColor ?? type.iconColor;
    Size _screenSize = MediaQuery.of(context).size;

    return Material(
      elevation: config.elevation,
      borderRadius: config.borderRadius,
      color: backgroundColor,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: config.maxWidth ?? _screenSize.width * 0.8,
          minWidth: config.minWidth ?? 0,
        ),
        margin: config.margin,
        padding: config.padding,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon
            Icon(
              iconData,
              color: iconColor,
              size: 24,
            ),
            const SizedBox(width: 12),

            // Message
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  color: textColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),

            // Action button if provided
            if (config.actionLabel != null && config.onActionPressed != null) ...[
              const SizedBox(width: 8),
              TextButton(
                onPressed: config.onActionPressed,
                style: TextButton.styleFrom(
                  foregroundColor: config.actionTextColor ?? textColor,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  config.actionLabel!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],

            // Close button if enabled
            if (config.showCloseButton) ...[
              const SizedBox(width: 4),
              IconButton(
                icon: Icon(Icons.close, color: textColor.withOpacity(0.7), size: 20),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(
                  minWidth: 32,
                  minHeight: 32,
                ),
                onPressed: onDismiss,
              ),
            ],
          ],
        ),
      ),
    );
  }
}