import 'package:active_system/controller/freeze_controller.dart';
import 'package:active_system/core/constant/color.dart';
import 'package:active_system/features/safe/view/widget/custom_display_many.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FreezeScreenForm extends StatelessWidget {
  const FreezeScreenForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: SingleChildScrollView(
          child: 
          GetBuilder<FreezeControllerImp>(builder: (controller) => 
          Column(
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 15),
                decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(width: 1))),
                child:  Column(
                  children: [
                    CustomDisplyMany(
                      many: controller.barcode!,
                      text: "كود الاعب",
                      textColor: ColorApp.thirdColor,
                    ),
                  const  SizedBox(
                      height: 10,
                    ),
                    CustomDisplyMany(
                      many: controller.name!,
                      text: "اسم الاعب",
                      textColor: ColorApp.thirdColor,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
               Column(
                children: [
                  CustomDisplyMany(
                    many: controller.startrenew!.substring(0,11),
                    text: "بداية ألاشتراك",
                    textColor: ColorApp.thirdColor,
                  ),
                const  SizedBox(
                    height: 10,
                  ),
                  CustomDisplyMany(
                    many: controller.endrenew!.substring(0,11),
                    text: "نهاية ألاشتراك",
                    textColor: ColorApp.thirdColor,
                  ),
                 const SizedBox(
                    height: 10,
                  ),
                  CustomDisplyMany(
                    many: controller.subName!,
                    text: "أسم ألاشتراك",
                    textColor: ColorApp.thirdColor,
                  ),
                 const SizedBox(
                    height: 10,
                  ),
                  CustomDisplyMany(
                    many: controller.days!,
                    text: "عدد الايام",
                    textColor: ColorApp.thirdColor,
                  ),
                 const SizedBox(
                    height: 10,
                  ),
                  CustomDisplyMany(
                    many: controller.frezzeDay.toString(),
                    text: "عدد ايام التجميد",
                    textColor: ColorApp.thirdColor,
                  ),
                 const SizedBox(
                    height: 10,
                  ),
                  CustomDisplyMany(
                    flexOfLabel: 4,
                    flexOfMany: 2,
                    many: controller.freezeNum.toString(),
                    text: "عدد مرات التجميد",
                    textColor: ColorApp.thirdColor,
                  ),
                const  SizedBox(
                    height: 10,
                  ),
                  CustomDisplyMany(
                    flexOfLabel: 4,
                    flexOfMany: 2,
                    many: controller.maxFreeze.toString(),
                    text: "اقصى عدد ايام تجميد  ",
                    textColor: ColorApp.thirdColor,
                  ),
                ],
              ),
            ],
          ),
        ),)
      ),
    );
  }
}
