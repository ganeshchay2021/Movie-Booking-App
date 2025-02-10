import 'package:shared_preferences/shared_preferences.dart';

class StorageUtils {
  // Creating key-value pairs
  static const String _id = "id";
  static const String _emailKey = "email";
  static const String _name = "name";
  static const String _image = "image";


  static Future<bool> saveUserId(String id) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    return storage.setString(_id, id);
  }

  static Future<bool> saveUserEmail(String email) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    return storage.setString(_emailKey, email);
  }

  static Future<bool> saveUserName(String name) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    return storage.setString(_name, name);
  }

  static Future<bool> saveUserImage(String image) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    return storage.setString(_image, image);
  }

  // Get methods for retrieving data

  static Future<String?> getUserId() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    return storage.getString(_id);  // Returns null if no value is found
  }

  static Future<String?> getUserEmail() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    return storage.getString(_emailKey);  // Returns null if no value is found
  }

  static Future<String?> getUserName() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    return storage.getString(_name);  // Returns null if no value is found
  }

  static Future<String?> getUserImage() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    return storage.getString(_image);  // Returns null if no value is found
  }
}
