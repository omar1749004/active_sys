import 'package:active_system/controller/trainer_controller.dart';
import 'package:active_system/core/constant/color.dart';
import 'package:active_system/core/constant/styles.dart';
import 'package:active_system/core/functions/validate_input.dart';
import 'package:active_system/core/shared/custome_textform_auth.dart';
import 'package:active_system/features/safe/view/widget/custom_display_many.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrainersRatioForm extends GetView<TrainersControllerImp> {
  const TrainersRatioForm({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SingleChildScrollView(
        child: Form(
          //key: controller.formKey,
          child: Column(
            children: [
              Text(
                "نسبة المدربين",
                style: Styles.style23,
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomDisplyMany(
                  textColor: ColorApp.thirdColor,
                  many: "10",
                  text: "عدد الاعبين"),
              const CustomDisplyMany(
                  textColor: ColorApp.thirdColor,
                  many: "100",
                  text: "المبلغ الكلى المستحق"),
              const SizedBox(
                height: 15,
              ),
              CustomeTextFormAuth(
                  hintText: "",
                  lableText: "الاسم",
                  myController: controller.name,
                  isreadonly: true,
                  validator: (val) {
                    return validInput(val!, 3, 50, "");
                  }),
              const SizedBox(
                height: 15,
              ),
              CustomeTextFormAuth(
                  hintText: "",
                  lableText: "التلفون",
                  myController: controller.phone,
                  isreadonly: true,
                  validator: (val) {
                    return validInput(val!, 1, 50, "phone");
                  }),
              const SizedBox(
                height: 15,
              ),
              CustomeTextFormAuth(
                hintText: "",
                lableText: "موبايل 1",
                isreadonly: true,
                myController: controller.phone1,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomeTextFormAuth(
                hintText: "",
                lableText: "موبايل 2",
                myController: controller.phone2,
                isreadonly: true,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomeTextFormAuth(
                  hintText: "",
                  lableText: "العنوان",
                  myController: controller.address,
                  isreadonly: true,
                  validator: (val) {
                    return validInput(val!, 5, 50, "");
                  }),
              const SizedBox(
                height: 15,
              ),
              CustomeTextFormAuth(
                hintText: "",
                lableText: "الملاحظات",
                myController: controller.note,
                isreadonly: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
