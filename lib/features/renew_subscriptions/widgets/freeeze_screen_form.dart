import 'package:active_system/core/constant/color.dart';
import 'package:active_system/features/safe/view/widget/custom_display_many.dart';
import 'package:flutter/material.dart';

class FreezeScreenForm extends StatelessWidget {
  const FreezeScreenForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 15),
                decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(width: 1))),
                child: const Column(
                  children: [
                    CustomDisplyMany(
                      many: 101,
                      text: "كود الاعب",
                      textColor: ColorApp.thirdColor,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomDisplyMany(
                      many: 101,
                      text: "اسم الاعب",
                      textColor: ColorApp.thirdColor,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Column(
                children: [
                  CustomDisplyMany(
                    many: 101,
                    text: "بداية ألاشتراك",
                    textColor: ColorApp.thirdColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomDisplyMany(
                    many: 101,
                    text: "نهاية ألاشتراك",
                    textColor: ColorApp.thirdColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomDisplyMany(
                    many: 101,
                    text: "أسم ألاشتراك",
                    textColor: ColorApp.thirdColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomDisplyMany(
                    many: 101,
                    text: "عدد الايام",
                    textColor: ColorApp.thirdColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomDisplyMany(
                    many: 101,
                    text: "عدد ايام التجميد",
                    textColor: ColorApp.thirdColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomDisplyMany(
                    flexOfLabel: 4,
                    flexOfMany: 2,
                    many: 101,
                    text: "عدد مرات التجميد",
                    textColor: ColorApp.thirdColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomDisplyMany(
                    flexOfLabel: 4,
                    flexOfMany: 2,
                    many: 101,
                    text: "اقصى عدد ايام تجميد  ",
                    textColor: ColorApp.thirdColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
