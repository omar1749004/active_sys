import 'package:active_system/controller/mange_player.dart';
import 'package:active_system/core/constant/styles%20copy.dart';
import 'package:active_system/core/functions/validate_input.dart';
import 'package:active_system/core/shared/custom_date_field.dart';
import 'package:active_system/core/shared/custom_dropdown_menu.dart';
import 'package:active_system/core/shared/custome_textform_auth.dart';
import 'package:active_system/features/safe/view/widget/custom_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManagePlayersForm extends GetView<MangeUsersControllerImp> {
  const ManagePlayersForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: GetBuilder<MangeUsersControllerImp>(builder:(controller) => 
          Column(
            children: [
              const Text(
                "إدارة الاعبين",
                textAlign: TextAlign.center,
                style: Styles.style25,
              ),
              // const SizedBox(
              //   height: 10,
              // ),
              // const CustomDisplyMany(
              //     textColor: ColorApp.thirdColor,
              //     many: "1000",
              //     text: "رقم العضوية"),
              const SizedBox(
                height: 20,
              ),
              CustomeTextFormAuth(
                  hintText: "",
                  lableText: "الكود",
                  myController: controller.barcodeNum,
                  onChanged: (p0) {
                    controller.handleBarcode();
                  },
                  validator: (val) {
                    return validInput(val!, 1, 50, "num");
                  }),
              const SizedBox(
                height: 10,
              ),
              CustomeTextFormAuth(
                  hintText: "",
                  lableText: "الاسم",
                  myController: controller.userName,
                  validator: (val) {
                    return validInput(val!, 2, 50, "");
                  }),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 2,
                      child: CustomDateField(
                        borderRadius: 20,
                          width: 0, height: 40, iconSize: 16, fontSize: 15)),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      flex: 1,
                      child: Text(
                        "تاريخ الميلاد",
                        style: Styles.style20,
                      )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              CustomeTextFormAuth(
                  hintText: "",
                  lableText: "العمر",
                  myController: controller.age,
                  onChanged: (p0) {
                    controller.handleAge();
                  },
                  validator: (val) {
                    return validInput(val!,1, 50, "");
                  }),
              const SizedBox(
                height: 20,
              ),
              
               CustomDropDownMenu(
                  label: "المدرب",
                  items: controller.trainerNameList,
                  onChanged: (p0) {
                    controller.changeTrainermodel(p0!);
                  },
                  intialValue:controller.trainerValue ),
              const SizedBox(
                height: 20,
              ),
               CustomDropDownMenu(
                  label: "الإشتراك",
                  items: controller.subNameList,
                  
                  onChanged: (p0) {
                    controller.changemodel(p0!);
                    
                  },
                  intialValue: controller.subValue),
              const SizedBox(
                height: 20,
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                   Expanded(
                    child:
                        CustomCheckBox(ischeck: controller.isactiveSub, text: "تفعيل الاشتراك",
                        onTap: () {
                             controller.changeActiveSub(controller.isactiveSub) ;
                        },
                        color: Colors.red,
                        ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomeTextFormAuth(
                        hintText: "",
                        myController: controller.price,
                        isreadonly: true,
                        lableText: "قيمة الاشتراك",
                        mainTextColor: Colors.red,
                        validator: (val) {
                          return validInput(val!, 1, 50, "num");
                        }),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              CustomeTextFormAuth(
                  hintText: "",
                  lableText: "تليفون",
                  myController: controller.phone,
                  validator: (val) {
                    return validInput(val!, 4, 50, "phone");
                  }),
              const SizedBox(
                height: 10,
              ),
               CustomeTextFormAuth(
                hintText: "",
                myController: controller.note,
                lableText: "ملاحظات",
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                height: 150,
                child: const Text(
                  "Camera here",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),),
    );
  }
}
