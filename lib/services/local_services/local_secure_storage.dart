import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:maze_hr_app/miscellaneous/classes/local_classes/auth_classes.dart';

FlutterSecureStorage secureStorage = const FlutterSecureStorage();

String userIdKey = 'userId';
String emailKey = 'email';
String usernameKey = 'username';
String roleKey = 'role';

class LocalSecureStorage {
  static Future<bool> writeKey(String key, String? data) async {
    bool result = false;

    await secureStorage.write(key: key, value: data).then((_) {
      result = true;
    });

    return result;
  }

  static Future<String?> readKey(String key) async {
    String? result;

    await secureStorage.read(key: key).then((readResult) {
      result = readResult;
    });

    return result;
  }

  static Future<bool> deleteKey(String key) async {
    bool result = false;

    await secureStorage.delete(key: key).then((_) {
      result = true;
    });

    return result;
  }
}

class LocalAuthorization {
  static void write(AuthClasses? data) async {
    if(data != null) {
      if(data.userId != null) {
        await LocalSecureStorage.writeKey(userIdKey, data.userId != null ? data.userId!.toString() : null);
      }

      if(data.email != null) {
        await LocalSecureStorage.writeKey(emailKey, data.email);
      }

      if(data.username != null) {
        await LocalSecureStorage.writeKey(usernameKey, data.username);
      }

      if(data.role != null) {
        await LocalSecureStorage.writeKey(roleKey, data.role);
      }
    }
  }

  static Future<AuthClasses?> read() async {
    AuthClasses? result;

    await LocalSecureStorage.readKey(userIdKey).then((userIdResult) async {
      await LocalSecureStorage.readKey(emailKey).then((emailResult) async {
        await LocalSecureStorage.readKey(usernameKey).then((usernameResult) async {
          await LocalSecureStorage.readKey(roleKey).then((roleResult) async {
            result = AuthClasses(
              userId: userIdResult != null ? int.parse(userIdResult) : null,
              email: emailResult,
              username: usernameResult,
              role: roleResult,
            );
          });
        });
      });
    });

    return result;
  }

  static Future<bool> delete() async {
    bool result = false;

    await secureStorage.deleteAll().then((_) {
      result = true;
    });

    return result;
  }
}