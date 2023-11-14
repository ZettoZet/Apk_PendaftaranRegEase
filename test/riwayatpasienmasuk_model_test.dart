import 'package:aplikasipendaftaranklinik/model/riwayatpasienmasuk_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Data dimasukkan dengan valid parameter
  test('new_instance_with_valid_parameters', () {
    String uId = '123';
    String selesaiantrian = 'completed';

    // Act
    RiwayatPasienMasukModel riwayatPasienMasukModel = RiwayatPasienMasukModel(
      uId: uId,
      selesaiantrian: selesaiantrian,
    );

    // Assert
    expect(riwayatPasienMasukModel.uId, equals(uId));
    expect(riwayatPasienMasukModel.selesaiantrian, equals(selesaiantrian));
  });

// Data valid dimasukkan ke dalam map di database
  test('test_toMap_method_on_valid_instance', () {
    String uId = '123';
    String selesaiantrian = 'completed';
    RiwayatPasienMasukModel riwayatPasienMasukModel = RiwayatPasienMasukModel(
      uId: uId,
      selesaiantrian: selesaiantrian,
    );

    // Act
    Map<String, dynamic> map = riwayatPasienMasukModel.toMap();

    // Assert
    expect(map['uId'], equals(uId));
    expect(map['selesaiantrian'], equals(selesaiantrian));
  });

//Data diconvert ke dalam bentuk json
  test('test_convert_to_json', () {
    String uId = '123';
    String selesaiantrian = 'completed';
    RiwayatPasienMasukModel riwayatPasienMasukModel = RiwayatPasienMasukModel(
      uId: uId,
      selesaiantrian: selesaiantrian,
    );

    // Act
    String json = riwayatPasienMasukModel.toJson();

    // Assert
    expect(json, equals('{"uId":"123","selesaiantrian":"completed"}'));
  });
}
