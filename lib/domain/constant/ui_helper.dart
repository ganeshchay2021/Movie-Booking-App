import 'package:flutter/material.dart';

class UiHelper {
  static customText({
    required String text,
    double? fontsize,
    double? height,
    FontWeight? fontWeight,
    TextOverflow? textOverflow,
    Color? color,
  }) {
    return Text(
      overflow: textOverflow,
      text,
      style: TextStyle(
        height: height,
        fontSize: fontsize,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }

  static assetImage(
      {required String image, BoxFit? boxFit, double? height, double? width}) {
    return Image.asset(
      image,
      height: height,
      width: width,
      fit: boxFit,
    );
  }

  static customBackButton({required VoidCallback onPressed}) {
    return Container(
      padding: const EdgeInsets.all(4),
      height: 40,
      width: 40,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: const Icon(Icons.arrow_back_ios),
      ),
    );
  }

  static customTextfield(
      {required String hintText,
      VoidCallback? onTap,
      required TextEditingController controller,
      required IconData icon,
      TextInputType? textInputType,
      bool obscureText = false}) {
    return TextField(
      style: const TextStyle(color: Colors.white, fontSize: 18),
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        // errorText: "Textfield is Empty",
        suffixIcon: IconButton(
          onPressed: onTap,
          icon: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        hintStyle: const TextStyle(
          color: Color.fromARGB(219, 255, 255, 255),
        ),
      ),
    );
  }

  static customButton(
      {required BuildContext context,
      required VoidCallback onTap,
      required String btnText}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            height: 50,
            width: MediaQuery.of(context).size.width / 1.6,
            decoration: BoxDecoration(
              color: const Color(0xff6b63ff),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(
              btnText,
              style: const TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ),
      ],
    );
  }
}
