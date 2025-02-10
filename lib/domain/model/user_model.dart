
class UserModel {
  final String id;
  final String email;
  final String password;
  final String name;

  UserModel({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "password": password,
    };
  }
}
