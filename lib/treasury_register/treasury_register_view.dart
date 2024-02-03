import 'package:active_system/core/constant/color.dart';
import 'package:active_system/core/shared/custom_app_bar.dart';
import 'package:active_system/core/shared/custom_table.dart';
import 'package:active_system/core/shared/custom_table_header.dart';
import 'package:active_system/manage_subscriptions/view/widgets/custom_button.dart';
import 'package:active_system/manage_subscriptions/view/widgets/custom_menu.dart';
import 'package:active_system/safe/view/widget/custom_display_many.dart';
import 'package:active_system/trainers/widgets/custom_input_form.dart';
import 'package:active_system/treasury_register/widgets/treasury_register_form.dart';
import 'package:flutter/material.dart';

class TreasuryRegisterView extends StatelessWidget {
  const TreasuryRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController search = TextEditingController();
    return Scaffold(
      body: Column(
        children: [
          //
          //AppBar
          //
          const CustomAppBar(),
          //
          //content in the middle
          //
          Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  //
                  //left menu
                  //
                  const CustomMenu(
                    pageName: 'سجل الخزنة',
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
                            flex: 11,
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
                            ], rowInfo: const [
                              'data11',
                              "data12",
                              "data13",
                              "data14",
                              'data11',
                              "data12",
                              "data13",
                              "data13",
                              "data14",
                              'data11',
                              "data13",
                              "data14",
                              'data11',
                              "data13",
                              "data14",
                              'data11',
                            ]),
                          ),
                          //
                          //data of table
                          //
                          const Expanded(
                            flex: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.0),
                                    child: CustomDisplyMany(
                                        textColor: ColorApp.thirdColor,
                                        many: 10000,
                                        text: "الاجمالى"),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.0),
                                    child: CustomDisplyMany(
                                        textColor: ColorApp.thirdColor,
                                        many: 10000,
                                        text: "الصافى"),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.0),
                                    child: CustomDisplyMany(
                                        textColor: ColorApp.thirdColor,
                                        many: 10000,
                                        text: "الصافى"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //
                          //buttons
                          //
                          Expanded(
                            flex: 1,
                            child: Row(
                              textDirection: TextDirection.rtl,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomButton(
                                  text: "تنفيذ",
                                  ontap: () {},
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                CustomButton(
                                  text: "تنفيذ وطباعه",
                                  ontap: () {},
                                ),
                              ],
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
                      width: 300,
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
                      child: const TreasuryRegisterForm(),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
