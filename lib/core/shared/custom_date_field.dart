import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDateField extends StatelessWidget {
  CustomDateField(
      {super.key,
      required this.width,
      required this.height,
       this.icon =CupertinoIcons.calendar,
      required this.iconSize,
      required this.fontSize,
      this.onChanged,
      this.validator,
      this.currentValue,
      this.isaccess = true,
      this.label = "",
      this.borderRadius = 0});
  final double width;
  final double height;
  final IconData icon;
  final double iconSize;
  final double fontSize;
  final double borderRadius;
  final String label;
  final void Function(DateTime?)? onChanged;
  final String? Function(DateTime?)? validator;
  final bool isaccess ;
  final format = DateFormat("yyyy-MM-dd" );
  final DateTime? currentValue ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: DateTimeField(
        validator: validator,
        onChanged: onChanged,
        resetIcon: null,
        enabled: isaccess,
        decoration: InputDecoration(
          icon: Icon(
          icon,
          size: iconSize,
        ),
            labelText: label,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius)
                ),
            contentPadding: EdgeInsets.zero),
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: fontSize),
         initialValue: currentValue ?? DateTime.now(),
        
        format: format,
        onShowPicker: (BuildContext context, DateTime? currentValue) {
          return showDatePicker(
              context: context,
              locale: const Locale("ar", "SA"),
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
              
        },
      ),
    );
  }
}
