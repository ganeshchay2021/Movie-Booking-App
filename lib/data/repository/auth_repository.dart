import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_booking_app/data/database/database_method.dart';
import 'package:random_string/random_string.dart';

class AuthRepository {
  Future<Either<String, String>> register(
      {required String email,
      required String password,
      required String name}) async {
    try {
      final UserCredential _ = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      String id = randomAlphaNumeric(10);
      Map<String, dynamic> userInfoMap = {
        "id": id,
        "name": name,
        "email": email,
        "password": password
      };
      await DatabaseMethod().addUserDetails(userInfoMap, id);
      return const Left("User Registerd Successfully");
    } on FirebaseException catch (e) {
      if (e.code == 'weak-password') {
        return const Right("Password provided is weak");
      } else if (e.code == 'email-already-in-use') {
        return const Right("Email is already exist");
      } else {
        return Right(e.toString());
      }
    }
  }
}
