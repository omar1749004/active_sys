import 'package:active_system/core/functions/validate_input.dart';
import 'package:active_system/core/shared/custom_input_form.dart';
import 'package:active_system/core/shared/custome_textform_auth.dart';
import 'package:flutter/material.dart';

class TrainersForm extends StatelessWidget {
  const TrainersForm({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomeTextFormAuth(
                hintText: "",
                lableText: "الكود",
                validator: (val) {
                  return validInput(val!, 5, 50, "username");
                }),
            const SizedBox(
              height: 10,
            ),
            CustomeTextFormAuth(
                hintText: "",
                lableText: "الاسم",
                validator: (val) {
                  return validInput(val!, 5, 50, "username");
                }),
            const SizedBox(
              height: 10,
            ),
            CustomeTextFormAuth(
                hintText: "",
                lableText: "التلفون",
                validator: (val) {
                  return validInput(val!, 5, 50, "username");
                }),
            const SizedBox(
              height: 10,
            ),
            CustomeTextFormAuth(
                hintText: "",
                lableText: "موبايل 1",
                validator: (val) {
                  return validInput(val!, 5, 50, "username");
                }),
            const SizedBox(
              height: 10,
            ),
            CustomeTextFormAuth(
                hintText: "",
                lableText: "موبايل 2",
                validator: (val) {
                  return validInput(val!, 5, 50, "username");
                }),
            const SizedBox(
              height: 10,
            ),
            CustomeTextFormAuth(
                hintText: "",
                lableText: "العنوان",
                validator: (val) {
                  return validInput(val!, 5, 50, "username");
                }),
            const SizedBox(
              height: 10,
            ),
            CustomeTextFormAuth(
                hintText: "",
                lableText: "النسبه",
                validator: (val) {
                  return validInput(val!, 5, 50, "username");
                }),
            const SizedBox(
              height: 10,
            ),
            CustomeTextFormAuth(
                hintText: "",
                lableText: "الملاحظات",
                validator: (val) {
                  return validInput(val!, 5, 50, "username");
                }),
          ],
        ),
      ),
    );
  }
}
