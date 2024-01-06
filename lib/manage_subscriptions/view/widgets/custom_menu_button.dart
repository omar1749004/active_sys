import 'package:active_system/core/constant/color.dart';
import 'package:active_system/core/constant/menu_items.dart';
import 'package:flutter/material.dart';

class CustomMenuButton extends StatelessWidget {
  const CustomMenuButton({
    super.key,
    required this.text,
    required this.ontap,
    this.backgroundColor = Colors.white,

  });

  final String text;
  final Function()? ontap;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
 
    late double height =
        (MediaQuery.of(context).size.height / serviceName.length);
    return ElevatedButton(
     
      autofocus: false,
      onPressed: ontap,
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(backgroundColor),
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
