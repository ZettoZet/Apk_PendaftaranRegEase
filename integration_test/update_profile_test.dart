import 'package:aplikasipendaftaranklinik/main.dart' as app;
import 'package:aplikasipendaftaranklinik/utils/constants.dart';
import 'package:aplikasipendaftaranklinik/view/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Update Profile', (WidgetTester tester) async {
    await Firebase.initializeApp();

    // Build the widget hierarchy
    app.main();
    await tester.pumpWidget(
      const MaterialApp(
        home: Login(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text(textEmail), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);

    // Tap on the email and password text fields to enter values.
    await Future.delayed(const Duration(seconds: 5));
    await tester.enterText(find.byType(TextFormField).first, 'puput@mail.com');
    await Future.delayed(const Duration(seconds: 2));
    await tester.enterText(find.byType(TextFormField).last, 'Puput1414');
    await Future.delayed(const Duration(seconds: 2));

    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    // Tap on the login button.
    await tester.tap(find.byType(ElevatedButton));
    await Future.delayed(const Duration(seconds: 5));

    // Wait for the login process to complete.
    await tester.pumpAndSettle();

    await tester.tap(find.byType(DrawerButton));

    await tester.pumpAndSettle();

    await Future.delayed(const Duration(seconds: 5));

    await tester.tap(find.byType(ListView).first);

    await tester.pumpAndSettle();

    await Future.delayed(const Duration(seconds: 5));
    await tester.pumpAndSettle();
    await Future.delayed(const Duration(seconds: 5));
    await tester.enterText(find.byType(TextFormField).first, 'Raihan');

    await tester.pumpAndSettle();

    await Future.delayed(const Duration(seconds: 2));
    expect(find.text(textEmail), findsWidgets);

    await tester.pumpAndSettle();

    await Future.delayed(const Duration(seconds: 2));
    await tester.enterText(find.byType(TextFormField).at(2), '08123456');

    await tester.pumpAndSettle();

    await Future.delayed(const Duration(seconds: 2));
    expect(find.text(textTglLahir), findsWidgets);

    await tester.pumpAndSettle();

    await Future.delayed(const Duration(seconds: 2));
    await tester.enterText(find.byType(TextFormField).last, 'Tangerang');

    await tester.pumpAndSettle();

    // You can perform more interactions and assertions based on your specific use cases
  });
}
