import 'package:active_system/controller/renew_controller.dart';
import 'package:active_system/core/constant/color.dart';
import 'package:active_system/core/constant/styles.dart';
import 'package:active_system/core/functions/validate_input.dart';
import 'package:active_system/core/shared/custom_botton_copy.dart';
import 'package:active_system/core/shared/custom_date_field.dart';
import 'package:active_system/core/shared/custom_dropdown_menu.dart';
import 'package:active_system/core/shared/custome_textform_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RenewSubscriptionForm extends StatelessWidget {
  const RenewSubscriptionForm({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RenewControllerImp>(
      builder: (controller) => SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              Text(
                "بيانات المستخدم",
                style: Styles.style23,
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 15),
                decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(width: 1))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: CustomBotton1(
                        hieght: 40,
                        text: "بحث",
                        ontap: () {
                          controller.barcodeSearch();
                        },
                        color: ColorApp.kPrimaryColor,
                        marginBottom: 0,
                        marginLeft: 0,
                        marginRight: 0,
                        marginTop: 0,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: CustomeTextFormAuth(
                          myController: controller.barcodeNum,
                          hintText: "",
                          lableText: "الكود",
                          validator: (val) {
                            return validInput(val!, 1, 50, "num");
                          }),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              //
              //here the text field that will shown number of renew
              //
              // const CustomDisplyMany(
              //   many: 101,
              //   text: "رقم التسلسل",
              //   textColor: ColorApp.thirdColor,
              // ),
              const SizedBox(
                height: 10,
              ),
              CustomeTextFormAuth(
                  hintText: "",
                  lableText: "اسم اللاعب",
                  myController: controller.userName,
                  isreadonly: true,
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
                    child: CustomDropDownMenu(
                      items: const ["عام", "خاص"],
                      intialValue: 'عام',
                      onChanged: (p0) {},
                      label: "البائع",
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: CustomDropDownMenu(
                      items: controller.trainerNameList,
                      intialValue: controller.trainerValue,
                      onChanged: (p0) {},
                      label: "المدرب",
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CustomeTextFormAuth(
                myController: controller.note,
                hintText: "",
                lableText: "نسبة المدرب",
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    // child: CustomeTextFormAuth(
                    //     myController: controller.end,
                    //     isreadonly: true,
                    //     hintText: "",
                    //     lableText: "تاريخ النهاية"),
                    child: CustomDateField(
                      label: "تاريخ النهاية",
                      borderRadius: 15,
                      fontSize: 15,
                      width: 145,
                      myController: TextEditingController(
                          text:
                              DateFormat('yyyy-MM-dd').format(controller.end!)),
                      height: 50,
                      iconSize: 20,
                      isaccess: false,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: CustomDateField(
                      label: "تاريخ البداية",
                      borderRadius: 15,
                      fontSize: 15,
                      myController: TextEditingController(
                          text: DateFormat('yyyy-MM-dd')
                              .format(controller.start!)),
                      onChanged: (p0) {
                        controller.start = p0;
                        controller.setEndDate(p0!);
                      },
                      width: 145,
                      height: 50,
                      iconSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CustomDropDownMenu(
                items: controller.subNameList,
                intialValue: controller.subValue,
                onChanged: (p0) {
                  controller.changemodel(p0!);
                },
                label: "نوع الاشتراك",
              ),
              const SizedBox(
                height: 20,
              ),
              CustomDropDownMenu(
                items: const ["عام", "خاص"],
                intialValue: "عام",
                onChanged: (p0) {},
                label: "المجموعة",
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomeTextFormAuth(
                      myController: controller.dayNum,
                      isreadonly: true,
                      hintText: "",
                      lableText: "عدد الايام",
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: CustomeTextFormAuth(
                      myController: controller.sessionNum,
                      hintText: "",
                      isreadonly: true,
                      lableText: "عدد الحصص",
                    ),
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
                      myController: controller.descound,
                      hintText: "",
                      lableText: "الخصم",
                      onChanged: (vla) {
                        controller.calAfterDesc(vla);
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: CustomeTextFormAuth(
                      myController: controller.price,
                      hintText: "",
                      isreadonly: true,
                      lableText: "قيمة الاشتراك",
                    ),
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
                      myController: controller.amount,
                      hintText: "",
                      lableText: "المدفوع",
                      mainTextColor: Colors.red,
                      onChanged: (val) => controller.calPayed(val),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: CustomeTextFormAuth(
                      myController: controller.afterDescound,
                      hintText: "",
                      lableText: "الصافى",
                      isreadonly: true,
                    ),
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
                      myController: controller.remining,
                      hintText: "",
                      isreadonly: true,
                      lableText: "المتبقى",
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: CustomeTextFormAuth(
                      myController: controller.notknow,
                      isreadonly: true,
                      hintText: "",
                      lableText: "حساب سابق",
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomDropDownMenu(
                      items: const ["فيزا", "محفظة", "نقدى"],
                      intialValue: "نقدى",
                      onChanged: (p0) {
                        controller.setTypePaed(p0!);
                      },
                      label: "نوع الدفع",
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: CustomeTextFormAuth(
                      myController: controller.phone,
                      hintText: "",
                      lableText: "التلفون",
                      isreadonly: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              //
              //maybe will change because it is image
              //
              // CustomeTextFormAuth(
              //     hintText: "",
              //     lableText: "الصوره",
              //     validator: (val) {
              //       return validInput(val!, 5, 50, "username");
              //     }),
              const SizedBox(
                height: 10,
              ),
              CustomeTextFormAuth(
                  myController: controller.preNote,
                  hintText: "",
                  lableText: "ملاحظات الللاعب",
                  isreadonly: true,
                  validator: (val) {
                    return validInput(val!, 0, 50, "username");
                  }),
              const SizedBox(
                height: 10,
              ),
              CustomeTextFormAuth(
                myController: controller.note,
                hintText: "",
                lableText: "الملاحظات",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
