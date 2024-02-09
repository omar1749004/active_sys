import 'package:active_system/core/constant/color.dart';
import 'package:active_system/core/shared/ModernTable/custom_modern_table.dart';
import 'package:active_system/core/shared/custom_app_bar.dart';
import 'package:active_system/core/shared/custom_table_header.dart';
import 'package:active_system/features/manage_players/widgets/manage_players_form.dart';
import 'package:active_system/features/manage_players/widgets/search_tools.dart';
import 'package:active_system/features/manage_subscriptions/view/widgets/custom_menu.dart';
import 'package:active_system/features/safe/view/widget/custom_display_many.dart';
import 'package:flutter/material.dart';

class ManagePlayers extends StatelessWidget {
  const ManagePlayers({super.key});

  @override
  Widget build(BuildContext context) {
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
                    pageName: 'ادارة الاعبين',
                  ),
                  //
                  //the content in the middle
                  //
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          //
                          //search bar
                          //
                          Row(
                            children: [
                              const Expanded(
                                flex: 1,
                                child: CustomDisplyMany(
                                    textColor: ColorApp.thirdColor,
                                    many: 1500,
                                    text: "عدد الاعبين"),
                              ),
                              Expanded(
                                flex: 2,
                                child: CustomTableHeader(
                                  searchController: TextEditingController(),
                                  header: "",
                                ),
                              ),
                            ],
                          ),
                          //
                          //DropDown and checkbox for search
                          //
                          const Expanded(child: SearchTools()),
                          //
                          //table that contains data
                          //
                          Expanded(
                            flex: 2,
                            child: Container(
                              color: const Color.fromARGB(255, 218, 218, 218),
                              child: const CustomModernTable(
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
                                  ],
                                  [
                                    "dddddddd",
                                    "fffffffff",
                                    "vvvvvvvvv",
                                    "pppppp",
                                    "ooooooooo",
                                    "xxxxxxx"
                                  ],
                                  [
                                    "dddddddd",
                                    "fffffffff",
                                    "vvvvvvvvv",
                                    "pppppp",
                                    "ooooooooo",
                                    "xxxxxxx"
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
                                widths: [250, 250, 200, 200, 200, 100],
                                header: [
                                  "ألاسم",
                                  "ملاحظات",
                                  "الرقم المسلسل",
                                  "الكود",
                                  "الكود",
                                  "الكود"
                                ],
                              ),
                            ),
                          ),
                          //
                          //buttons
                          //
                        ],
                      ),
                    ),
                  ),

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
                      child: const ManagePlayersForm(),
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