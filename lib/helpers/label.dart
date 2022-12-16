import 'package:eshoppy/helpers/colors.dart';
import 'package:eshoppy/helpers/font_size.dart';
import 'package:flutter/material.dart';



Widget buildLabel({required String label, String? link}) {
  
  

  return Row(
    children: [
      Text(
        label,
        style: poppinsCustom(iconAndActiveTextColor, 14).copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      const Spacer(),
      GestureDetector(
        onTap: () {
          
        },
        child: Text(
          link ?? '',
          style: poppinsCustom(secondaryButtonColor, 12).copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}
