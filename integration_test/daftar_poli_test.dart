import 'package:aplikasipendaftaranklinik/view/admin/poli/poli.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Daftar Poli', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    //app.main();
    await Firebase.initializeApp();

    // Wait for the app to settle.
    await tester.pumpWidget(const MaterialApp(
      home: Poli(),
    ));
    await tester.pumpAndSettle();
    await Future.delayed(const Duration(seconds: 8));

    await tester.tap(find.byType(FloatingActionButton));
    await Future.delayed(const Duration(seconds: 2));
    await tester.pumpAndSettle();

    expect(find.text('Poli'), findsWidgets);
    await Future.delayed(const Duration(seconds: 2));

    await tester.enterText(find.byType(TextFormField).first, 'poli umum');
    await Future.delayed(const Duration(seconds: 2));
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();

    await Future.delayed(const Duration(seconds: 8));
    await tester.tap(find.byType(ElevatedButton));
    await Future.delayed(const Duration(seconds: 8));

    await tester.pumpAndSettle();
  });
}
