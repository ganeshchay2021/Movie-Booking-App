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
}
