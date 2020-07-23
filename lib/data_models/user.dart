import 'enums/user_type.dart';

class User {
  String name;
  String googleID;
  String documentNumber;
  String phone;
  String email;
  String image;
  UserType userType;

  User({this.name, this.googleID, this.documentNumber, this.phone, this.email, this.image, this.userType});

  User.fromMap(Map<String, dynamic> data) {
    name = data['nombre'] ?? '';
    googleID = data['_id'] ?? '';
    documentNumber = data['ci'] ?? '';
    phone = data['telefono'] ?? '';
    email = data['usuario'] ?? '';
    image = data['imagen'] ?? '';
    userType = UserType.User;
  }
}
