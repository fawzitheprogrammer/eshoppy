import 'package:eshoppy/helpers/font_size.dart';
import 'package:flutter/material.dart';

Widget roundedButton({Function()? onPressed, required String text,required double width,required double height}) {
  return MaterialButton(
    height: height,
    minWidth: width,
    highlightElevation: 0.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
    ),
    color: Colors.black87,
    elevation: 0.0,
    onPressed: onPressed,
    child: Text(
      text,
      style: poppinsCustom(Colors.white, 14).copyWith(
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
