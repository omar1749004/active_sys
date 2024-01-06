import 'package:active_system/core/constant/color.dart';
import 'package:active_system/core/shared/custom_Botton1.dart';
import 'package:active_system/core/shared/custom_app_bar.dart';
import 'package:active_system/core/shared/custom_date_field.dart';
import 'package:active_system/core/shared/custom_dropdown_menu.dart';
import 'package:active_system/core/shared/custom_table.dart';
import 'package:active_system/core/shared/custom_table_header.dart';
import 'package:active_system/manage_subscriptions/view/widgets/custom_button.dart';
import 'package:active_system/manage_subscriptions/view/widgets/custom_menu.dart';
import 'package:flutter/material.dart';

class AttendanceView extends StatelessWidget {
  const AttendanceView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController search = TextEditingController();
    return Scaffold(
      body: Column(children: [
        const CustomAppBar(),
        Expanded(
          child: Row(
            children: [
              //left menu
              const CustomMenu(),
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
                          width: MediaQuery.of(context).size.width * 0.8,
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
                        flex: 5,
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  height: 40,
                                  child: TextFormField(
                                    textDirection: TextDirection.rtl,
                                    textAlignVertical: TextAlignVertical.center,
                                    textAlign: TextAlign.center,
                                    readOnly: true,
                                    decoration: const InputDecoration(
                                      hintText: "عدد اللاعبين",
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.zero,
                                          borderSide:
                                              BorderSide(color: Colors.black)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black)),
                                    ),
                                  ),
                                ),
                                const Text(
                                  " عدد اللاعبين",
                                )
                              ],
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.2,
                              child: CustomDropDownMenu(
                                items: const ["خاص", "الكل"],
                                intialValue: 'الكل',
                                onChanged: (p0) {},
                                label: "عرض",
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.2,
                              child: CustomDropDownMenu(
                                items: const ["الفلل", "نادى الشرطه"],
                                intialValue: 'نادى الشرطه',
                                onChanged: (p0) {},
                                label: "فرع",
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.1,
                              child: CustomButton(
                                text: "طباعه",
                                ontap: () {},
                              ),
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
        )
      ]),
    );
  }
}
