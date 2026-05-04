import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:snackbarx/models/snackbar_config.dart';
import 'package:snackbarx/snackbarx.dart';

void main() {
  setUp(() {
    SnackbarX.dismiss();
  });

  testWidgets('showSuccess displays message with navigatorKey', (
    WidgetTester tester,
  ) async {
    SnackbarX.init();
    await tester.pumpWidget(
      MaterialApp(
        navigatorKey: SnackbarX.navigatorKey,
        home: Scaffold(
          body: Center(
            child: ElevatedButton(
              onPressed: () => SnackbarX.showSuccess(
                'Hello from SnackbarX',
                config: const SnackbarConfig(duration: Duration.zero),
              ),
              child: const Text('Show'),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Show'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));

    expect(find.text('Hello from SnackbarX'), findsOneWidget);

    SnackbarX.dismiss();
    await tester.pumpAndSettle();
  });

  testWidgets('showSuccess with explicit context', (WidgetTester tester) async {
    SnackbarX.init();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () => SnackbarX.showSuccess(
                  'With context',
                  context: context,
                  config: const SnackbarConfig(duration: Duration.zero),
                ),
                child: const Text('Show'),
              );
            },
          ),
        ),
      ),
    );

    await tester.tap(find.text('Show'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));

    expect(find.text('With context'), findsOneWidget);

    SnackbarX.dismiss();
    await tester.pumpAndSettle();
  });
}
