import 'package:aplikasipendaftaranklinik/main.dart' as app;
import 'package:aplikasipendaftaranklinik/utils/constants.dart';
import 'package:aplikasipendaftaranklinik/view/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Logout', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    app.main();
    await Firebase.initializeApp();

    // Wait for the app to settle.
    await tester.pumpWidget(const MaterialApp(
      home: Login(),
    ));
    await tester.pumpAndSettle();

    // // Verify that the Login screen is displayed.
    //expect(find.text(titleLogin), findsOneWidget);
    expect(find.text(textEmail), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);

    // Tap on the email and password text fields to enter values.
    await Future.delayed(const Duration(seconds: 5));
    await tester.enterText(find.byType(TextFormField).first, 'puputs@mail.com');
    await Future.delayed(const Duration(seconds: 2));
    await tester.enterText(find.byType(TextFormField).last, '123123');
    await Future.delayed(const Duration(seconds: 2));

    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    // Tap on the login button.
    await tester.tap(find.byType(ElevatedButton));
    await Future.delayed(const Duration(seconds: 2));

    // Wait for the login process to complete.
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('logout')));
    await Future.delayed(const Duration(seconds: 2));
    await tester.pumpAndSettle();

    expect(find.text('YA'), findsOneWidget);
    await Future.delayed(const Duration(seconds: 8));

    await tester.tap(find.text('YA'));
    await tester.pumpAndSettle();
    await Future.delayed(const Duration(seconds: 2));
  });
}
