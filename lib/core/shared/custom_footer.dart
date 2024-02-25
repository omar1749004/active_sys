import 'package:active_system/core/constant/color.dart';
import 'package:active_system/core/constant/styles.dart';
import 'package:flutter/material.dart';

class CustomFooter extends StatelessWidget {
  const CustomFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: ColorApp.kPrimaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         const Icon(Icons.copyright),
          Text(
            "2024 made by Abdallah Reda & Omar Mohsen",
            style: Styles.style20,
          ),
          //here will add another element in the future
        ],
      ),
    );
  }
}
