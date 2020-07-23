import 'dart:convert';

import 'package:dbcrypt/dbcrypt.dart';
import 'package:crypto/crypto.dart';

class Crypt {
  static String hashPin(String data) =>
      new DBCrypt().hashpw(data, new DBCrypt().gensalt());
  static bool verifyPin(String data, String hash) =>
      new DBCrypt().checkpw(data, hash);
  static String hashSHA256(String data) {
    var bytes = utf8.encode(data);
    return '${sha256.convert(bytes)}';
  }
  
}
