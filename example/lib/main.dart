import 'package:flutter/material.dart';
import 'package:snackbarx/models/snackbar_config.dart';
import 'package:snackbarx/snackbarx.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the custom snackbar
  SnackbarX.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Snackbar Demo',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom Snackbar Demo')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Custom Snackbar Examples',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),

              // Default Snackbars
              ElevatedButton(
                onPressed: () {
                  SnackbarX.showSuccess('Operation completed successfully!');
                },
                child: const Text('Show Success Snackbar'),
              ),
              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: () {
                  SnackbarX.showError(
                    'An error occurred. Please try again.',
                    config: SnackbarConfig(
                      maxWidth: 300,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 0,
                      ),
                    ),
                  );
                },
                child: const Text('Show Error Snackbar'),
              ),
              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: () {
                  SnackbarX.showInfo('This is an informational message.');
                },
                child: const Text('Show Info Snackbar'),
              ),

              const Divider(height: 48),

              // Custom Snackbars
              ElevatedButton(
                onPressed: () {
                  SnackbarX.showSuccess(
                    'File uploaded successfully!',
                    config: const SnackbarConfig(
                      duration: Duration(seconds: 5),
                      position: SnackbarPosition.top,
                      showCloseButton: true,
                    ),
                  );
                },
                child: const Text('Custom Position (Top)'),
              ),
              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: () {
                  SnackbarX.showError(
                    'Connection lost',
                    config: SnackbarConfig(
                      actionLabel: 'RETRY',
                      onActionPressed: () {
                        SnackbarX.showInfo('Retrying connection...');
                      },
                      animationType: SnackbarAnimationType.slideAndFade,
                    ),
                  );
                },
                child: const Text('With Action Button'),
              ),
              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: () {
                  SnackbarX.showInfo(
                    'This message will stay until dismissed',
                    config: const SnackbarConfig(
                      duration: Duration(days: 1),
                      showCloseButton: true,
                      animationType: SnackbarAnimationType.scale,
                    ),
                  );
                },
                child: const Text('Persistent with Animation'),
              ),
              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: () {
                  SnackbarX.showInfo(
                    'Custom styling example',
                    config: SnackbarConfig(
                      backgroundColor: Colors.deepPurple,
                      icon: Icons.star,
                      iconColor: Colors.amber,
                      borderRadius: BorderRadius.circular(24),
                      position: SnackbarPosition.center,
                    ),
                  );
                },
                child: const Text('Custom Styling'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
