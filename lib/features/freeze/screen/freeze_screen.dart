import 'package:active_system/controller/freeze_controller.dart';
import 'package:active_system/core/class/statuscode.dart';
import 'package:active_system/core/constant/app_route.dart';
import 'package:active_system/core/constant/color.dart';
import 'package:active_system/core/functions/validate_input.dart';
import 'package:active_system/core/services/services.dart';
import 'package:active_system/core/shared/ModernTable/custom_modern_table.dart';
import 'package:active_system/core/shared/custom_app_bar.dart';
import 'package:active_system/core/shared/custom_date_field.dart';
import 'package:active_system/core/shared/custome_textform_auth.dart';
import 'package:active_system/core/shared/global_variable.dart';
import 'package:active_system/core/shared/loading_indecator.dart';
import 'package:active_system/core/shared/custom_button.dart';
import 'package:active_system/features/manage_subscriptions/view/widgets/custom_menu.dart';
import 'package:active_system/features/freeze/widget/freeeze_screen_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FreezeScreen extends StatelessWidget {
  const FreezeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices services = Get.find();
    Get.put(FreezeControllerImp());
    return Scaffold(
        body: GetBuilder<FreezeControllerImp>(builder: (controller) {
      if (controller.statusRequs == StatusRequst.loading) {
        return const CustomLoadingIndecator();
      } else {
        return Column(children: [
          const CustomAppBar(),
          Expanded(
            child: Row(
              children: [
                //left menu
                const CustomMenu(
                  pageName: 'تجديد الاشتراكات',
                ),
                //
                //the content in the middle
                //
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        //
                        //table that contains data
                        //
                        Expanded(
                          flex: 4,
                          child: controller.statusRequs == StatusRequst.loading
                              ? const CustomLoadingIndecator()
                              : Container(
                                  color:
                                      const Color.fromARGB(255, 218, 218, 218),
                                  child: CustomModernTable(
                                    data: controller.dataInTable,
                                    widths: const [
                                      150,
                                      150,
                                      200,
                                      200,
                                      150,
                                      150,
                                      250,
                                    ],
                                    header: const [
                                      "كود التجميد",
                                      "عددايام التجميد",
                                      "بداية التجميد",
                                      "نهاية التجميد",
                                      "كود المستخدم",
                                      "كود تجديد الاشتراك",
                                      "ملاحظات",
                                    ],
                                    selectedIndex: controller.selectedIndex,
                                    nameOfGlobalID: 'freeze',
                                    onRowTap: () {
                                      controller.assignModel(controller
                                          .freezeList[GlobalVariable.freeze!]);
                                      controller
                                          .selectRow(GlobalVariable.freeze!);
                                    },
                                    showDialog: () {},
                                  ),
                                ),
                        ),
                        //
                        //box التجميد
                        //
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: SingleChildScrollView(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CustomButton(
                                          text: "تجميد",
                                          ontap: () {
                                            controller.addFreeze();
                                          },
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        CustomButton(
                                          text: "حذف",
                                          ontap: () {
                                            if (controller.candelete) {
                                              Get.defaultDialog(
                                                  title: "تحذير ",
                                                  middleText:
                                                      "هل أنت متأكد أنك تريد حذف التجميد",
                                                  actions: [
                                                    ElevatedButton(
                                                        onPressed: () {
                                                          Get.back();
                                                          controller
                                                              .deleteFreeze();
                                                        },
                                                        child:
                                                            const Text("نعم")),
                                                    ElevatedButton(
                                                        onPressed: () {
                                                          Get.back();
                                                        },
                                                        child:
                                                            const Text("لا")),
                                                  ]);
                                            }
                                          },
                                          isActive: controller.candelete
                                              ? true
                                              : false,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        CustomButton(
                                          text: "رجوع",
                                          ontap: () {
                                            Get.offNamed(AppRoute
                                                .renewSybscriptionsView);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Form(
                                          key: controller.formKey,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: CustomeTextFormAuth(
                                                    hintText: "",
                                                    lableText: "عدد الايام",
                                                    myController:
                                                        controller.day,
                                                    onChanged: (p0) {
                                                      controller
                                                          .calcfreezeDate();
                                                    },
                                                    validator: (val) {
                                                      return validInput(
                                                          val!, 1, 50, "num");
                                                    }),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      flex: 5,
                                                      child: CustomDateField(
                                                          width: 200,
                                                          height: 40,
                                                          myController:
                                                              TextEditingController(
                                                            text: DateFormat(
                                                                    'yyyy-MM-dd')
                                                                .format(controller
                                                                    .startSearch),
                                                          ),
                                                          iconSize: 18,
                                                          onChanged: (p0) {
                                                            controller
                                                                    .startSearch =
                                                                p0!;
                                                            controller
                                                                .calcDays();
                                                          },
                                                          fontSize: 15),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Expanded(
                                                      flex: 3,
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 25,
                                                                vertical: 5),
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    170,
                                                                    170,
                                                                    170))),
                                                        child: const Text(
                                                          "فى تاريخ",
                                                          style: TextStyle(
                                                              color: ColorApp
                                                                  .thirdColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                          textAlign:
                                                              TextAlign.center,
                                                          overflow: TextOverflow
                                                              .visible,
                                                          softWrap: false,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: CustomeTextFormAuth(
                                                hintText: "",
                                                myController: controller.note,
                                                lableText: "ملاحظات",
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    flex: 5,
                                                    child: CustomDateField(
                                                        width: 150,
                                                        height: 40,
                                                        iconSize: 18,
                                                        myController: TextEditingController(
                                                            text: DateFormat(
                                                                    'yyyy-MM-dd')
                                                                .format(controller
                                                                    .endSearch)),
                                                        onChanged: (p0) {
                                                          controller.endSearch =
                                                              p0!;
                                                          controller.calcDays();
                                                        },
                                                        fontSize: 15),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 25,
                                                          vertical: 5),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: const Color
                                                                  .fromARGB(
                                                                  255,
                                                                  170,
                                                                  170,
                                                                  170))),
                                                      child: const Text(
                                                        "الى تاريخ",
                                                        style: TextStyle(
                                                            color: ColorApp
                                                                .thirdColor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                        textAlign:
                                                            TextAlign.center,
                                                        overflow: TextOverflow
                                                            .visible,
                                                        softWrap: false,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //
                //form input right screen
                //
                Expanded(
                  flex: 1,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          width: 1,
                          color: Color.fromRGBO(0, 0, 0, 0.186),
                        ),
                        left: BorderSide(
                          width: 1,
                          color: Color.fromRGBO(0, 0, 0, 0.186),
                        ),
                        bottom: BorderSide(
                          width: 1,
                          color: Color.fromRGBO(0, 0, 0, 0.186),
                        ),
                      ),
                    ),
                    child: const FreezeScreenForm(),
                  ),
                ),
              ],
            ),
          )
        ]);
      }
    }));
  }
}
