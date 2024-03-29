import 'package:flutter/material.dart';

class CustomBotton1 extends StatelessWidget {
  const CustomBotton1(
      {super.key,
      required this.ontap,
      required this.text,
      this.hieght = 40,
      required this.color,
      this.marginTop = 35,
      this.marginBottom = 0,
      this.marginRight = 20,
      this.marginLeft = 20});
  final void Function()? ontap;
  final String text;
  final double hieght;
  final Color color;
  final double marginTop;
  final double marginBottom;
  final double marginRight;
  final double marginLeft;
  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        height: hieght,
        margin: EdgeInsets.only(
            left: marginLeft,
            right: marginRight,
            top: marginTop,
            bottom: marginBottom),
        child: MaterialButton(
          height: hieght,
          onPressed: ontap,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          color: color,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
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
