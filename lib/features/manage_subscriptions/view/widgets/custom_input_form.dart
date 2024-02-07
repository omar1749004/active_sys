import 'package:active_system/controller/sub_controller.dart';
import 'package:active_system/core/constant/styles.dart';
import 'package:active_system/core/functions/validate_input.dart';
import 'package:active_system/core/shared/custome_textform_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubscriptionForm extends GetView<MangeSubControllerImp> {
  const SubscriptionForm({super.key});
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
                "إدارة الاشتراكات",
                textAlign: TextAlign.center,
                style: Styles.style23,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomeTextFormAuth(
                  hintText: "",
                  myController: controller.name,
                  lableText: " اسم الاشتراك",
                  validator: (val) {
                    return validInput(val!, 3, 50, "");
                  }),
              const SizedBox(
                height: 20,
              ),
              CustomeTextFormAuth(
                  hintText: "",
                  lableText: "نوع الاشتراك",
                  myController: controller.type,
                  validator: (val) {
                    return validInput(val!, 3, 50, "");
                  }),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomeTextFormAuth(
                        hintText: "",
                        lableText: "تكلفة الاشتراك",
                        myController: controller.price,
                        mainTextColor: Colors.red,
                        onChanged: (p0) {
                          controller.handlePrice();
                        },
                        validator: (val) {
                          return validInput(val!, 1, 50, "num");
                        }),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomeTextFormAuth(
                        hintText: "",
                        lableText: "التخصص",
                        myController: controller.specialization,
                        isreadonly: true,
          
                        ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomeTextFormAuth(
                        hintText: "",
                        lableText: " عدد الايام",
                        mainTextColor: Colors.red,
                        myController: controller.day,
                        onChanged: (p0) {
                          controller.handleDay();
                        },
                        validator: (val) {
                          return validInput(val!, 1, 50, "num");
                        }),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomeTextFormAuth(
                        hintText: "",
                        lableText: " عدد الحصص",
                        mainTextColor: Colors.red,
                        myController: controller.sessionsNumber,
                        onChanged: (p0) {
                          controller.handleSessionsNumber();
                        },
                        validator: (val) {
                          return validInput(val!,1, 50, "num");
                        }),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CustomeTextFormAuth(
                  hintText: "",
                  lableText: "اقصى عدد ايام تجميد للمره الواحده",
                  myController: controller.maxFrezzDay,
                  onChanged: (p0) {
                    controller.handleMaxFrezzDay();
                  },
          
                  ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomeTextFormAuth(
                        hintText: "",
                        lableText: "عدد الدعوات",
                        myController: controller.invitationsNumber,
                        onChanged: (p0) {
                          controller.handleInvitationsNumber();
                        },
                        ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomeTextFormAuth(
                      hintText: "",
                      lableText: "عدد الخدمات",
                      myController: controller.serviceNumber,
                      onChanged: (p0) {
                        controller.handleServiceNumber();
                      },
          
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CustomeTextFormAuth(
                  hintText: "",
                  lableText: " اقصى عدد دعوات فى اليوم",
                  myController: controller.maxInvitation,
                  onChanged: (p0) {
                    controller.handleMaxInvitation();
                  },
          
                  ),
              const SizedBox(
                height: 10,
              ),
              CustomeTextFormAuth(
                  hintText: "",
                  lableText: "اقصى عدد خدمات فى اليوم",
                  myController: controller.maxService,
                  onChanged: (p0) {
                    controller.handleMaxService();
                  },
          
                  ),
              const SizedBox(
                height: 20,
              ),
              CustomeTextFormAuth(
                hintText: "",
                lableText: "ملاحظات",
                myController: controller.notes,
          
              ),
            ],
          ),
        ),
      ),
    );
  }
}
