# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.1.1] - 2026-05-05

### Changed

- Updated example Android Kotlin Gradle plugin to `2.1.0` to stay compatible with newer Flutter Android build dependency validation.
- Packaging and release metadata cleanup for pub.dev publish readiness.

## [1.1.0] - 2026-05-04

### Added

- `SnackbarX.navigatorKey` for `MaterialApp.navigatorKey` and context-free `show*` calls after `SnackbarX.init()`.
- Optional `BuildContext? context` on `showSuccess`, `showError`, `showInfo`, and `show` when not using the default navigator key.

### Fixed

- Resolve overlay via `NavigatorState.overlay` when using a `GlobalKey<NavigatorState>` (avoids invalid `Overlay.of(navigatorContext)` usage).
- Resolve `TickerProvider` from the navigator above the overlay when the configured key is not used.

### Changed

- Raised minimum SDK to Dart **3.11.5** and Flutter **3.41.0** (aligned with current stable tooling).
- `flutter_lints` **^6.0.0**; example uses scrollable body to avoid layout overflow in tests; root and example tests updated.

## [1.0.0] - 2024-06-01
## [1.0.1] - 2024-06-01
- Updated Readme.

### Added
- Initial release of SnackbarX package
- Support for three snackbar types: success, error, and info
- Multiple positioning options: top, center, and bottom
- Four animation types: slideUp, fade, scale, and slideAndFade
- Highly customizable configuration system
- Action button support for interactive snackbars
- Close button functionality
- Singleton manager pattern for reliable state management
- Memory-efficient resource cleanup
- Safe area awareness for modern devices
- Comprehensive documentation and examples

### Features
- **Core Functionality**
  - `SnackbarX.showSuccess()` - Display success messages
  - `SnackbarX.showError()` - Display error messages
  - `SnackbarX.showInfo()` - Display informational messages
  - `SnackbarX.show()` - Generic method for custom types
  - `SnackbarX.init()` - Initialize the snackbar system
  - `SnackbarX.dismiss()` - Programmatically dismiss snackbars

- **Customization Options**
  - Custom background and text colors
  - Custom icons and icon colors
  - Configurable border radius and elevation
  - Adjustable padding and margins
  - Duration control for auto-dismiss
  - Maximum and minimum width constraints

- **Animation System**
  - Smooth slide transitions from any edge
  - Fade in/out effects
  - Scale animations for modern feel
  - Combined slide and fade animations
  - Configurable animation duration and curves

- **Interactive Elements**
  - Action buttons with custom labels and callbacks
  - Close buttons for manual dismissal
  - Touch-friendly button sizing
  - Accessible button constraints

- **Technical Features**
  - Overlay-based rendering system
  - Navigator key integration
  - TickerProvider support for smooth animations
  - Proper animation controller lifecycle management
  - Memory leak prevention through resource cleanup
  - Error handling for edge cases

### Dependencies
- Flutter SDK: >=3.0.0
- Dart SDK: >=2.17.0 <4.0.0

### Documentation
- Complete README with installation and usage instructions
- API reference documentation
- Troubleshooting guide
- Best practices recommendations
- Example application demonstrating all features

### Example Application
- Comprehensive demo showcasing all snackbar types
- Animation examples for each available type
- Positioning demonstrations
- Interactive element examples
- Custom styling demonstrations

[1.1.1]: https://github.com/vipulbansal/snackbarx/releases/tag/v1.1.1
[1.1.0]: https://github.com/vipulbansal/snackbarx/releases/tag/v1.1.0
[1.0.0]: https://github.com/vipulbansal/snackbarx/releases/tag/v1.0.0