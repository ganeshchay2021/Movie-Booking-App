import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:movie_booking_app/domain/constant/assets.dart';
import 'package:movie_booking_app/domain/constant/common_state.dart';
import 'package:movie_booking_app/domain/constant/ui_helper.dart';
import 'package:movie_booking_app/pages/botton%20nav%20bar/bottom_nav_bar.dart';
import 'package:movie_booking_app/pages/signup/cubit/signup_cubit.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool showPassword = true;
  bool showConfirmPassword = true;
  bool isLoading = false;

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
      body: LoadingOverlay(
        isLoading: isLoading,
        child: SingleChildScrollView(
          child: BlocListener<SignUpCubit, CommonState>(
            listener: (context, state) {
              if (state is CommonLoadingState) {
                setState(() {
                  isLoading = true;
                });
              } else {
                setState(() {
                  isLoading = false;
                });
              }
              if (state is CommonErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: UiHelper.customText(text: state.errorMsg),
                  ),
                );
              }
              if (state is CommonSuccessState) {
                Navigator.pushAndRemoveUntil(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const BottomNavBar(),
                    ),
                    (route) => false);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content:
                        UiHelper.customText(text: "User register seuccfully"),
                  ),
                );
              }
            },
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
                          controller: nameController,
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
                          controller: confirmPasswordController,
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
                          onTap: () {
                            if (nameController.text != "" &&
                                emailController.text != "" &&
                                passwordController.text != "" &&
                                confirmPasswordController.text != "") {
                              if (EmailValidator.validate(
                                  emailController.text)) {
                                if (passwordController.text ==
                                    confirmPasswordController.text) {
                                  context.read<SignUpCubit>().register(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      name: nameController.text);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: UiHelper.customText(
                                          text: "Password doesn't match"),
                                    ),
                                  );
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: UiHelper.customText(
                                        text: "Invalid email"),
                                  ),
                                );
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: UiHelper.customText(
                                      text: "Some Text field are empty"),
                                ),
                              );
                            }
                          },
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
        ),
      ),
    );
  }
}
