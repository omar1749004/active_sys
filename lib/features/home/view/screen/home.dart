import 'package:active_system/core/constant/styles.dart';
import 'package:active_system/core/shared/ModernTable/custom_modern_table.dart';
import 'package:active_system/core/shared/custom_app_bar.dart';
import 'package:active_system/core/shared/custom_table.dart';
import 'package:active_system/core/shared/custom_table_header.dart';
import 'package:active_system/features/home/controller/home_controller.dart';
import 'package:active_system/features/home/data/service/static/header_table.dart';
import 'package:active_system/features/home/data/service/static/note_knoladge.dart';
import 'package:active_system/features/home/view/widget/client_info.dart';
import 'package:active_system/features/manage_subscriptions/view/widgets/custom_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      body: GetBuilder<HomeController>(
        builder: (controller) => Column(
          children: [
            const CustomAppBar(),
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomMenu(
                      pageName: "الصفحة الرئيسية",
                    ),
                    Expanded(
                        flex: 2,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CustomTableHeader(
                                    searchController: controller.search,
                                    header: "سجل الحضور اليومي"),
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
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    // crossAxisAlignment:
                                    //     CrossAxisAlignment.start,
                                    children: [
                                      ...List.generate(
                                        3,
                                        (index) => Row(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                right: 10,
                                                left: 10,
                                              ),
                                              width: 50,
                                              height: 25,
                                              color: val[index],
                                            ),
                                            Text(
                                              keyy[index],
                                              style: Styles.style15B,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                    const VerticalDivider(),
                    const Expanded(
                      flex: 1,
                      child: ClinetInfo(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
