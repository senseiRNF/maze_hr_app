import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Local Secure Storage
///
/// This class serve as a secure storage to store any information that can be used later such as Token or Authorization Data
class LocalSecureStorage {
  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  /// Write Key
  ///
  /// This function serve as a command to store a nullable String into secure storage using a key from Local Secure Key
  static Future<bool> writeKey({required String key, String? data}) async {
    bool result = false;

    await _secureStorage.write(
      key: key,
      value: data,
    ).then((_) {
      result = true;
    });

    return result;
  }

  /// Read Key
  ///
  /// This function serve as a command to read data from secure storage using a key from Local Secure Key
  static Future<String?> readKey({required String key}) async {
    String? result;

    await _secureStorage.read(
      key: key,
    ).then((readResult) {
      result = readResult;
    });

    return result;
  }

  /// Delete Key
  ///
  /// This function serve as a command to remove data from secure storage using a key from Local Secure Key
  static Future<bool> deleteKey({required String key}) async {
    bool result = false;

    await _secureStorage.delete(
      key: key,
    ).then((_) {
      result = true;
    });

    return result;
  }

  /// Clear Key
  ///
  /// This function serve as a command to clear any stored data from secure storage
  static Future<bool> clearKey() async {
    bool result = false;

    await _secureStorage.deleteAll().then((_) {
      result = true;
    });

    return result;
  }
}

/// Local Secure Key
///
/// This class serve as an indentity of a key that used within Local Secure Storage
class LocalSecureKey {
  static String authKey = "auth";
}