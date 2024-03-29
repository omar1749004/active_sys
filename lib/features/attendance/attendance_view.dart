import 'package:active_system/controller/attendance_controller.dart';
import 'package:active_system/core/class/statuscode.dart';
import 'package:active_system/core/constant/color.dart';
import 'package:active_system/core/shared/ModernTable/custom_modern_table.dart';
import 'package:active_system/core/shared/custom_botton_copy.dart';
import 'package:active_system/core/shared/custom_app_bar.dart';
import 'package:active_system/core/shared/custom_date_field.dart';
import 'package:active_system/core/shared/custom_dropdown_menu.dart';
import 'package:active_system/core/shared/custom_table_header.dart';
import 'package:active_system/core/shared/loading_indecator.dart';
import 'package:active_system/core/shared/custom_button.dart';
import 'package:active_system/features/manage_subscriptions/view/widgets/custom_menu.dart';
import 'package:active_system/features/safe/view/widget/custom_display_many.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttendanceView extends StatelessWidget {
  const AttendanceView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AttendControllerImp());
    return Scaffold(
      body: GetBuilder<AttendControllerImp>(builder: (controller) {
        // if (controller.firstState == StatusRequst.loading) {
        //   return const CustomLoadingIndecator();
        // } else {
        return Column(children: [
          const CustomAppBar(),
          Expanded(
            child: Row(
              children: [
                //left menu
                const CustomMenu(
                  pageName: 'سجل الحضور',
                ),
                //
                //the content in the middle
                //
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          //
                          //search bar
                          //
                          CustomTableHeader(
                            onChanged: (val) {
                              controller.checkSearch(val);
                            },
                            searchController: controller.searchVal,
                            header: "سجل الحضور ",
                          ),
                          //
                          //date
                          //
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    CustomDateField(
                                        width: 150,
                                        height: 30,
                                        onChanged: (p0) {
                                          controller.endSearch = p0!;
                                          controller.dateSearch(
                                              controller.startSearch,
                                              controller.endSearch);
                                        },
                                        iconSize: 15,
                                        fontSize: 15),
                                    const SizedBox(
                                      width: 50,
                                    ),
                                    const Text(
                                      " الى ",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                Row(
                                  children: [
                                    CustomDateField(
                                        width: 150,
                                        height: 30,
                                        onChanged: (p0) {
                                          controller.startSearch = p0!;
                                          controller.dateSearch(
                                              controller.startSearch,
                                              controller.endSearch);
                                        },
                                        iconSize: 15,
                                        fontSize: 15),
                                    const SizedBox(
                                      width: 50,
                                    ),
                                    const Text(
                                      " من ",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                SizedBox(
                                  child: CustomBotton1(
                                    text: "بحث",
                                    ontap: () {
                                      controller.isdateSearch =
                                          !controller.isdateSearch;
                                      controller
                                          .handlTable(controller.isdateSearch);
                                    },
                                    color: controller.isdateSearch
                                        ? ColorApp.onfoucosColor
                                        : ColorApp.kPrimaryColor,
                                    marginBottom: 0,
                                    marginLeft: 0,
                                    marginRight: 0,
                                    marginTop: 0,
                                  ),
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                              ],
                            ),
                          ),

                          //
                          //table that contains data
                          //
                          Expanded(
                            flex: 5,
                            child:
                                controller.statusRequs == StatusRequst.loading
                                    ? const CustomLoadingIndecator()
                                    : Container(
                                        color: const Color.fromARGB(
                                            255, 218, 218, 218),
                                        child: CustomModernTable(
                                          data: controller.dataInTable,
                                          widths: const [
                                            150,
                                            150,
                                            200,
                                            250,
                                            200,
                                            200,
                                            200,
                                            200,
                                            250,
                                            150
                                          ],
                                          header: const [
                                            "رقم المسلسل",
                                            "الكود",
                                            "التاريخ",
                                            "ألاسم",
                                            "نوع الاشتراك",
                                            "وقت الحضور",
                                            "وقت الانصراف",
                                            "موبايل",
                                            "ملاحظات",
                                            "رقم التجديد",
                                          ],
                                          nameOfGlobalID: 'attendance',
                                          onRowTap: () {},
                                          showDialog: () {},
                                        ),
                                      ),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      height: 40,
                                      child: CustomDisplyMany(
                                          textColor: ColorApp.thirdColor,
                                          many:
                                              controller.totalPlayer.toString(),
                                          text: "عدد الاعبين"),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: CustomDropDownMenu(
                                    items: const ["خاص", "الكل"],
                                    intialValue: 'الكل',
                                    onChanged: (p0) {},
                                    label: "عرض",
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: CustomDropDownMenu(
                                    items: const ["الفلل", "نادى الشرطه"],
                                    intialValue: 'نادى الشرطه',
                                    onChanged: (p0) {},
                                    label: "فرع",
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  child: CustomButton(
                                    text: "طباعه",
                                    ontap: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                  ),
                )
              ],
            ),
          ),
        ]);
        // }
      }),
    );
  }
}
