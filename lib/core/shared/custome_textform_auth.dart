import 'package:active_system/core/constant/styles.dart';

import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomeTextFormAuth extends StatelessWidget {
  const CustomeTextFormAuth(
      {super.key,
      required this.hintText,
      required this.lableText,
      this.myController,
      this.validator,
      this.onChanged,
      this.isShowIcone = false,
      this.icone = Icons.power_off_rounded,
      this.isPhoneNumber = false,
      this.obscureText = false,
      this.ontap,
      this.fontSize = 16,
      this.lableStyle = Styles.style18B,
      this.onfocuseColor = ColorApp.kPrimaryColor,
      this.cursorColor = ColorApp.kPrimaryColor,
      this.hintColor = Colors.black,
      this.mainTextColor = Colors.black,
      this.isreadonly = false,
      this.onTapOnTextField});

  final String hintText;
  final String lableText;
  final IconData icone;
  final TextEditingController? myController;
  final String? Function(String?)? validator;
  final bool isPhoneNumber;
  final bool obscureText;
  final bool isShowIcone;
  final TextStyle? lableStyle;
  final double fontSize;
  final Color onfocuseColor;
  final Color hintColor;
  final Color cursorColor;
  final Color mainTextColor;
  final bool isreadonly;
  final void Function()? ontap;
  final void Function()? onTapOnTextField;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    //Color color = Color.fromARGB(255, 126, 126, 126);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        onTap: onTapOnTextField,
        onChanged: onChanged,
        obscureText: obscureText,
        keyboardType: isPhoneNumber ? TextInputType.number : TextInputType.text,
        validator: validator,
        controller: myController,
        cursorColor: cursorColor,
        readOnly: isreadonly,
        style: TextStyle(
            fontSize: fontSize,
            color: mainTextColor,
            fontFamily: "NotoSansArabic"),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: hintColor, fontFamily: "NotoSansArabic"),
          //hintStyle: TextStyle(fontSize: 14,
          //color: check? ColorApp.KPrimaryColor: color
          // ),

          label: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              lableText,
              style: lableStyle,
              softWrap: false,
              overflow: TextOverflow.visible,
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

          suffixIcon: isShowIcone
              ? GestureDetector(
                  onTap: ontap,
                  child: Icon(icone, color: const Color.fromARGB(255, 0, 0, 0)),
                )
              : null,
        ),
      ),
    );
  }
}
