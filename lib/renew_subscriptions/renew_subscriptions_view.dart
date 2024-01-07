import 'package:active_system/core/constant/color.dart';
import 'package:active_system/core/shared/custom_Botton1.dart';
import 'package:active_system/core/shared/custom_app_bar.dart';
import 'package:active_system/core/shared/custom_date_field.dart';
import 'package:active_system/core/shared/custom_table.dart';
import 'package:active_system/core/shared/custom_table_header.dart';
import 'package:active_system/manage_subscriptions/view/widgets/custom_button.dart';
import 'package:active_system/manage_subscriptions/view/widgets/custom_menu.dart';
import 'package:active_system/renew_subscriptions/widgets/renew_subscription_form.dart';
import 'package:flutter/material.dart';

class RenewSybscriptionsView extends StatelessWidget {
  RenewSybscriptionsView({super.key});

  final TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const CustomAppBar(),
        Expanded(
          child: Row(
            children: [
              //left menu
              const CustomMenu(
                pageName: 'تجديد الاشتراكات',
              ),
              //the content in the middle
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      //
                      //search bar
                      //
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: CustomTableHeader(
                            searchController: search,
                            header: "",
                          )),
                      //
                      //date
                      //
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomDateField(
                                width: 150,
                                height: 30,
                                icon: Icons.close,
                                iconSize: 15,
                                fontSize: 15),
                            const Text(
                              "الى ",
                              style: TextStyle(fontSize: 18),
                            ),
                            CustomDateField(
                                width: 150,
                                height: 30,
                                icon: Icons.close,
                                iconSize: 15,
                                fontSize: 15),
                            const Text(
                              "من ",
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              child: CustomBotton1(
                                hieght: 40,
                                text: "بحث",
                                ontap: () {},
                                color: ColorApp.kPrimaryColor,
                                marginBottom: 0,
                                marginLeft: 0,
                                marginRight: 0,
                                marginTop: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      //
                      //table that contains data
                      //
                      Expanded(
                        flex: 6,
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
                      //buttons
                      //
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomButton(
                              text: "تجميد",
                              ontap: () {},
                            ),
                            CustomButton(
                              text: "طباعة",
                              ontap: () {},
                            ),
                            CustomButton(
                              text: "حذف",
                              ontap: () {},
                            ),
                            CustomButton(
                              text: "تعديل",
                              ontap: () {},
                            ),
                            CustomButton(
                              text: "تجديد",
                              ontap: () {},
                            )
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
                child: const RenewSubscriptionForm(),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
