import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_booking_app/domain/constant/assets.dart';
import 'package:movie_booking_app/domain/constant/ui_helper.dart';
import 'package:movie_booking_app/pages/signup/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff14141d),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UiHelper.assetImage(image: Assets.signin),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UiHelper.customText(
                    text: "Welcome!",
                    color: const Color.fromARGB(173, 255, 255, 255),
                    fontsize: 34,
                    fontWeight: FontWeight.w500,
                  ),
                  UiHelper.customText(
                    text: "Login",
                    color: Colors.white,
                    fontsize: 45.0,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 20,
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
                    height: 40,
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
                    icon: showPassword ? Icons.visibility_off : Icons.visibility,
                    obscureText: showPassword,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(5),
                        child: UiHelper.customText(
                          text: "Forgot password?",
                          color: const Color(0xff6b63ff),
                          fontsize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  UiHelper.customButton(
                    context: context,
                    onTap: () {},
                    btnText: "Login",
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      UiHelper.customText(
                        text: "Create an account? ",
                        fontWeight: FontWeight.w500,
                        fontsize: 18,
                        color: const Color.fromRGBO(255, 255, 255, 0.616),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ),
                          );
                        },
                        borderRadius: BorderRadius.circular(5),
                        child: UiHelper.customText(
                          text: "Sign Up",
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
          ],
        ),
      ),
    );
  }
}
