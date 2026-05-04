import 'package:flutter_test/flutter_test.dart';

import 'package:example/main.dart';

void main() {
  testWidgets('example app loads', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Custom Snackbar Demo'), findsOneWidget);
    expect(find.text('Custom Snackbar Examples'), findsOneWidget);
  });
}
