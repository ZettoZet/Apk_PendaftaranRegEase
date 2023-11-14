import 'package:aplikasipendaftaranklinik/model/pendaftaranpasien_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Data dimasukkan dengan valid parameter
  test('new_instance_with_valid_parameters', () {
    PendaftaranPasienModel model = PendaftaranPasienModel(
        noAntrian: 1,
        status: "Active",
        waktuantrian: "10:00 AM",
        tanggalantrian: "2022-01-01",
        poli: "General");

    expect(model.noAntrian, equals(1));
    expect(model.status, equals("Active"));
    expect(model.waktuantrian, equals("10:00 AM"));
    expect(model.tanggalantrian, equals("2022-01-01"));
    expect(model.poli, equals("General"));
  });

// Data dimasukkan ke dalam map di database
  test('test_to_map_method', () {
    PendaftaranPasienModel model = PendaftaranPasienModel(
      noAntrian: 1,
      status: 'Active',
      waktuantrian: '10:00 AM',
      tanggalantrian: '2022-01-01',
      poli: 'General',
    );

    Map<String, dynamic> map = model.toMap();

    expect(map['noAntrian'], 1);
    expect(map['status'], 'Active');
    expect(map['waktuantrian'], '10:00 AM');
    expect(map['tanggalantrian'], '2022-01-01');
    expect(map['poli'], 'General');
  });

//Data dimasukkan dengan no Antrian 0
  test('test_create_instance_with_zero_noAntrian', () {
    PendaftaranPasienModel model = PendaftaranPasienModel(
      noAntrian: 0,
      status: 'active',
      waktuantrian: '09:00',
      tanggalantrian: '2022-01-01',
      poli: 'General',
    );

    expect(model.noAntrian, equals(0));
    expect(model.status, equals('active'));
    expect(model.waktuantrian, equals('09:00'));
    expect(model.tanggalantrian, equals('2022-01-01'));
    expect(model.poli, equals('General'));
  });

//Data dimasukkan jika status dikosongkan
  test('test_create_instance_with_empty_status', () {
    PendaftaranPasienModel model = PendaftaranPasienModel(
      noAntrian: 1,
      status: '',
      waktuantrian: '09:00',
      tanggalantrian: '2022-01-01',
      poli: 'General',
    );

    expect(model.noAntrian, equals(1));
    expect(model.status, equals(''));
    expect(model.waktuantrian, equals('09:00'));
    expect(model.tanggalantrian, equals('2022-01-01'));
    expect(model.poli, equals('General'));
  });

  //Data dimasukkan jika poli dikosongkan
  test('test_create_instance_with_empty_poli', () {
    PendaftaranPasienModel model = PendaftaranPasienModel(
      noAntrian: 1,
      status: 'selesai',
      waktuantrian: '09:00',
      tanggalantrian: '2022-01-01',
      poli: '',
    );

    expect(model.noAntrian, equals(1));
    expect(model.status, equals('selesai'));
    expect(model.waktuantrian, equals('09:00'));
    expect(model.tanggalantrian, equals('2022-01-01'));
    expect(model.poli, equals(''));
  });
}
