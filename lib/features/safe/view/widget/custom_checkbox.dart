import 'package:active_system/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox(
      {super.key, required this.ischeck, required this.text, this.onTap,  this.color = Colors.black});
  final bool ischeck;
  final String text;
  final Color color ;
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            text,
            
            style:  TextStyle(fontSize: 17, color: color),
            overflow: TextOverflow.ellipsis,
          ),
          // SizedBox(width: 15,),
          InkWell(
            onTap: onTap,
            child: Container(
              // width: MediaQuery.of(context).size.width *
              //                                   0.009,
              //   height: MediaQuery.of(context).size.width *
              //                                   0.009,
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
