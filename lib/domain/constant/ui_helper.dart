import 'package:flutter/material.dart';

class UiHelper {
  static customText({
    required String text,
    double? fontsize,
    double? height,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return Text(
      overflow: TextOverflow.ellipsis,
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
}
