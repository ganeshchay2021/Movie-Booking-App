import 'package:flutter/material.dart';
import 'package:movie_booking_app/domain/constant/assets.dart';
import 'package:movie_booking_app/domain/constant/ui_helper.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool showPassword = true;
  bool showConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: UiHelper.customBackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xff14141d),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UiHelper.assetImage(image: Assets.signin),
            const SizedBox(
              height: 10,
            ),
            Form(
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UiHelper.customText(
                      text: "Sign Up",
                      color: Colors.white,
                      fontsize: 45.0,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    UiHelper.customText(
                      text: "Name",
                      color: const Color.fromRGBO(255, 255, 255, 0.616),
                      fontsize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    UiHelper.customTextfield(
                      hintText: "Enter name",
                      controller: emailController,
                      icon: Icons.person,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    UiHelper.customText(
                      text: "Email",
                      color: const Color.fromRGBO(255, 255, 255, 0.616),
                      fontsize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    UiHelper.customTextfield(
                      hintText: "Enter email",
                      controller: emailController,
                      icon: Icons.email,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    UiHelper.customText(
                      text: "Password",
                      color: const Color.fromRGBO(255, 255, 255, 0.616),
                      fontsize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    UiHelper.customTextfield(
                      onTap: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                      hintText: "Enter password",
                      controller: passwordController,
                      icon: showPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      obscureText: showPassword,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    UiHelper.customText(
                      text: "Confirm Password",
                      color: const Color.fromRGBO(255, 255, 255, 0.616),
                      fontsize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    UiHelper.customTextfield(
                      onTap: () {
                        setState(() {
                          showConfirmPassword = !showConfirmPassword;
                        });
                      },
                      hintText: "Enter Confirm password",
                      controller: passwordController,
                      icon: showConfirmPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      obscureText: showConfirmPassword,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    UiHelper.customButton(
                      context: context,
                      onTap: () {},
                      btnText: "Sign up",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        UiHelper.customText(
                          text: "Already have an account? ",
                          fontWeight: FontWeight.w500,
                          fontsize: 18,
                          color: const Color.fromRGBO(255, 255, 255, 0.616),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          borderRadius: BorderRadius.circular(5),
                          child: UiHelper.customText(
                            text: "Login",
                            color: const Color(0xff6b63ff),
                            fontsize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
