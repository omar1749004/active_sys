import 'package:active_system/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomDropDownMenu extends StatelessWidget {
  const CustomDropDownMenu(
      {super.key,
      required this.items,
      required this.intialValue,
      this.onChanged});
  final List items;
  final String intialValue;
  final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DropdownButtonFormField<String>(
          menuMaxHeight: 150,
          focusColor: const Color.fromARGB(255, 206, 206, 206),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: ColorApp.kPrimaryColor,
                ),
                borderRadius: BorderRadius.circular(16)),
            border: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 170, 170, 170)),
                borderRadius: BorderRadius.circular(16)),
          ),
          value: intialValue,
          borderRadius: BorderRadius.all(Radius.circular(16)),
          items: items
              .map((item) =>
                  DropdownMenuItem<String>(value: item, child: Text(item)))
              .toList(),
          onChanged: onChanged),
    );
  }
}
