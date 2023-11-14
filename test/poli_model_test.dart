import 'package:aplikasipendaftaranklinik/model/poli_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Data dimasukkan dengan valid nama poli
  test('test_create_instance_with_valid_namaPoli', () {
    const namaPoli = 'Dentist';

    // Act
    final poliModel = PoliModel(namaPoli: namaPoli);

    // Assert
    expect(poliModel.namaPoli, equals(namaPoli));
  });

// Data dimasukkan ke dalam map di database
  test('test_convert_instance_to_map', () {
    const uId = '123';
    const namaPoli = 'Dentist';
    final poliModel = PoliModel(uId: uId, namaPoli: namaPoli);

    // Act
    final map = poliModel.toMap();

    // Assert
    expect(map['uId'], equals(uId));
    expect(map['namaPoli'], equals(namaPoli));
  });

//Data dimasukkan jika nama poli dikosongkan
  test('test_create_instance_with_empty_name', () {
    String name = "";

    // Act
    PoliModel poli = PoliModel(namaPoli: name);

    // Assert
    expect(poli.namaPoli, name);
    expect(poli.uId, isNull);
  });
}
