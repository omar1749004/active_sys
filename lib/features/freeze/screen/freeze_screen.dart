import 'package:active_system/controller/freeze_controller.dart';
import 'package:active_system/core/constant/color.dart';
import 'package:active_system/core/functions/validate_input.dart';
import 'package:active_system/core/shared/custom_app_bar.dart';
import 'package:active_system/core/shared/custom_date_field.dart';
import 'package:active_system/core/shared/custom_table.dart';
import 'package:active_system/core/shared/custome_textform_auth.dart';
import 'package:active_system/features/manage_subscriptions/view/widgets/custom_button.dart';
import 'package:active_system/features/manage_subscriptions/view/widgets/custom_menu.dart';
import 'package:active_system/features/freeze/widget/freeeze_screen_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FreezeScreen extends StatelessWidget {
  const FreezeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FreezeControllerImp());
    return Scaffold(
      body:
      GetBuilder<FreezeControllerImp>(builder: (controller) => 
       Column(children: [
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      //
                      //table that contains data
                      //
                      Expanded(
                        flex: 4,
                        child: CustomTable(columnsHeader: const [
                          Text("1"),
                          Text("2"),
                          Text("3"),
                          Text("4"),
                          Text("1"),
                          Text("2"),
                          Text("3"),
                          Text("1"),
                          Text("2"),
                          Text("3"),
                          Text("4"),
                          Text("1"),
                          Text("2"),
                        ], rowInfo: const []),
                      ),
                      //
                      //box التجميد
                      //
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                      ontap: () {},
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Form(
                                      key: controller.formKey,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: CustomeTextFormAuth(
                                                hintText: "",
                                                lableText: "عدد الايام",
                                                myController: controller.day,
                                                isreadonly: true,
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
                                                      iconSize: 18,
                                                      onChanged: (p0) {
                                                        controller.startSearch = p0! ;
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
                                                                .fromARGB(255,
                                                                170, 170, 170))),
                                                    child: const Text(
                                                      "فى تاريخ",
                                                      style: TextStyle(
                                                          color:
                                                              ColorApp.thirdColor,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                      textAlign: TextAlign.center,
                                                      overflow:
                                                          TextOverflow.visible,
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
                                                    onChanged: (p0) {
                                                      controller.endSearch = p0! ;
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
                                                              .fromARGB(255,
                                                              170, 170, 170))),
                                                  child: const Text(
                                                    "الى تاريخ",
                                                    style: TextStyle(
                                                        color:
                                                            ColorApp.thirdColor,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                    textAlign: TextAlign.center,
                                                    overflow:
                                                        TextOverflow.visible,
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
      ]),)
    );
  }
}
