import 'package:active_system/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox(
      {super.key, required this.ischeck, required this.text, this.onTap});
  final bool ischeck;
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 170, 170, 170),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 17),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          // SizedBox(width: 15,),
          InkWell(
            onTap: onTap,
            child: Container(
                width: 17,
                height: 17,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color.fromARGB(255, 78, 78, 78),
                    width: 2.0,
                  ),
                ),
                child: ischeck
                    ? const Icon(
                        Icons.circle,
                        size: 11.0,
                        color: ColorApp.kPrimaryColor,
                      )
                    : Container()),
          ),
        ],
      ),
    );
  }
}
