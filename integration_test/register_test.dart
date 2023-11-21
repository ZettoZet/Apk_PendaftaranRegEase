import 'dart:io';

import 'package:aplikasipendaftaranklinik/utils/constants.dart';
import 'package:aplikasipendaftaranklinik/view/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:aplikasipendaftaranklinik/view/register.dart';

void main() {
  testWidgets('Register widget UI test', (WidgetTester tester) async {
    await Firebase.initializeApp();

    await tester.pumpWidget(const MaterialApp(
      home: Register(),
    ));

    // Verify the presence of certain widgets, fields, or buttons
    expect(find.text('Nama'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Register'), findsOneWidget);
    expect(find.text(textLogin), findsOneWidget);

    // Perform interaction testing: entering text and tapping buttons
    await tester.enterText(find.byType(TextFormField).first, 'faridd');
    await tester.enterText(
        find.byType(TextFormField).at(1), 'faridddddd@faridd.com');
    await tester.enterText(find.byType(TextFormField).last, '123456');

    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();

    await tester.tap(find.text('Register'));

    await tester.pumpAndSettle();

    await tester.pumpAndSettle();
    await Future.delayed(const Duration(seconds: 10));

    // Verify the dialog after registration
    expect(find.text('Registrasi Berhasil'), findsOneWidget);
    expect(find.text('OK'), findsOneWidget);
    await tester.pumpAndSettle();

    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    expect(find.byType(Login), findsOneWidget);
    await tester.pumpAndSettle();
    await Future.delayed(const Duration(seconds: 10));
  });
}
