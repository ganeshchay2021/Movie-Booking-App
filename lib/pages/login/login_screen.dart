import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Importing Bloc package for state management
import 'package:loading_overlay/loading_overlay.dart'; // Package to show loading overlay
import 'package:movie_booking_app/domain/constant/assets.dart'; // Import assets for UI
import 'package:movie_booking_app/domain/constant/ui_helper.dart'; // Helper functions for custom UI widgets
import 'package:movie_booking_app/pages/botton%20nav%20bar/bottom_nav_bar.dart'; // Bottom Navigation Bar page
import 'package:movie_booking_app/pages/login/bloc/auth_bloc.dart'; // Import the Auth BLoC
import 'package:movie_booking_app/pages/signup/widget/signup.dart'; // Import SignUp page

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Text controllers to get values from the input fields
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Boolean to toggle password visibility
  bool showPassword = true;

  // Boolean to track loading state
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xff14141d), // Background color of the screen
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          // Handles various states from AuthBloc

          if (state is AuthLoadingState) {
            // Set loading state to true when Auth is in loading state
            setState(() {
              isLoading = true;
            });
          } else {
            // Set loading state to false for other states (Success/Failure)
            setState(() {
              isLoading = false;
            });
          }

          // Show error message if AuthErrorState is emitted
          if (state is AuthErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: UiHelper.customText(
                  text: state.errorMsg,
                  fontsize: 18,
                ),
              ),
            );
          }

          // Navigate to BottomNavBar if AuthSuccessState is emitted
          if (state is AuthSuccessState) {
            Navigator.pushReplacement(
              context,
              CupertinoPageRoute(
                builder: (context) => const BottomNavBar(),
              ),
            );
          }
        },
        child: LoadingOverlay(
          isLoading: isLoading, // Show loading overlay when isLoading is true
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UiHelper.assetImage(
                    image: Assets.signin), // Display logo or image
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Welcome text
                      UiHelper.customText(
                        text: "Welcome!",
                        color: const Color.fromARGB(173, 255, 255, 255),
                        fontsize: 34,
                        fontWeight: FontWeight.w500,
                      ),
                      UiHelper.customText(
                        text: "Login", // Title for login screen
                        color: Colors.white,
                        fontsize: 45.0,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(height: 20),
                      // Email label and input field
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
                      const SizedBox(height: 40),
                      // Password label and input field
                      UiHelper.customText(
                        text: "Password",
                        color: const Color.fromRGBO(255, 255, 255, 0.616),
                        fontsize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                      UiHelper.customTextfield(
                        onTap: () {
                          // Toggle password visibility when tapped
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                        hintText: "Enter password",
                        controller: passwordController,
                        icon: showPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        obscureText:
                            showPassword, // Control password visibility
                      ),
                      const SizedBox(height: 20),
                      // Forgot password link
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
                      const SizedBox(height: 20),
                      // Login button
                      UiHelper.customButton(
                        context: context,
                        onTap: () {
                          String email = emailController.text;
                          String password = passwordController.text;
                          if (email != "" && password != "") {
                            // If both fields are non-empty, trigger the login event
                            context.read<AuthBloc>().add(AuthLoginEvent(
                                  email: email,
                                  password: password,
                                ));
                          } else {
                            // Show error if email or password is empty
                            if (email == "") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.red,
                                  content: UiHelper.customText(
                                    text: "Email field is empty",
                                    fontsize: 18,
                                  ),
                                ),
                              );
                            } else if (password == "") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.red,
                                  content: UiHelper.customText(
                                    text: "Password field is empty",
                                    fontsize: 18,
                                  ),
                                ),
                              );
                            }
                          }
                        },
                        btnText: "Login", // Button text
                      ),
                      const SizedBox(height: 40),
                      // Navigate to Sign Up page
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          UiHelper.customText(
                            text: "Create an account? ",
                            fontWeight: FontWeight.w500,
                            fontsize: 18,
                            color: const Color.fromRGBO(255, 255, 255, 0.616),
                          ),
                          const SizedBox(width: 5),
                          InkWell(
                            onTap: () {
                              emailController.text = "";
                              passwordController.text = "";

                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => const Signup(),
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
        ),
      ),
    );
  }
}
