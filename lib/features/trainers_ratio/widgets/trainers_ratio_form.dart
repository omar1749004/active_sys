import 'package:active_system/controller/persent_controller.dart';
import 'package:active_system/core/constant/color.dart';
import 'package:active_system/core/constant/styles.dart';
import 'package:active_system/features/safe/view/widget/custom_display_many.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrainersRatioForm extends GetView<PersentControllerImp> {
  const TrainersRatioForm({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child:
      GetBuilder <PersentControllerImp>(builder: (controller) =>
       SingleChildScrollView(
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
                CustomDisplyMany(
                  textColor: ColorApp.thirdColor,
                  many: controller.name,
                  text: "اسم المدرب"),
                CustomDisplyMany(
                  textColor: ColorApp.thirdColor,
                  many:  controller.phone,
                  text: "رقم التلفون"),
               CustomDisplyMany(
                  textColor: ColorApp.secondColor,
                  many: controller.totalClients.toString(),
                  text: "عدد الاعبين"),
               CustomDisplyMany(
                  textColor: ColorApp.secondColor,
                  many: controller.totalSalary.toString(),
                  text: "المبلغ الكلى المستحق"),
              const SizedBox(
                height: 15,
              ),
              
            ],
          ),
        ),
      ),
    ));
  }
}
