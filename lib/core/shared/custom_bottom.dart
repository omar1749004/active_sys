import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({super.key, required this.ontap, required this.text});
  final Function()? ontap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: MaterialButton(
          onPressed: ontap,
          padding: EdgeInsets.all(10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          color: ColorApp.kPrimaryColor,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
