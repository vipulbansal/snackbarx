# SnackbarX

A lightweight, customizable Flutter package for displaying themed snackbars anywhere in your app without requiring BuildContext.

[![pub package](https://img.shields.io/pub/v/snackbarx.svg)](https://pub.dev/packages/snackbarx)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Features

- 🎨 **Multiple themes**: Success, error, and info variants with predefined colors and icons
- 🎯 **Flexible positioning**: Show snackbars at top, center, or bottom of screen
- ✨ **Rich animations**: Multiple animation types including slide, fade, scale, and combined effects
- 🎛️ **Highly customizable**: Override colors, icons, padding, margins, and more
- 🔧 **Interactive elements**: Support for action buttons and close buttons
- 🚀 **Easy to use**: No BuildContext required after initial setup
- 💾 **Memory efficient**: Proper resource management and cleanup
- 📱 **Safe area aware**: Respects device notches and system UI

## Preview

```dart
// Success snackbar - Green background with checkmark icon
SnackbarX.showSuccess('Operation completed successfully!');

// Error snackbar - Red background with error icon  
SnackbarX.showError('Something went wrong!');

// Info snackbar - Blue background with info icon
SnackbarX.showInfo('Here is some useful information');
```

**Visual appearance:**
- **Success**: Green background (#4CAF50) with white checkmark icon
- **Error**: Red background (#F44336) with white error icon  
- **Info**: Blue background (#2196F3) with white info icon

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  snackbarx: ^1.0.0
```

Then run:

```bash
flutter pub get
```

## Quick Start

### 1. Simple Setup (One-time)

Add the navigator key to your MaterialApp and initialize in main:

```dart
import 'package:flutter/material.dart';
import 'package:snackbarx/snackbarx.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize SnackbarX once at app startup
  SnackbarX.init();
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: SnackbarX.navigatorKey, // Add this line
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Show snackbar from anywhere - no context needed!
        SnackbarX.showSuccess('Operation completed successfully!');
      },
      child: Text('Show Success'),
    );
  }
}
```

### 2. Usage Examples

After setup, use SnackbarX anywhere in your app:

```dart
// Success message
SnackbarX.showSuccess('File saved successfully!');

// Error message
SnackbarX.showError('Connection failed');

// Info message
SnackbarX.showInfo('Update available');

// Use from any function, even without widgets
void saveData() {
  // ... save logic
  SnackbarX.showSuccess('Data saved!');
}
```

### 3. Alternative: Context-Based Usage

If you prefer not to use global setup, you can pass context directly:

```dart
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        SnackbarX.showSuccess(
          'Operation completed!',
          context: context, // Pass context directly
        );
      },
      child: Text('Show Success'),
    );
  }
}
```

## Advanced Usage

### Custom Configuration

Customize the appearance and behavior of your snackbars:

```dart
SnackbarX.showSuccess(
  'Custom styled message',
  config: SnackbarConfig(
    position: SnackbarPosition.top,
    duration: Duration(seconds: 5),
    backgroundColor: Colors.deepPurple,
    textColor: Colors.white,
    icon: Icons.star,
    iconColor: Colors.amber,
    borderRadius: BorderRadius.circular(20),
    showCloseButton: true,
    animationType: SnackbarAnimationType.scale,
  ),
);
```

### Action Buttons

Add interactive action buttons to your snackbars:

```dart
SnackbarX.showError(
  'Connection failed',
  config: SnackbarConfig(
    actionLabel: 'RETRY',
    onActionPressed: () {
      // Handle retry logic
      print('Retrying...');
    },
    showCloseButton: true,
  ),
);
```

### Different Positions

```dart
// Top position
SnackbarX.showInfo(
  'Message at the top',
  config: SnackbarConfig(position: SnackbarPosition.top),
);

// Center position
SnackbarX.showInfo(
  'Message in the center',
  config: SnackbarConfig(position: SnackbarPosition.center),
);

// Bottom position (default)
SnackbarX.showInfo('Message at the bottom');
```

### Animation Types

```dart
// Slide animation
SnackbarX.showSuccess(
  'Slides in smoothly',
  config: SnackbarConfig(animationType: SnackbarAnimationType.slideUp),
);

// Fade animation
SnackbarX.showSuccess(
  'Fades in gently',
  config: SnackbarConfig(animationType: SnackbarAnimationType.fade),
);

// Scale animation
SnackbarX.showSuccess(
  'Pops in with style',
  config: SnackbarConfig(animationType: SnackbarAnimationType.scale),
);

// Combined slide and fade
SnackbarX.showSuccess(
  'Best of both worlds',
  config: SnackbarConfig(animationType: SnackbarAnimationType.slideAndFade),
);
```

## Configuration Options

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `duration` | `Duration` | `Duration(seconds: 3)` | How long the snackbar stays visible |
| `position` | `SnackbarPosition` | `SnackbarPosition.bottom` | Position on screen (top/center/bottom) |
| `backgroundColor` | `Color?` | `null` | Custom background color |
| `textColor` | `Color?` | `null` | Custom text color |
| `icon` | `IconData?` | `null` | Custom icon |
| `iconColor` | `Color?` | `null` | Custom icon color |
| `actionLabel` | `String?` | `null` | Text for action button |
| `onActionPressed` | `VoidCallback?` | `null` | Action button callback |
| `actionTextColor` | `Color?` | `null` | Action button text color |
| `borderRadius` | `BorderRadius` | `BorderRadius.circular(8)` | Corner radius |
| `padding` | `EdgeInsets` | `EdgeInsets.symmetric(horizontal: 16, vertical: 12)` | Internal padding |
| `margin` | `EdgeInsets` | `EdgeInsets.all(16)` | External margin |
| `animationDuration` | `Duration` | `Duration(milliseconds: 250)` | Animation speed |
| `maxWidth` | `double?` | `600` | Maximum width |
| `minWidth` | `double?` | `null` | Minimum width |
| `elevation` | `double` | `6` | Shadow elevation |
| `showCloseButton` | `bool` | `false` | Show close button |
| `animationType` | `SnackbarAnimationType` | `slideUp` | Animation style |

## Enums

### SnackbarPosition
- `SnackbarPosition.top` - Display at top of screen
- `SnackbarPosition.center` - Display in center of screen
- `SnackbarPosition.bottom` - Display at bottom of screen

### SnackbarAnimationType
- `SnackbarAnimationType.slideUp` - Slide from edge
- `SnackbarAnimationType.fade` - Fade in/out
- `SnackbarAnimationType.scale` - Scale up/down
- `SnackbarAnimationType.slideAndFade` - Combined effect

### SnackbarType
- `SnackbarType.success` - Green themed success messages
- `SnackbarType.error` - Red themed error messages
- `SnackbarType.info` - Blue themed informational messages

## API Reference

### SnackbarX

#### Static Methods

##### `showSuccess(String message, {...})`
Shows a success-themed snackbar with green background and checkmark icon.

##### `showError(String message, {...})`
Shows an error-themed snackbar with red background and error icon.

##### `showInfo(String message, {...})`
Shows an info-themed snackbar with blue background and info icon.

##### `show(String message, SnackbarType type, {...})`
Shows a snackbar with specified type and configuration.

##### `init({GlobalKey<NavigatorState>? navigatorKey, TickerProvider? tickerProvider})`
Initializes the snackbar system. Must be called before showing snackbars.

##### `dismiss()`
Dismisses any currently visible snackbar.

#### Properties

##### `navigatorKey`
Global navigator key for accessing the overlay. Add this to your MaterialApp.

## Troubleshooting

### Common Issues

**"No Overlay found" error:**
```dart
// Make sure you added the navigator key to MaterialApp
MaterialApp(
  navigatorKey: SnackbarX.navigatorKey, // Required for global access
  home: MyHomePage(),
)
```

**Package not working:**
```dart
// Ensure you import the package
import 'package:snackbarx/snackbarx.dart';

// Use the simple API
SnackbarX.showSuccess('Your message here');
```

**Want smoother animations?**
```dart
// Pass a TickerProvider when available
class _MyPageState extends State<MyPage> with TickerProviderStateMixin {
  void showMessage() {
    SnackbarX.showSuccess(
      'Message with smooth animation',
      tickerProvider: this,
    );
  }
}
```

### Best Practices

1. **Add navigator key**: Required in MaterialApp for global access
2. **Keep messages short**: Concise text works best
3. **Use appropriate types**: Match success/error/info to context
4. **Optional ticker provider**: Only add if you want extra smooth animations
5. **No initialization needed**: Package auto-initializes on first use

## Example

Check out the [example](example/) folder for a complete working implementation showing all features.

## Contributing

We welcome contributions! Here's how you can help:

- **🐛 Report bugs** using our [bug report template](https://github.com/vipulbansal/snackbarx/issues/new?assignees=&labels=bug%2Ctriage&template=bug_report.yml)
- **💡 Request features** using our [feature request template](https://github.com/vipulbansal/snackbarx/issues/new?assignees=&labels=enhancement%2Cfeature-request&template=feature_request.yml)
- **❓ Ask questions** using our [question template](https://github.com/vipulbansal/snackbarx/issues/new?assignees=&labels=question%2Chelp-wanted&template=question.yml)
- **📝 Improve documentation** by submitting pull requests
- **🔧 Submit code changes** following our guidelines

Please read our [Contributing Guide](CONTRIBUTING.md) for detailed information about development setup, coding standards, and the pull request process.

## Issues and Support

### Reporting Issues

Before creating a new issue, please:

1. **Search existing issues** to avoid duplicates
2. **Check the documentation** and troubleshooting section
3. **Use the appropriate issue template**:
   - [Bug Report](https://github.com/vipulbansal/snackbarx/issues/new?assignees=&labels=bug%2Ctriage&template=bug_report.yml) - For bugs and unexpected behavior
   - [Feature Request](https://github.com/vipulbansal/snackbarx/issues/new?assignees=&labels=enhancement%2Cfeature-request&template=feature_request.yml) - For new feature suggestions  
   - [Question](https://github.com/vipulbansal/snackbarx/issues/new?assignees=&labels=question%2Chelp-wanted&template=question.yml) - For usage help and questions

### Getting Help

- 📖 Read the [documentation](#readme) and [API reference](#api-reference)
- 🔍 Check [existing issues](https://github.com/vipulbansal/snackbarx/issues) and discussions
- 💬 Join [GitHub Discussions](https://github.com/vipulbansal/snackbarx/discussions) for community help
- ❓ Create a [question issue](https://github.com/vipulbansal/snackbarx/issues/new?assignees=&labels=question%2Chelp-wanted&template=question.yml) if you need specific help

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for a detailed list of changes and updates.

## Support the Project

If you find SnackbarX helpful:

- ⭐ Star the repository on [GitHub](https://github.com/vipulbansal/snackbarx)
- 👍 Like the package on [pub.dev](https://pub.dev/packages/snackbarx)
- 📢 Share it with other developers
- 🤝 Contribute to the project

Your support helps maintain and improve SnackbarX for everyone!