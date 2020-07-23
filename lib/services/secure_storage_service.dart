import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SecureStorage {
  final _secureStorage = FlutterSecureStorage();

  Future<bool> save(key, value) async {
    try {
      await _secureStorage.write(key: key, value: value);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> delete(key) async {
    try {
      await _secureStorage.delete(key: key);
      return true;
    } catch (e) {
      return false;
    }
  }

  deleteAll() async {
    await _secureStorage.deleteAll();
  }

  Future<String> getString(key) async {
    String value = await _secureStorage.read(key: key);
    return value;
  }
}
