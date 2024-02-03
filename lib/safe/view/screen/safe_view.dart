import 'package:active_system/core/constant/color.dart';
import 'package:active_system/core/constant/styles.dart';
import 'package:active_system/core/functions/validate_input.dart';
import 'package:active_system/core/shared/custom_app_bar.dart';
import 'package:active_system/core/shared/custom_table.dart';
import 'package:active_system/core/shared/custome_textform_auth.dart';
import 'package:active_system/manage_subscriptions/view/widgets/custom_button.dart';
import 'package:active_system/manage_subscriptions/view/widgets/custom_menu.dart';
import 'package:active_system/safe/controller/safe_controller.dart';
import 'package:active_system/safe/data/service/static/safe_header_table.dart';
import 'package:active_system/safe/view/widget/custom_checkbox.dart';
import 'package:active_system/safe/view/widget/custom_display_many.dart';
import 'package:active_system/safe/view/widget/custom_search_date.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SafeView extends StatelessWidget {
  const SafeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SafeControllerImp());
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(),
          Expanded(
              child: SizedBox(
            child: GetBuilder<SafeControllerImp>(
              builder: (controller) => Row(
                children: [
                  const CustomMenu(
                    pageName: 'الخزنة',
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      padding: const EdgeInsets.only(top: 15, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        const  Padding(
                            padding:  EdgeInsets.symmetric(vertical: 10),
                            child: CustomSearchDate()
                          ),
                          //
                          Expanded(
                            flex: 6,
                            child: CustomTable(
                                columnsHeader: safeHeaderTable,
                                rowInfo: const [
                                
                                ]),
                          ),
                          Expanded(child: Container())
                          //buttons
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
                          //           ontap: () {},
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
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Text(
                            "بيانات الخزنة",
                            style: Styles.style23,
                          ),
                          CustomDisplyMany(
                              textColor: ColorApp.secondColor,
                              many: 1500,
                              text: "المجود بالخزنة الان"),
                          CustomDisplyMany(
                              textColor: ColorApp.gray,
                              many: 1500,
                              text: "اجمالي المشتريات"),
                          CustomDisplyMany(
                              textColor: ColorApp.gray,
                              many: 1500,
                              text: "   اجمالي المبيعات"),
                      const    Divider(),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text(
                              "إضافة عملية",
                              style: Styles.style23,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: CustomCheckBox(
                                  ischeck: true,
                                  text: "إيداع",
                                  onTap: () {},
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: CustomCheckBox(
                                  ischeck: false,
                                  text: "سحب",
                                  onTap: () {},
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
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: CustomeTextFormAuth(
                                hintText: "",
                                lableText: "سبب السحب",
                                validator: (val) {
                                  return validInput(val!, 2, 50, "");
                                }),
                          ),
                          CustomeTextFormAuth(
                              hintText: "",
                              lableText: "المبلغ",
                              validator: (val) {
                                return validInput(val!, 8, 50, "");
                              }),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Row(
                              children: [
                                Expanded(
                                  child: CustomeTextFormAuth(
                                      hintText: "",
                                      lableText: "الشريك",
                                      validator: (val) {
                                        return validInput(val!, 8, 50, "");
                                      }),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: CustomeTextFormAuth(
                                      hintText: "",
                                      lableText: "تاريخ السحب",
                                      validator: (val) {
                                        return validInput(val!, 8, 50, "");
                                      }),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomButton(
                                  text: "إالغاء",
                                  ontap: () {},
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: CustomButton(
                                  text: "تنفيذ",
                                  ontap: () {},
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}
