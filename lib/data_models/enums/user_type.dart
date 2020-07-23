enum UserType {
  User,
  Client,
}

class UserTypeHelper {
  static UserType getUserFromString(String userType) {
    for (UserType element in UserType.values) {
      if (element.toString().split('.')[1].toLowerCase() == userType.toLowerCase()) {
        return element;
      }
    }
    return null;
  }
}
