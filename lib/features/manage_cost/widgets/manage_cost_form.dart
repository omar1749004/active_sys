import 'package:active_system/core/constant/color.dart';
import 'package:active_system/core/functions/validate_input.dart';
import 'package:active_system/core/shared/custom_date_field.dart';
import 'package:active_system/core/shared/custome_textform_auth.dart';
import 'package:active_system/features/safe/view/widget/custom_display_many.dart';
import 'package:flutter/material.dart';

class MangeCostForm extends StatelessWidget {
  const MangeCostForm({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            //
            //field الاجمالى
            //
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SizedBox(
                      height: 40,
                      child: CustomDisplyMany(
                          textColor: ColorApp.thirdColor,
                          many: 25000,
                          text: "اجمالى المصروفات")),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            //
            //feild رقم المصروف
            //
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SizedBox(
                      height: 40,
                      child: CustomDisplyMany(
                          textColor: ColorApp.thirdColor,
                          many: 25000,
                          text: "رقم المصروفات")),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            //
            //date button
            //
            SizedBox(
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomDateField(
                        width: 200,
                        height: 40,
                        icon: Icons.close,
                        iconSize: 20,
                        fontSize: 18),
                    const Text(
                      "التاريخ",
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomeTextFormAuth(
                hintText: "",
                lableText: "تكلفة المصروفات",
                validator: (val) {
                  return validInput(val!, 5, 50, "username");
                }),
            const SizedBox(
              height: 15,
            ),
            CustomeTextFormAuth(
                hintText: "",
                lableText: "سبب الصرف",
                validator: (val) {
                  return validInput(val!, 5, 50, "username");
                }),
            const SizedBox(
              height: 15,
            ),
            CustomeTextFormAuth(
                hintText: "",
                lableText: "ملاحظات",
                validator: (val) {
                  return validInput(val!, 5, 50, "username");
                }),
          ],
        ),
      ),
    );
  }
}
