import 'package:active_system/controller/trainer_controller.dart';
import 'package:active_system/core/constant/styles.dart';
import 'package:active_system/core/functions/validate_input.dart';
import 'package:active_system/core/shared/custome_textform_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrainersForm extends GetView<TrainersControllerImp> {
  const TrainersForm({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              Text(
                "إدارة المدربين",
                style: Styles.style23,
              ),
              const SizedBox(
                height: 10,
              ),
              
              const SizedBox(
                height: 15,
              ),
              CustomeTextFormAuth(
                  hintText: "",
                  lableText: "الاسم",
                  myController: controller.name,
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
                  validator: (val) {
                    return validInput(val!, 1, 50, "phone");
                  }),
              const SizedBox(
                height: 15,
              ),
              CustomeTextFormAuth(
                  hintText: "",
                  lableText: "موبايل 1",
                  myController: controller.phone1,
          
                  ),
              const SizedBox(
                height: 15,
              ),
              CustomeTextFormAuth(
                  hintText: "",
                  lableText: "موبايل 2",
                  myController: controller.phone2,
                  ),
              const SizedBox(
                height: 15,
              ),
              CustomeTextFormAuth(
                  hintText: "",
                  lableText: "العنوان",
                  myController: controller.address,
                  validator: (val) {
                    return validInput(val!, 5, 50, "");
                  }
                  ),
              const SizedBox(
                height: 15,
              ),
              CustomeTextFormAuth(
                  hintText: "",
                  lableText: "الملاحظات",
                  myController: controller.note,
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
