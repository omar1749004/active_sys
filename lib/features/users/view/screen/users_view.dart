import 'package:active_system/controller/admin_controller.dart';
import 'package:active_system/core/class/statuscode.dart';
import 'package:active_system/core/constant/styles.dart';
import 'package:active_system/core/functions/validate_input.dart';
import 'package:active_system/core/shared/ModernTable/custom_modern_table.dart';
import 'package:active_system/core/shared/custom_app_bar.dart';
import 'package:active_system/core/shared/custom_dropdown_menu.dart';
import 'package:active_system/core/shared/custom_table_header.dart';
import 'package:active_system/core/shared/custome_textform_auth.dart';
import 'package:active_system/core/shared/global_variable.dart';
import 'package:active_system/core/shared/loading_indecator.dart';
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
      body: GetBuilder<AdminControllerImp>(builder: (controller) {
        // if (controller.firstState == StatusRequst.loading) {
        //   return const CustomLoadingIndecator();
        // } else {
          return Column(children: [
            const CustomAppBar(),
            Expanded(
              child: SizedBox(
                child: Row(
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
                              onChanged: (p0) {
                                controller.checkSearch(p0);
                              },
                                header: "اداره المستخدمين"),
                            Expanded(
                                flex: 6,
                                child:
                                controller.statusRequs == StatusRequst.loading? const CustomLoadingIndecator():
                                 Container(
                                  color:const Color.fromARGB(255, 218, 218, 218),
                                  child: CustomModernTable(
                                    data: controller.dataInTable,
                                    widths: const [
                                      250,
                                      250,
                                      200,
                                      200,
                                      200,
                                      100
                                    ],
                                    header: const [
                                      "ألاسم",
                                      "ملاحظات",
                                      "الرقم المسلسل",
                                      "الكود",
                                      "الكود",
                                      "الكود"
                                    ],
                                    nameOfGlobalID: 'users',
                                    onRowTap: () {
                                      
                                      controller.assignModel(controller.adminmodelList[GlobalVariable.users!], GlobalVariable.users!) ;
                                    },
                                    showDialog: () {},
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
                                  color: controller.canAdd
                                      ? const Color.fromARGB(217, 255, 255, 255)
                                      : const Color.fromARGB(
                                          217, 202, 193, 193),
                                      ontap: () {
                                         if(controller.canAdd){
                                             controller.addAdmin();
                                         }
                                        
                                      },
                                    ),
                                    CustomButton(
                                      text: "تعديل",
                                  color: !controller.canAdd
                                      ? const Color.fromARGB(217, 255, 255, 255)
                                      : const Color.fromARGB(
                                          217, 202, 193, 193),
                                      ontap: () {
                                        if (!controller.canAdd) {
                                      Get.defaultDialog(
                                          title: "تحذير ",
                                          middleText:
                                              "هل أنت متأكد أنك تريد تعديل الاشتراك",
                                          actions: [
                                            ElevatedButton(
                                                onPressed: () {
                                                  Get.back();
                                                  controller.editAdmin();

                                                },
                                                child: const Text("نعم")),
                                            ElevatedButton(
                                                onPressed: () {
                                                  Get.back();
                                                },
                                                child: const Text("لا")),
                                          ]);
                                    }
                                      },
                                    ),
                                    CustomButton(
                                  color: !controller.canAdd
                                      ? const Color.fromARGB(217, 255, 255, 255)
                                      : const Color.fromARGB(
                                          217, 202, 193, 193),
                                      text: "حذف",
                                      ontap: () {
                                                                            if (!controller.canAdd) {
                                      Get.defaultDialog(
                                          title: "تحذير ",
                                          middleText:
                                              "هل أنت متأكد أنك تريد حذف الاشتراك",
                                          actions: [
                                            ElevatedButton(
                                                onPressed: () {
                                                  Get.back();
                                                  controller.deleteAdmin();
                                                },
                                                child: const Text("نعم")),
                                            ElevatedButton(
                                                onPressed: () {
                                                  Get.back();
                                                },
                                                child: const Text("لا")),
                                          ]);
                                    }
                                      },
                                    ),
                                    CustomButton(
                                      text: "إلغاء",
                                      ontap: () {
                                        controller.cleaModel();
                                      },
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
                        child: 
                        controller.firstState == StatusRequst.loading ?const CustomLoadingIndecator():
                        Form(
                          key: controller.formAdminKey,
                          child: ListView(
                            children: [
                              Text(
                                "بيانات المستخدم",
                                textAlign: TextAlign.center,
                                style: Styles.style23,
                              ),
                              CustomeTextFormAuth(
                                  hintText: "",
                                  myController: controller.name,
                                  lableText: "الاسم",
                                  validator: (val) {
                                    return validInput(val!, 2, 20, "");
                                  }),
                              const SizedBox(
                                width: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
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
                                  ontap: () {
                                    controller.showPassword();
                                    controller.changeIcone();
                                  },
                                  lableText: "كلمة السر",
                                  icone: controller.icone,
                                  obscureText: controller.isHidepass,
                                  validator: (val) {
                                    return validInput(val!, 4, 50, "");
                                  }),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                child: CustomeTextFormAuth(
                                    hintText: "",
                                    myController: controller.repass,
                                    lableText: "تأكيد كلمة السر",
                                    obscureText: true,
                                    validator: (val) {
                                      return validInput(val!, 5, 50, "");
                                    }),
                              ),
                               CustomeTextFormAuth(
                                hintText: "",
                                lableText: "ملاحظات",
                                myController: controller.note,
                                obscureText: true,
                              ),
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
          ]);
        // }
      }),
    );
  }
}
