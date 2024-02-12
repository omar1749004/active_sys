import 'package:active_system/core/constant/color.dart';
import 'package:active_system/core/shared/ModernTable/functions.dart';
import 'package:active_system/core/shared/global_variable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomRowTable extends StatelessWidget {
  const CustomRowTable({
    super.key,
    required this.dataCell,
    required this.widths,
    this.isPressed = true,
    this.align = Alignment.centerRight,
    required this.nameOfVar,
    required this.ind,
    required this.OnTap,
  });

  final int ind;
  final List<String> dataCell;
  final List<double> widths;
  final bool isPressed;
  final Alignment align;
  final String nameOfVar;
  final void Function() OnTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          foregroundColor: isPressed
              ? MaterialStateProperty.all(ColorApp.thirdColor)
              : MaterialStateProperty.all(ColorApp.kPrimaryColor),
          padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
          shape: MaterialStateProperty.all(const BeveledRectangleBorder())),
      onPressed: isPressed
          ? () {
              setValueInGlobalVariable(nameOfVar, ind);
              OnTap();
            }
          : null,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 1),
        color: const Color.fromARGB(255, 234, 234, 234),
        child: Row(
          children: List.generate(dataCell.length, (index) {
            return Container(
              alignment: align,
              height: 40,
              width: widths[index],
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(width: 1),
                ),
              ),
              child: Text(
                dataCell[index],
                overflow: TextOverflow.ellipsis,
                textDirection: TextDirection.rtl,
              ),
            );
          }),
        ),
      ),
    );
  }
}
