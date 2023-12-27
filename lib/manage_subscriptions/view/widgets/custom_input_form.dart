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
              dataType: int,
              size: 300,
            ),
            CustomInputForm(
                labelText: 'أسم ألاشتراك', dataType: String, size: 300),
            CustomInputForm(
                labelText: 'نوع ألاشتراك', dataType: String, size: 300),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomInputForm(
                    labelText: 'التخصص', dataType: String, size: 145),
                const SizedBox(
                  width: 10,
                ),
                CustomInputForm(labelText: 'السعر', dataType: int, size: 145),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomInputForm(
                    labelText: 'عدد الايام', dataType: int, size: 145),
                const SizedBox(
                  width: 10,
                ),
                CustomInputForm(
                    labelText: 'عدد الحصص', dataType: int, size: 145),
              ],
            ),
            CustomInputForm(
                labelText: 'أقصى عدد ايام تجميد للمره الواحده',
                dataType: int,
                size: 300),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomInputForm(
                    labelText: 'عدد الدعوات', dataType: int, size: 145),
                const SizedBox(
                  width: 10,
                ),
                CustomInputForm(
                    labelText: 'عدد الخدمات', dataType: int, size: 145),
              ],
            ),
            CustomInputForm(
                labelText: 'اقصى عدد دعوات فى اليوم', dataType: int, size: 300),
            CustomInputForm(
                labelText: 'اقصى عدد خدمات فى اليوم', dataType: int, size: 300),
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
