import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_booking_app/data/utils/storage_utils.dart';
import 'package:movie_booking_app/domain/constant/assets.dart';
import 'package:movie_booking_app/domain/constant/ui_helper.dart';
import 'package:movie_booking_app/pages/botton%20nav%20bar/bottom_nav_bar.dart';
import 'package:movie_booking_app/pages/login/widget/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () async {
      String? email = await StorageUtils.getUserEmail();
      String? id = await StorageUtils.getUserId();
      String? name = await StorageUtils.getUserName();
      String? image = await StorageUtils.getUserImage();

      if (email == "" && id == "" && name == "" && image == "") {
        Navigator.pushReplacement(
          (context),
          CupertinoPageRoute(
            builder: (context) => const Login(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
            builder: (context) => const BottomNavBar(),
          ),
        );
      }
    });
  }
 
  initialization() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: UiHelper.assetImage(image: Assets.logo, height: 100),
      ),
    );
  }
}
