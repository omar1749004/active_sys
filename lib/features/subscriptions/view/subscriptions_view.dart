import 'package:active_system/core/shared/customSearch.dart';
import 'package:active_system/core/shared/custom_app_bar.dart';
import 'package:active_system/core/shared/custom_table.dart';
import 'package:active_system/manage_subscriptions/view/widgets/custom_button.dart';
import 'package:active_system/manage_subscriptions/view/widgets/custom_input_form.dart';
import 'package:active_system/manage_subscriptions/view/widgets/custom_menu.dart';
import 'package:flutter/material.dart';

class SubscriptionsView extends StatelessWidget {
  SubscriptionsView({super.key});

  final TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //AppBar
          const CustomAppBar(),
          Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  //left menu
                  const CustomMenu(pageName: 'ادارة الاشتراكات',),
                  //the content in the middle
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        //search bar
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: CustomSearch(
                              searchController: search,
                              titlAppbar: "بحث",
                              onChanged: (val) {},
                              onPressedSearch: () {},
                            ),
                          ),
                        ),
                        //table that contains data

                         Expanded(
                          flex: 6,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: CustomTable(columnsHeader:const [
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
                        ),
                        //buttons
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Row(
                              textDirection: TextDirection.rtl,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomButton(
                                  text: "أضافه",
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
                                CustomButton(
                                  text: "طباعة",
                                  ontap: () {},
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //form input right screen
                  Container(
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
                    child: const SubscriptionForm(),
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
