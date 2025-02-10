import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_booking_app/data/database/database_method.dart';
import 'package:movie_booking_app/data/utils/storage_utils.dart';
import 'package:random_string/random_string.dart';

class AuthRepository {
  //Method for user registration
  Future<Either<void, String>> register(
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
        "image":
            "https://upload.wikimedia.org/wikipedia/commons/e/e0/Userimage.png"
      };

      //saving data in sharedpreference
      await StorageUtils.saveUserId(id);
      await StorageUtils.saveUserEmail(email);
      await StorageUtils.saveUserName(name);
      await StorageUtils.saveUserImage(
          "https://upload.wikimedia.org/wikipedia/commons/e/e0/Userimage.png");

      await DatabaseMethod().addUserDetails(userInfoMap, id);
      return const Left(null);
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

  //Method for user login
  Future<Either<void, String>> login(
      {required String email, required String password}) async {
    try {
      final UserCredential _ = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      QuerySnapshot querySnapshot =
          await DatabaseMethod().getUserByEmail(email);

      //Fetching data for firebase database
      String userId = "${querySnapshot.docs[0]["id"]}";
      String userEmail = "${querySnapshot.docs[0]["email"]}";
      String userName = "${querySnapshot.docs[0]["name"]}";
      String userImage = "${querySnapshot.docs[0]["image"]}";

      //storing data in sharedprefence
      await StorageUtils.saveUserId(userId);
      await StorageUtils.saveUserEmail(userEmail);
      await StorageUtils.saveUserName(userName);
      await StorageUtils.saveUserImage(userImage);

      return const Left(null);
    } on FirebaseException catch (e) {
      return const Right("Invalid Credential");
    } catch (e) {
      return Right(e.toString());
    }
  }
}
