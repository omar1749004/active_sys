import 'package:active_system/core/constant/color.dart';
import 'package:flutter/material.dart';


abstract class Styles
{
  static const TextStyle style25 = TextStyle(
          color: Colors.black,
          fontSize: 25, fontWeight: FontWeight.w700);
 static const TextStyle style18 = TextStyle(
                        fontSize: 18,fontWeight: FontWeight.bold,
                        color: ColorApp.kPrimaryColor) ;
                         static const TextStyle style18black = TextStyle(
                        fontSize: 18,fontWeight: FontWeight.w400,
                        color: Colors.black) ;
 static TextStyle style20 = TextStyle(
color: Colors.black.withOpacity(0.800000011920929),
fontSize: 20,
fontFamily: 'Inter',
fontWeight: FontWeight.w400,
height: 0,
);
 static const TextStyle style18B =  TextStyle(
color: Colors.black,
fontSize: 18,
fontFamily: 'Inter',
fontWeight: FontWeight.w600,
height: 0,
);
}