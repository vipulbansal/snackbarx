/// A lightweight, customizable snackbar utility for global use across Flutter apps.
library snackbarx;

import 'package:flutter/material.dart';
import 'package:snackbarx/snackbar_x_manager.dart';

import 'models/snackbar_config.dart';
import 'models/snackbar_type.dart';


/// Main class for showing customizable snackbars
class SnackbarX {
  /// Private constructor to prevent instantiation
  SnackbarX._();

  /// Shows a success snackbar with the given [message]
  ///
  /// [config] allows customization of snackbar appearance and behavior
  static void showSuccess(String message, {SnackbarConfig? config}) {
    SnackbarXManager.instance.show(
      message: message,
      type: SnackbarType.success,
      config: config ?? const SnackbarConfig(),
    );
  }

  /// Shows an error snackbar with the given [message]
  ///
  /// [config] allows customization of snackbar appearance and behavior
  static void showError(String message, {SnackbarConfig? config}) {
    SnackbarXManager.instance.show(
      message: message,
      type: SnackbarType.error,
      config: config ?? const SnackbarConfig(),
    );
  }

  /// Shows an info snackbar with the given [message]
  ///
  /// [config] allows customization of snackbar appearance and behavior
  static void showInfo(String message, {SnackbarConfig? config}) {
    SnackbarXManager.instance.show(
      message: message,
      type: SnackbarType.info,
      config: config ?? const SnackbarConfig(),
    );
  }

  /// Shows a custom snackbar with the given [message] and [type]
  ///
  /// [config] allows customization of snackbar appearance and behavior
  static void show(String message, SnackbarType type, {SnackbarConfig? config}) {
    SnackbarXManager.instance.show(
      message: message,
      type: type,
      config: config ?? const SnackbarConfig(),
    );
  }

  /// Initializes the snackbar service
  ///
  /// Must be called before showing any snackbars, typically in your
  /// app's initialization code.
  static void init() {
    SnackbarXManager.instance.init();
  }

  /// Dismisses any currently showing snackbar
  static void dismiss() {
    SnackbarXManager.instance.dismiss();
  }
}