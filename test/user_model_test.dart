import 'package:aplikasipendaftaranklinik/model/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Data dimasukkan dengan valid parameter
  test('create_usermodel_with_valid_parameters', () {
    UserModel user = UserModel(
        uId: '123',
        nama: 'John Doe',
        email: 'johndoe@example.com',
        role: 'user',
        nomorhp: '1234567890',
        tglLahir: '1990-01-01',
        alamat: '123 Main St',
        noAntrian: 1,
        poli: 'General');

    expect(user.uId, '123');
    expect(user.nama, 'John Doe');
    expect(user.email, 'johndoe@example.com');
    expect(user.role, 'user');
    expect(user.nomorhp, '1234567890');
    expect(user.tglLahir, '1990-01-01');
    expect(user.alamat, '123 Main St');
    expect(user.noAntrian, 1);
    expect(user.poli, 'General');
  });

// Data dimasukkan ke dalam map di database
  test('test_convert_usermodel_to_map_and_back', () {
    UserModel user = UserModel(
        uId: '123',
        nama: 'John Doe',
        email: 'johndoe@example.com',
        role: 'user',
        nomorhp: '1234567890',
        tglLahir: '1990-01-01',
        alamat: '123 Main St',
        noAntrian: 1,
        poli: 'General');

    Map<String, dynamic> userMap = user.toMap();
    UserModel newUser = UserModel.fromMap(userMap);

    expect(newUser.uId, user.uId);
    expect(newUser.nama, user.nama);
    expect(newUser.email, user.email);
    expect(newUser.role, user.role);
    expect(newUser.nomorhp, user.nomorhp);
    expect(newUser.tglLahir, user.tglLahir);
    expect(newUser.alamat, user.alamat);
    expect(newUser.noAntrian, user.noAntrian);
    expect(newUser.poli, user.poli);
  });

//Data diconvert ke dalam bentuk json
  test('test_convert_usermodel_to_json_and_back', () {
    UserModel user = UserModel(
        uId: '123',
        nama: 'John Doe',
        email: 'johndoe@example.com',
        role: 'user',
        nomorhp: '1234567890',
        tglLahir: '1990-01-01',
        alamat: '123 Main St',
        noAntrian: 1,
        poli: 'General');

    String userJson = user.toJson();
    UserModel newUser = UserModel.fromJson(userJson);

    expect(newUser.uId, user.uId);
    expect(newUser.nama, user.nama);
    expect(newUser.email, user.email);
    expect(newUser.role, user.role);
    expect(newUser.nomorhp, user.nomorhp);
    expect(newUser.tglLahir, user.tglLahir);
    expect(newUser.alamat, user.alamat);
    expect(newUser.noAntrian, user.noAntrian);
    expect(newUser.poli, user.poli);
  });

//Data dimasukkan jika terdapat data kosong
  test('test_create_usermodel_with_null_or_empty_parameters', () {
    UserModel user = UserModel(
        uId: '123',
        nama: '',
        email: 'johndoe@example.com',
        role: 'user',
        nomorhp: '',
        tglLahir: '',
        alamat: '',
        noAntrian: 1,
        poli: 'General');

    expect(user.uId, '123');
    expect(user.nama, '');
    expect(user.email, 'johndoe@example.com');
    expect(user.role, 'user');
    expect(user.nomorhp, '');
    expect(user.tglLahir, '');
    expect(user.alamat, '');
    expect(user.noAntrian, 1);
    expect(user.poli, 'General');
  });
}
