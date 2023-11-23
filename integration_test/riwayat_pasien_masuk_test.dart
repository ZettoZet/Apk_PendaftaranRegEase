import 'package:aplikasipendaftaranklinik/view/admin/riwayat_pasien_masuk.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Riwayat Pasien Masuk', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    //app.main();
    await Firebase.initializeApp();

    // Wait for the app to settle.
    await tester.pumpWidget(const MaterialApp(
      home: RiwayatPasienMasuk(),
    ));
    await tester.pumpAndSettle();
    await Future.delayed(const Duration(seconds: 8));

    expect(find.text('Nama Pasien'), findsWidgets);
    expect(find.text('Masuk'), findsWidgets);
    expect(find.text('Keluar'), findsWidgets);
    await tester.pumpAndSettle();
  });
}
