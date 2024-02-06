import 'package:active_system/core/constant/styles.dart';
import 'package:active_system/core/functions/validate_input.dart';
import 'package:active_system/core/shared/ModernTable/custom_modern_table.dart';
import 'package:active_system/core/shared/custom_app_bar.dart';
import 'package:active_system/core/shared/custom_dropdown_menu.dart';
import 'package:active_system/core/shared/custom_table.dart';
import 'package:active_system/core/shared/custom_table_header.dart';
import 'package:active_system/core/shared/custome_textform_auth.dart';
import 'package:active_system/features/manage_subscriptions/view/widgets/custom_button.dart';
import 'package:active_system/features/manage_subscriptions/view/widgets/custom_menu.dart';
import 'package:active_system/features/users/controller/users_controller.dart';
import 'package:active_system/features/users/data/service/static/user_header_table.dart';
import 'package:active_system/features/users/view/widget/custom_checkbox_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UsersControllerImp());
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(),
          Expanded(
              child: SizedBox(
            child: GetBuilder<UsersControllerImp>(
              builder: (controller) => Row(
                children: [
                  const CustomMenu(
                    pageName: 'ادارة المستخدمين',
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.only(top: 15, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTableHeader(
                              searchController: controller.search,
                              header: "اداره المستخدمين"),
                          Expanded(
                              flex: 6,
                              child: Container(
                                color: Color.fromARGB(255, 218, 218, 218),
                                child: CustomModernTable(
                                  data: [
                                    [
                                      "aaaaa",
                                      "bbbbbb",
                                      "cccccccc",
                                      "qqqqqqqqqqqqq",
                                      "eeeeeee",
                                      "mmmmmmm"
                                    ],
                                    [
                                      "aaaaa",
                                      "bbbbbb",
                                      "cccccccc",
                                      "qqqqqqqqqqqqq",
                                      "eeeeeee",
                                      "mmmmmmm"
                                    ],
                                    [
                                      "aaaaa",
                                      "bbbbbb",
                                      "cccccccc",
                                      "qqqqqqqqqqqqq",
                                      "eeeeeee",
                                      "mmmmmmm"
                                    ],
                                    [
                                      "aaaaa",
                                      "bbbbbb",
                                      "cccccccc",
                                      "qqqqqqqqqqqqq",
                                      "eeeeeee",
                                      "mmmmmmm"
                                    ],
                                    [
                                      "aaaaa",
                                      "bbbbbb",
                                      "cccccccc",
                                      "qqqqqqqqqqqqq",
                                      "eeeeeee",
                                      "mmmmmmm"
                                    ],
                                    [
                                      "aaaaa",
                                      "bbbbbb",
                                      "cccccccc",
                                      "qqqqqqqqqqqqq",
                                      "eeeeeee",
                                      "mmmmmmm"
                                    ],
                                    [
                                      "dddddddd",
                                      "fffffffff",
                                      "vvvvvvvvv",
                                      "pppppp",
                                      "ooooooooo",
                                      "xxxxxxx"
                                    ]
                                  ],
                                  widths: const [250, 250, 200, 200, 200, 100],
                                  header: const [
                                    "ألاسم",
                                    "ملاحظات",
                                    "الرقم المسلسل",
                                    "الكود",
                                    "الكود",
                                    "الكود"
                                  ],
                                ),
                              )),
                          //buttons
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: Row(
                                textDirection: TextDirection.rtl,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CustomButton(
                                    text: "أضافه",
                                    ontap: () {},
                                  ),
                                  CustomButton(
                                    text: "حفظ",
                                    ontap: () {},
                                  ),
                                  CustomButton(
                                    text: "تعديل",
                                    ontap: () {},
                                  ),
                                  CustomButton(
                                    text: "حذف",
                                    ontap: () {},
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const VerticalDivider(),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Text(
                            "بيانات المستخدم",
                            style: Styles.style23,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: CustomeTextFormAuth(
                                    hintText: "",
                                    lableText: "الاسم",
                                    validator: (val) {
                                      return validInput(val!, 2, 20, "");
                                    }),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 2,
                                child: CustomeTextFormAuth(
                                    hintText: "",
                                    lableText: "كود",
                                    fontSize: 18,
                                    validator: (val) {
                                      return validInput(val!, 2, 20, "num");
                                    }),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 3,
                                    child: CustomDropDownMenu(
                                      items: const ["مدير", "بائع"],
                                      intialValue: "مدير",
                                      onChanged: (val) {},
                                      redius: 30,
                                    )),
                                const Spacer(),
                                const Expanded(
                                    flex: 1,
                                    child: Text(
                                      "النوع",
                                      style: Styles.style15B,
                                      textAlign: TextAlign.start,
                                    ))
                              ],
                            ),
                          ),
                          CustomeTextFormAuth(
                              hintText: "",
                              lableText: "كلمة السر",
                              obscureText: true,
                              validator: (val) {
                                return validInput(val!, 8, 50, "");
                              }),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: CustomeTextFormAuth(
                                hintText: "",
                                lableText: "تأكيد كلمة السر",
                                obscureText: true,
                                validator: (val) {
                                  return validInput(val!, 8, 50, "");
                                }),
                          ),
                          const Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                "الصلاحيات",
                                style: Styles.style15B,
                              )),
                          const SizedBox(
                              height: 350, child: CustomCheckBoxList()),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomeTextFormAuth(
                              hintText: "",
                              lableText: "ملاحظات",
                              obscureText: true,
                              validator: (val) {
                                return validInput(val!, 8, 50, "");
                              }),
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
