import 'package:active_system/controller/home_controller.dart';
import 'package:active_system/core/class/statuscode.dart';
import 'package:active_system/core/constant/styles.dart';
import 'package:active_system/core/functions/customDialogForHomepage.dart';
import 'package:active_system/core/shared/ModernTable/custom_modern_table.dart';
import 'package:active_system/core/shared/custom_app_bar.dart';
import 'package:active_system/core/shared/custom_table_header.dart';
import 'package:active_system/core/shared/global_variable.dart';
import 'package:active_system/core/shared/loading_indecator.dart';
import 'package:active_system/features/home/data/service/static/note_knoladge.dart';
import 'package:active_system/features/home/view/widget/client_info.dart';
import 'package:active_system/core/shared/custom_button.dart';
import 'package:active_system/features/manage_subscriptions/view/widgets/custom_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
      body: GetBuilder<HomeControllerImp>(
        builder: (controller) {
          // if (controller.firstState == StatusRequst.loading) {
          //   return const CustomLoadingIndecator();
          // } else {
          return Column(
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
                                      onChanged: (p0) {
                                        if (p0.isEmpty) {
                                          controller.viewAll();
                                        } else {
                                          controller.searchFun();
                                        }
                                      },
                                      searchController: controller.search,
                                      header: "سجل الحضور اليومي"),
                                  Expanded(
                                    flex: 6,
                                    child: controller.statusRequs ==
                                            StatusRequst.loading
                                        ? const CustomLoadingIndecator()
                                        : Container(
                                            color: const Color.fromARGB(
                                                255, 218, 218, 218),
                                            child: CustomModernTable(
                                              data: controller.dataInTable,
                                              widths: const [
                                                150,
                                                150,
                                                250,
                                                250,
                                                200,
                                                200,
                                                200,
                                              ],
                                              header: const [
                                                "رقم المتسلسل",
                                                "الكود",
                                                "ألاسم",
                                                "أسم الاشتراك",
                                                "نوع الاشتراك",
                                                "وقت الحضور",
                                                "وقت الانصراف",
                                              ],
                                              nameOfGlobalID: 'home',
                                              selectedIndex:
                                                  controller.selectedIndex,
                                              onRowTap: () async {
                                                controller.attendmodel =
                                                    controller.attendList[
                                                        GlobalVariable.home!];
                                                controller.selectRow(
                                                    GlobalVariable.home!);
                                                // controller.handlSelcetRow();
                                              },
                                              //spicial for Homepage only
                                              thisPageIsHomePage: true,
                                              showDialog: () {
                                                //pass to function model that will get when pressed on user in the table
                                                controller.attendmodel =
                                                    controller.attendList[
                                                        GlobalVariable.home!];
                                                customHomePageDialog(
                                                  controller.attendmodel,
                                                );
                                              },
                                            ),
                                          ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      // crossAxisAlignment:
                                      //     CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            ...List.generate(
                                              3,
                                              (index) => Row(
                                                children: [
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
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
                                        CustomButton(
                                            isActive: controller.canDelete,
                                            text: "حذف",
                                            ontap: () {
                                              Get.defaultDialog(
                                                  title: "تحذير ",
                                                  middleText:
                                                      "هل أنت متأكد أنك تريد حذف حضور اللاعب",
                                                  actions: [
                                                    ElevatedButton(
                                                        onPressed: () {
                                                          Get.back();
                                                          controller
                                                              .deleteTransAction();
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
                                            }),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                      const VerticalDivider(),
                      Expanded(
                        flex: 1,
                        child: controller.firstState == StatusRequst.loading
                            ? const CustomLoadingIndecator()
                            : const ClinetInfo(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
          // }
        },
      ),
    );
  }
}
