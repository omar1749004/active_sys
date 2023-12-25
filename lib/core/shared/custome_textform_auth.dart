import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomeTextFormAuth extends StatelessWidget {
  const CustomeTextFormAuth(
      {super.key,
      required this.hintText,
      required this.lableText,
      required this.icone,
      required this.myController,
      required this.validator,
      this.isPhoneNumber = false,
      this.obscureText = false,
      this.ontap});
  final String hintText;
  final String lableText;
  final IconData icone;
  final TextEditingController? myController;
  final String? Function(String?)? validator;
  final bool isPhoneNumber;
  final bool obscureText;
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    //Color color = Color.fromARGB(255, 126, 126, 126);
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Color.fromARGB(255, 113, 19, 254),
            ),
      ),
      child: TextFormField(
        obscureText: obscureText,
        keyboardType: isPhoneNumber ? TextInputType.number : TextInputType.text,
        validator: validator,
        controller: myController,
        cursorColor: ColorApp.kPrimaryColor,
        decoration: InputDecoration(
          hintText: hintText,
          //hintStyle: TextStyle(fontSize: 14,
          //color: check? ColorApp.KPrimaryColor: color
          // ),
          label: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(lableText),
          ),
          //labelStyle: TextStyle(
          //color: check? ColorApp.KPrimaryColor:color
          // ),
          floatingLabelBehavior: FloatingLabelBehavior.always,

          // color: check ? ColorApp.KPrimaryColor:color,

          contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          //focusColor: ColorApp.KPrimaryColor,

          border: OutlineInputBorder(
              borderSide:
                  BorderSide(color: const Color.fromARGB(255, 170, 170, 170)),
              borderRadius: BorderRadius.circular(30)),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: const Color.fromARGB(255, 170, 170, 170)),
              borderRadius: BorderRadius.circular(30)),

          suffixIcon: GestureDetector(
            child: Icon(
              icone,
            ),
            onTap: ontap,
          ),
        ),
      ),
    );
  }
}
