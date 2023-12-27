import 'package:active_system/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomInputForm extends StatelessWidget {
  CustomInputForm(
      {super.key,
      required this.labelText,
      required this.dataType,
      required this.size,
      this.maxline = 1});
  final String labelText;
  final String dataType;
  final double size;
  final int maxline;
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Directionality(
              textDirection: TextDirection.rtl,
              child: TextFormField(
                maxLines: maxline,
                textDirection: TextDirection.rtl,
                style: const TextStyle(color: ColorApp.kPrimaryColor),
                decoration: InputDecoration(
                  labelText: labelText,
                ),
                validator: (value) {
                  if (value.runtimeType != dataType) {
                    return "there is error";
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
