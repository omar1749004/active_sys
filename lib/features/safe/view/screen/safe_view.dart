import 'package:active_system/controller/safe_controller.dart';
import 'package:active_system/core/class/statuscode.dart';
import 'package:active_system/core/constant/color.dart';
import 'package:active_system/core/constant/styles.dart';
import 'package:active_system/core/functions/validate_input.dart';
import 'package:active_system/core/shared/ModernTable/custom_modern_table.dart';
import 'package:active_system/core/shared/custom_app_bar.dart';
import 'package:active_system/core/shared/custom_date_field.dart';
import 'package:active_system/core/shared/custome_textform_auth.dart';
import 'package:active_system/core/shared/loading_indecator.dart';
import 'package:active_system/features/manage_subscriptions/view/widgets/custom_button.dart';
import 'package:active_system/features/manage_subscriptions/view/widgets/custom_menu.dart';
import 'package:active_system/features/safe/view/widget/custom_checkbox.dart';
import 'package:active_system/features/safe/view/widget/custom_display_many.dart';
import 'package:active_system/features/safe/view/widget/custom_search_date.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SafeView extends StatelessWidget {
  const SafeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SafeControllerImp());
    return Scaffold(
      body: GetBuilder<SafeControllerImp>(builder: (controller) {
        // if (controller.firstState == StatusRequst.loading) {
        //   return const CustomLoadingIndecator();
        // } else {
        return Column(
          children: [
            const CustomAppBar(),
            Expanded(
              child: SizedBox(
                child: Row(
                  children: [
                    const CustomMenu(
                      pageName: 'الخزنة',
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.only(top: 15, left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: CustomSearchDate(
                                  ontap: () {
                                    controller.isdateSearch =
                                        !controller.isdateSearch;
                                    controller
                                        .handlTable(controller.isdateSearch);
                                  },
                                  color: controller.isdateSearch
                                      ? ColorApp.onfoucosColor
                                      : ColorApp.kPrimaryColor,
                                )),
                            //
                            Expanded(
                              flex: 6,
                              child:
                                  controller.statusRequs == StatusRequst.loading
                                      ? const CustomLoadingIndecator()
                                      : Container(
                                          color: const Color.fromARGB(
                                              255, 218, 218, 218),
                                          child: CustomModernTable(
                                            data: controller.dataInTable,
                                            widths: const [
                                              150,
                                              250,
                                              200,
                                              150,
                                              150,
                                              150,
                                              150,
                                              200
                                            ],
                                            header: const [
                                              "رقم التسلسل",
                                              "وصف",
                                              "التاريخ",
                                              "الوارد",
                                              "الصادر",
                                              "المتبقى",
                                              "النوع",
                                              "المستخدم"
                                            ],
                                            nameOfGlobalID: 'safe',
                                            onRowTap: () {},
                                            showDialog: () {},
                                          ),
                                        ),
                            ),
                            // /
                            //buttons
                            //
                            // Expanded(
                            //   flex: 1,
                            //   child: Padding(
                            //     padding: const EdgeInsets.only(bottom: 20.0),
                            //     child: Row(
                            //       textDirection: TextDirection.rtl,
                            //       mainAxisAlignment:
                            //           MainAxisAlignment.spaceEvenly,
                            //       children: [
                            //         CustomButton(
                            //           text: "أضافه",
                            //           ontap: () {},
                            //         ),
                            //         CustomButton(
                            //           text: "حفظ",
                            //           ontap: () {},
                            //         ),
                            //         CustomButton(
                            //           text: "تعديل",
                            //           ontap: () {},
                            //         ),
                            //         CustomButton(
                            //           text: "حذف",
                            //           ontap: () {
                            //             controller.getpdf();
                            //           },
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                    const VerticalDivider(),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Form(
                          key: controller.formKey,
                          child: Column(
                            children: [
                              Text(
                                "بيانات الخزنة",
                                style: Styles.style23,
                              ),
                              CustomDisplyMany(
                                  textColor: ColorApp.secondColor,
                                  many: controller.toralSafe.toString(),
                                  text: "المجود بالخزنة الان"),
                              CustomDisplyMany(
                                  textColor: ColorApp.gray,
                                  many: controller.toralOutcoming.toString(),
                                  text: "اجمالي المشتريات"),
                              CustomDisplyMany(
                                  textColor: ColorApp.gray,
                                  many: controller.toralIncoming.toString(),
                                  text: "   اجمالي المبيعات"),
                              const Divider(),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Text(
                                  "إضافة عملية",
                                  style: Styles.style23,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: CustomCheckBox(
                                      ischeck: controller.typeOfSafe == 4
                                          ? true
                                          : false,
                                      text: "إيداع",
                                      onTap: () {
                                        controller.changeSfarType(4);
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: CustomCheckBox(
                                      ischeck: controller.typeOfSafe == 3
                                          ? true
                                          : false,
                                      text: "سحب",
                                      onTap: () {
                                        controller.changeSfarType(3);
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    "نوع العملية",
                                    style: Styles.style15B,
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: CustomeTextFormAuth(
                                    hintText: "",
                                    myController: controller.reason,
                                    lableText: controller.changeReson(),
                                    validator: (val) {
                                      return validInput(val!, 4, 50, "");
                                    }),
                              ),
                              CustomeTextFormAuth(
                                  hintText: "",
                                  lableText: "المبلغ",
                                  myController: controller.amount,
                                  onChanged: (p0) {
                                    controller.validatenum(p0);
                                  },
                                  validator: (val) {
                                    return validInput(val!, 1, 50, "num");
                                  }),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: CustomeTextFormAuth(
                                        hintText: "",
                                        lableText: "الشريك",
                                        myController: controller.adminName,
                                        isreadonly: true,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: CustomDateField(
                                        label: controller.changeDate(),
                                        borderRadius: 15,
                                        fontSize: 15,
                                        currentValue: DateTime.now(),
                                        width: 210,
                                        height: 50,
                                        iconSize: 20,
                                        isaccess: false,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomButton(
                                      text: "إلغاء",
                                      ontap: () {
                                        controller.reason.text = "";
                                        controller.amount.text = "";
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: CustomButton(
                                      text: "تنفيذ",
                                      ontap: () {
                                        controller.addTrandsAction();
                                      },
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
          ],
        );
        // }
      }),
    );
  }
}
