import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function()? ontap;
  final bool isActive;
  const CustomButton(
      {super.key,
      required this.text,
      required this.ontap,
      this.isActive = true});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isActive ? ontap : null,
      style: ButtonStyle(
          alignment: Alignment.center,
          shape: MaterialStateProperty.all(
            LinearBorder.bottom(
              side: const BorderSide(
                width: 1,
                color: Color.fromARGB(64, 0, 0, 0),
              ),
            ),
          ),
          maximumSize: MaterialStateProperty.all(
            Size.copy(
              const Size(150, 40),
            ),
          ),
          minimumSize: MaterialStateProperty.all(
            Size.copy(
              const Size(120, 40),
            ),
          )),
      child: Text(text),
    );
  }
}
