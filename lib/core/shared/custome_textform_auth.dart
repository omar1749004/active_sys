import 'package:active_system/core/constant/styles.dart';

import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomeTextFormAuth extends StatelessWidget {
  const CustomeTextFormAuth(
      {super.key,
      required this.hintText,
      required this.lableText,
      this.myController,
      required this.validator,
      this.icone = Icons.power_off_rounded,
      this.isPhoneNumber = false,
      this.obscureText = false,
      this.ontap,
      this.fontSize = 16,
      this.lableStyle = Styles.style18B,
      this.onfocuseColor = ColorApp.kPrimaryColor,
      this.cursorColor = ColorApp.kPrimaryColor,
      this.hintColor = Colors.black,
       this.mainText = Colors.black});

  final String hintText;
  final String lableText;
  final IconData icone;
  final TextEditingController? myController;
  final String? Function(String?)? validator;
  final bool isPhoneNumber;
  final bool obscureText;
  final TextStyle? lableStyle;
  final double fontSize;
  final Color onfocuseColor;
  final Color hintColor;
  final Color cursorColor;
  final Color mainText;
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    //Color color = Color.fromARGB(255, 126, 126, 126);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        obscureText: obscureText,
        keyboardType: isPhoneNumber ? TextInputType.number : TextInputType.text,
        validator: validator,
        controller: myController,
        cursorColor: cursorColor,
        style: TextStyle(fontSize: fontSize, color: mainText ,fontFamily: "NotoSansArabic"),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: hintColor, fontFamily: "NotoSansArabic"),
          //hintStyle: TextStyle(fontSize: 14,
          //color: check? ColorApp.KPrimaryColor: color
          // ),
          label: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              lableText,
              style: lableStyle,
            ),
          ),
          //labelStyle: TextStyle(
          //color: check? ColorApp.KPrimaryColor:color
          // ),

          // floatingLabelBehavior: FloatingLabelBehavior.always,

          // color: check ? ColorApp.KPrimaryColor:color,

          contentPadding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 10,
          ),

          //  focusColor: ColorApp.kPrimaryColor,
          focusedBorder: OutlineInputBorder(
              //on focus
              borderSide: BorderSide(
                color: onfocuseColor,
              ),
              borderRadius: BorderRadius.circular(30)),
          border: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color.fromARGB(255, 170, 170, 170)),
              borderRadius: BorderRadius.circular(30)),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color.fromARGB(255, 170, 170, 170)),
              borderRadius: BorderRadius.circular(30)),

          suffixIcon: ontap != null
              ? GestureDetector(
                  onTap: ontap,
                  child: Icon(icone, color: Colors.white),
                )
              : null,
        ),
      ),
    );
  }
}
