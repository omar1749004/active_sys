import 'package:active_system/core/constant/menu_items.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.ontap});

  final String text;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    late double height =
        (MediaQuery.of(context).size.height / serviceName.length);
    return ElevatedButton(
      onPressed: ontap,
      style: ButtonStyle(
          shape: MaterialStateProperty.all(
            LinearBorder.bottom(
              side: const BorderSide(
                width: 1,
                color: Color.fromARGB(64, 0, 0, 0),
              ),
            ),
          ),
          fixedSize: MaterialStateProperty.all(Size.copy(Size(150, height)))),
      child: Text(text),
    );
  }
}
