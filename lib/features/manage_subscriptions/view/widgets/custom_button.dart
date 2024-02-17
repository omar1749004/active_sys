import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  

  final String text;
  final Function()? ontap;
  final Color color ;
const CustomButton({super.key, required this.text, required this.ontap,  this.color =const Color.fromARGB(217, 255, 255, 255)});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ontap,
      style: ButtonStyle(
          backgroundColor:  MaterialStatePropertyAll(
              color),
          shape: MaterialStateProperty.all(
            LinearBorder.bottom(
              side: const BorderSide(
                width: 1,
                color: Color.fromARGB(64, 0, 0, 0),
              ),
            ),
          ),
          fixedSize: MaterialStateProperty.all(Size.copy(const Size(120, 40)))),
      child: Text(text),
    );
  }
}
