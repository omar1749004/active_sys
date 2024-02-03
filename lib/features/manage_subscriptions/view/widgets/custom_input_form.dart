import 'package:active_system/core/functions/validate_input.dart';
import 'package:active_system/core/shared/custome_textform_auth.dart';
import 'package:flutter/material.dart';

class SubscriptionForm extends StatelessWidget {
  const SubscriptionForm({super.key});
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
                lableText: " اسم الاشتراك",
                validator: (val) {
                  return validInput(val!, 5, 50, "username");
                }),
            const SizedBox(
              height: 10,
            ),
            CustomeTextFormAuth(
                hintText: "",
                lableText: "نوع الاشتراك",
                validator: (val) {
                  return validInput(val!, 5, 50, "username");
                }),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomeTextFormAuth(
                      hintText: "",
                      lableText: "التخصص",
                      validator: (val) {
                        return validInput(val!, 5, 50, "username");
                      }),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CustomeTextFormAuth(
                      hintText: "",
                      lableText: "السعر",
                      validator: (val) {
                        return validInput(val!, 5, 50, "username");
                      }),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomeTextFormAuth(
                      hintText: "",
                      lableText: " عدد الايام",
                      validator: (val) {
                        return validInput(val!, 5, 50, "username");
                      }),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CustomeTextFormAuth(
                      hintText: "",
                      lableText: " عدد الحصص",
                      validator: (val) {
                        return validInput(val!, 5, 50, "username");
                      }),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            CustomeTextFormAuth(
                hintText: "",
                lableText: "اقصى عدد ايام تجميد للمره الواحده",
                validator: (val) {
                  return validInput(val!, 5, 50, "username");
                }),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomeTextFormAuth(
                      hintText: "",
                      lableText: "عدد الدعوات",
                      validator: (val) {
                        return validInput(val!, 5, 50, "username");
                      }),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CustomeTextFormAuth(
                    hintText: "",
                    lableText: "عدد الخدمات",
                    validator: (val) {
                      return validInput(val!, 5, 50, "username");
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            CustomeTextFormAuth(
                hintText: "",
                lableText: " اقصى عدد دعوات فى اليوم",
                validator: (val) {
                  return validInput(val!, 5, 50, "username");
                }),
            const SizedBox(
              height: 10,
            ),
            CustomeTextFormAuth(
                hintText: "",
                lableText: "اقصى عدد خدمات فى اليوم",
                validator: (val) {
                  return validInput(val!, 5, 50, "username");
                }),
            const SizedBox(
              height: 10,
            ),
            CustomeTextFormAuth(
              hintText: "",
              lableText: "ملاحظات",
              validator: (val) {
                return validInput(val!, 5, 50, "username");
              },
            ),
          ],
        ),
      ),
    );
  }
}
