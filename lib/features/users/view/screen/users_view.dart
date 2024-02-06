import 'package:active_system/controller/admin_controller.dart';
import 'package:active_system/core/constant/styles.dart';
import 'package:active_system/core/functions/validate_input.dart';
import 'package:active_system/core/shared/ModernTable/custom_modern_table.dart';
import 'package:active_system/core/shared/custom_app_bar.dart';
import 'package:active_system/core/shared/custom_dropdown_menu.dart';
import 'package:active_system/core/shared/custom_table_header.dart';
import 'package:active_system/core/shared/custome_textform_auth.dart';
import 'package:active_system/features/manage_subscriptions/view/widgets/custom_button.dart';
import 'package:active_system/features/manage_subscriptions/view/widgets/custom_menu.dart';
import 'package:active_system/features/users/view/widget/custom_checkbox_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AdminControllerImp());
    return Scaffold(
      body:
      GetBuilder<AdminControllerImp>(
              builder: (controller) =>
       Column(
        children: [
          const CustomAppBar(),
          Expanded(
              child: SizedBox(
            child:  Row(
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
                                    ontap: () {
                                      controller.addAdmin();
                                     // controller.assignSelectAdminPowers(controller.powersMap[1]!);
                                    },
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
                      child: Form(
                        key: controller.formKey,
                        child: ListView(
                          children: [
                            Text(
                              "بيانات المستخدم",
                              style: Styles.style23,
                            ),
                            CustomeTextFormAuth(
                                hintText: "",
                                lableText: "الاسم",
                                validator: (val) {
                                  return validInput(val!, 2, 20, "");
                                }),
                            const SizedBox(
                              width: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 3,
                                      child: CustomDropDownMenu(
                                        items: const ["مدير"],
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
                                isShowIcone: true,
                                myController: controller.pass,
                                ontap:() {
                                  controller.showPassword();},
                                lableText: "كلمة السر",
                                icone: controller.changeIcone(),
                                obscureText: controller.isHidepass,
                                validator: (val) {
                                  return validInput(val!, 5, 50, "");
                                }),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: CustomeTextFormAuth(
                                  hintText: "",
                                  myController: controller.repass,
                                  lableText: "تأكيد كلمة السر",
                                  obscureText: true,
                                  validator: (val) {
                                    return validInput(val!, 5, 50, "");
                                  }),
                            ),
                          const  CustomeTextFormAuth(
                                hintText: "",
                                lableText: "ملاحظات",
                                obscureText: true,),
                            const Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  "الصلاحيات",
                                  style: Styles.style15B,
                                )),
                             SizedBox(
                                height: 400, child: CustomCheckBoxList()),
                            const SizedBox(
                              height: 10,
                            ),
                            
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
