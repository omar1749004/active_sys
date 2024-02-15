import 'package:active_system/controller/mange_player.dart';
import 'package:active_system/core/class/statuscode.dart';
import 'package:active_system/core/constant/color.dart';
import 'package:active_system/core/shared/ModernTable/custom_modern_table.dart';
import 'package:active_system/core/shared/custom_app_bar.dart';
import 'package:active_system/core/shared/custom_table_header.dart';
import 'package:active_system/core/shared/loading_indecator.dart';
import 'package:active_system/features/manage_players/widgets/manage_players_form.dart';
import 'package:active_system/features/manage_players/widgets/search_tools.dart';
import 'package:active_system/features/manage_subscriptions/view/widgets/custom_button.dart';
import 'package:active_system/features/manage_subscriptions/view/widgets/custom_menu.dart';
import 'package:active_system/features/safe/view/widget/custom_display_many.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManagePlayers extends StatelessWidget {
  const ManagePlayers({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MangeUsersControllerImp());
    return Scaffold(
        body: GetBuilder<MangeUsersControllerImp>(builder: (controller) {
      // if (controller.firstState == StatusRequst.loading) {
      //   return const CustomLoadingIndecator();
      // } else {
        return Column(
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
                                Expanded(
                                  flex: 1,
                                  child: CustomDisplyMany(
                                      textColor: ColorApp.thirdColor,
                                      many: controller.totalPlayers.toString(),
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

                            Expanded(
                              flex: 8,
                              child:
                              controller.statusRequs == StatusRequst.loading ?const CustomLoadingIndecator():
                               Container(
                                color: const Color.fromARGB(255, 218, 218, 218),
                                child: CustomModernTable(
                                  data: controller.dataInTable,
                                  widths: [250, 250, 200, 200, 200, 100],
                                  header: [
                                    "ألاسم",
                                    "ملاحظات",
                                    "الرقم المسلسل",
                                    "الكود",
                                    "الكود",
                                    "الكود"
                                  ],
                                  nameOfGlobalID: 'managePlayers',
                                  onRowTap: () {},
                                  showDialog: () {},
                                ),
                              ),
                            ),
                            //
                            //DropDown and checkbox for search
                            //
                            const Expanded(flex: 2, child: SearchTools()),
                            //
                            //table that contains data
                            //
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
                                        controller.addUsers();
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

                    //form input right screen
                    //
                    Expanded(
                      flex: 1,
                      child:
                      controller.firstState == StatusRequst.loading ?const CustomLoadingIndecator():
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
                        child: const ManagePlayersForm(),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      // }
    }));
  }
}
