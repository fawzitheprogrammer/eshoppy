import 'package:eshoppy/helpers/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle poppinsInactive(double? fontSize){
  return GoogleFonts.poppins(color: iconAndInactiveTextColor,fontSize: fontSize);
}

TextStyle poppinsCustom(Color? color,double? fontSize){
  return GoogleFonts.poppins(color: color,fontSize: fontSize);
}