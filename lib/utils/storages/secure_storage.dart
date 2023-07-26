import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../models/profile/profile_model.dart';

class SecureStorage {
  final _secureStorage = const FlutterSecureStorage();

  static const _authenticationTokenKey = 'AUTHENTICATION_TOKEN';
  static const _deviceTokenKey = 'DEVICE_TOKEN';
  static const _authenticationUserKey = 'AUTHENTICATION_USER_KEY';

  static const _walletAddedKey = 'WALLET_ADDED';

  static const _selectedCompanyId = 'COMPANY_ID';

  Future<bool> hasAuthenticationToken() async {
    try {
      final _authenticationTokenString = await _secureStorage.read(
        key: _authenticationTokenKey,
      );

      if (_authenticationTokenString == null) {
        return false;
      }

      return true;
    } catch (e) {
      return false;
    }
  }

  setDeviceToken({
    required String deviceToken,
  }) async {
    try {
      await _secureStorage.write(
        key: _deviceTokenKey,
        value: deviceToken,
      );

      return true;
    } catch (e) {
      return false;
    }
  }

  deleteDeviceToken() async {
    try {
      await _secureStorage.delete(
        key: _deviceTokenKey,
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<String?> getDeviceToken() async {
    try {
      final _authenticationTokenString = await _secureStorage.read(
        key: _deviceTokenKey,
      );

      return _authenticationTokenString;
    } catch (e) {
      return null;
    }
  }

  Future<bool> setAuthenticationToken({
    required String authenticationToken,
  }) async {
    try {
      await _secureStorage.write(
        key: _authenticationTokenKey,
        value: authenticationToken,
      );

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteAuthenticationToken() async {
    try {
      await Future.wait([
        _secureStorage.delete(
          key: _authenticationTokenKey,
        ),
        _secureStorage.delete(
          key: _authenticationUserKey,
        )
      ]);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<String?> getAuthenticationToken() async {
    try {
      final authenticationTokenString = await _secureStorage.read(
        key: _authenticationTokenKey,
      );

      return authenticationTokenString;
    } catch (e) {
      return null;
    }
  }

  Future<bool> setLoggedInUser(Map<String, dynamic> userData) async {
    try {
      await _secureStorage.write(
        key: _authenticationUserKey,
        value: jsonEncode(userData),
      );

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<ProfileModel?> getLoggedInUser() async {
    try {
      final loggedUser = await _secureStorage.read(
        key: _authenticationUserKey,
      );
      final user = ProfileModel.fromJson(jsonDecode(loggedUser!));
      return user;
    } catch (e) {
      return null;
    }
  }

  Future<bool> isWalletAdd() async {
    try {
      final wallet = await _secureStorage.read(
        key: _walletAddedKey,
      );

      return wallet != null;
    } catch (e) {
      return false;
    }
  }

  Future<void> deleteAllData() async {
    try {
      _secureStorage.deleteAll();
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> saveCompanyId({required String companyId}) async {
    try {
      await _secureStorage.write(
        key: _selectedCompanyId,
        value: companyId,
      );

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<String?> getCompanyId() async {
    try {
      final companyId = await _secureStorage.read(
        key: _selectedCompanyId,
      );

      return companyId;
    } catch (e) {
      return null;
    }
  }
}
