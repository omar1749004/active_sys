import 'package:active_system/core/shared/custom_input_form.dart';
import 'package:flutter/material.dart';

class SubscriptionForm extends StatelessWidget {
  const SubscriptionForm({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomInputForm(
              labelText: 'الكود',
              dataType: 'int',
              size: 250,
            ),
            CustomInputForm(
                labelText: 'أسم ألاشتراك', dataType: 'String', size: 250),
            CustomInputForm(
                labelText: 'نوع ألاشتراك', dataType: 'String', size: 250),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomInputForm(
                    labelText: 'التخصص', dataType: 'String', size: 120),
                const SizedBox(
                  width: 10,
                ),
                CustomInputForm(labelText: 'السعر', dataType: 'int', size: 120),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomInputForm(
                    labelText: 'عدد الايام', dataType: 'int', size: 120),
                const SizedBox(
                  width: 10,
                ),
                CustomInputForm(
                    labelText: 'عدد الحصص', dataType: 'int', size: 120),
              ],
            ),
            CustomInputForm(
                labelText: 'أقصى عدد ايام تجميد للمره الواحده',
                dataType: 'int',
                size: 250),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomInputForm(
                    labelText: 'عدد الدعوات', dataType: 'int', size: 120),
                const SizedBox(
                  width: 10,
                ),
                CustomInputForm(
                    labelText: 'عدد الخدمات', dataType: 'int', size: 120),
              ],
            ),
            CustomInputForm(
                labelText: 'اقصى عدد دعوات فى اليوم',
                dataType: 'int',
                size: 250),
            CustomInputForm(
                labelText: 'اقصى عدد خدمات فى اليوم',
                dataType: 'int',
                size: 250),
            CustomInputForm(
              labelText: 'ملاحظات',
              dataType: 'String',
              size: 250,
              maxline: 3,
            ),
          ],
        ),
      ),
    );
  }
}
