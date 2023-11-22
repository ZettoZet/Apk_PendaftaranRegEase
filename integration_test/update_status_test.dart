import 'package:aplikasipendaftaranklinik/view/admin/daftar_antrian_a.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test DaftarAntrianPagesAdmin UI', (WidgetTester tester) async {
    await Firebase.initializeApp();

    // Build the widget hierarchy
    await tester.pumpWidget(
      const MaterialApp(
        home: DaftarAntrianPagesAdmin(),
      ),
    );

    await tester.pumpAndSettle();

    // Verify the presence of certain widgets or texts
    expect(find.text('No. Antrian'), findsWidgets);
    expect(find.text('Nama Pemesan'), findsWidgets);
    expect(find.text('Waktu Pemeriksaan'), findsWidgets);
    expect(find.text('Status'), findsWidgets);

    await tester.pumpAndSettle();

    // Perform interaction testing: simulate tap on a status dropdown
    await tester.tap(find.byType(GestureDetector).at(1));

    await tester.pumpAndSettle();

    // Verify if the status dropdown dialog is shown
    expect(find.text('Edit Status Antrian'), findsOneWidget);
    expect(find.text('Pilih Status Antrian'), findsOneWidget);

    await tester.tap(find.text('Pilih Status Antrian'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('dropdown_item_Selesai')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Simpan'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();
    await Future.delayed(const Duration(seconds: 5));

    // You can perform more interactions and assertions based on your specific use cases
  });
}
