import 'package:aplikasipendaftaranklinik/view/login.dart';
import 'package:aplikasipendaftaranklinik/view/pasien/homepage_pasien.dart';
import 'package:aplikasipendaftaranklinik/view/pasien/pendaftaran.dart';
import 'package:date_format/date_format.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Test Pendaftaran UI', (WidgetTester tester) async {
    await Firebase.initializeApp();

    await tester.pumpWidget(
      const MaterialApp(
        home: Login(),
      ),
    );

    await tester.pump(const Duration(seconds: 5));
    await tester.enterText(find.byType(TextFormField).first, 'farid@gmail.com');
    await tester.pump(const Duration(seconds: 5));
    await tester.enterText(find.byType(TextFormField).last, '123456');
    await tester.pump(const Duration(seconds: 5));

    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    await Future.delayed(Duration(seconds: 5));

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    await tester.tap(find.byType(DrawerButtonIcon));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    await tester.tap(find.text('Daftar Antrian'));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    expect(find.text('Ambil Antrian'), findsOneWidget);
    await tester.pumpAndSettle(const Duration(seconds: 5));

    await tester.tap(find.text('Pilih Poli'));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    await tester.tap(find.text('poli gigi'));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    await tester.tap(find.byIcon(Icons.calendar_month).last);
    await tester.pumpAndSettle(const Duration(seconds: 5));

    await tester.tap(find.text('AM'));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    var center = tester
        .getCenter(find.byKey(const ValueKey<String>('time-picker-dial')));
    await tester.tapAt(Offset(center.dx - 100, center.dy));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    await tester.tapAt(Offset(center.dx, center.dy - 100));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    await tester.tap(find.text('Daftar'));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle(const Duration(seconds: 5));
    expect(find.byType(HomePagePasien), findsOneWidget);

    await tester.tap(find.byType(DrawerButtonIcon));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    await tester.tap(find.text('Jadwal Pemeriksaan'));
    await tester.pumpAndSettle(const Duration(seconds: 5));
    await Future.delayed(const Duration(seconds: 5)); 

    expect(find.text('POLI POLI GIGI'), findsOneWidget);
    await tester.pumpAndSettle(const Duration(seconds: 5));
  });
}
