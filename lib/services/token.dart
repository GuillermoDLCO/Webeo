
import 'package:injectable/injectable.dart';
import 'package:webeoapp/app/locator.dart';

import 'storage_service.dart';

@lazySingleton
class Token {
  final shared = locator<Storage>();
  Future<Map<String, String>> buildHeaders() async {
    String token = await shared.getString('token');
    return {'Content-Type': 'application/json', 'Accept': 'application/json', 'Authorization': 'Bearer $token'};
  }

  saveToken(String value) => shared.saveString('token', value);

  saveUserType(String value) => shared.saveString('userType', value);

  deleteToken() {
    shared.deleteString('token');
    shared.deleteString('userType');
  }

  Future<bool> hasToken() async {
    if (await shared.getString('token') != null) return true;
    return false;
  }

  Future<String> getUserType() async {
    return await shared.getString('userType');
  }
}
