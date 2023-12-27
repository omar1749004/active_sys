import 'package:active_system/core/shared/custom_input_form.dart';
import 'package:flutter/material.dart';

class TrainersForm extends StatelessWidget {
  const TrainersForm({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomInputForm(
              labelText: 'الكود',
              dataType: int,
              size: 300,
            ),
            CustomInputForm(labelText: 'الاسم ', dataType: String, size: 300),
            CustomInputForm(labelText: 'تليفون ', dataType: String, size: 300),
            CustomInputForm(
                labelText: 'موبايل 1 ', dataType: String, size: 300),
            CustomInputForm(
                labelText: 'موبايل 2 ', dataType: String, size: 300),
            CustomInputForm(labelText: 'العنوان ', dataType: String, size: 300),
            CustomInputForm(labelText: 'النسبة ', dataType: String, size: 300),
            CustomInputForm(
              labelText: 'ملاحظات',
              dataType: String,
              size: 300,
              maxline: 3,
            ),
          ],
        ),
      ),
    );
  }
}
