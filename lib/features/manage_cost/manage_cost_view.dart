import 'package:active_system/controller/expenses_controller.dart';
import 'package:active_system/core/class/statuscode.dart';
import 'package:active_system/core/constant/color.dart';
import 'package:active_system/core/shared/ModernTable/custom_modern_table.dart';
import 'package:active_system/core/shared/custom_botton_copy.dart';
import 'package:active_system/core/shared/custom_app_bar.dart';
import 'package:active_system/core/shared/custom_date_field.dart';
import 'package:active_system/core/shared/custom_table_header.dart';
import 'package:active_system/core/shared/global_variable.dart';
import 'package:active_system/core/shared/loading_indecator.dart';
import 'package:active_system/features/manage_cost/widgets/manage_cost_form.dart';
import 'package:active_system/core/shared/custom_button.dart';
import 'package:active_system/features/manage_subscriptions/view/widgets/custom_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageCostView extends StatefulWidget {
  const ManageCostView({super.key});

  @override
  State<ManageCostView> createState() => _ManageCostViewState();
}

class _ManageCostViewState extends State<ManageCostView> {
  @override
  Widget build(BuildContext context) {
    Get.put(ExpensesControllerImp());
    return Scaffold(
      body: GetBuilder<ExpensesControllerImp>(
        builder: (controller) {
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
                child: Row(
                  children: [
                    //
                    //left menu
                    //
                    const CustomMenu(
                      pageName: "ادارة المصروفات",
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
                            //search bar
                            //
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: CustomTableHeader(
                                onChanged: (p0) {
                                  controller.checkSearch(p0);
                                },
                                searchController: controller.search,
                                header: "سجل المصروفات",
                              ),
                            ),

                            //
                            //date
                            //
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CustomDateField(
                                      width: 150,
                                      height: 30,
                                      onChanged: (p0) {
                                        controller.endSearch = p0!;
                                        controller.handlTable(controller.isdateSearch) ;
                                        
                                      },
                                      iconSize: 15,
                                      fontSize: 15),
                                  const Text(
                                    "الى ",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  CustomDateField(
                                      width: 150,
                                      height: 30,
                                      onChanged: (p0) {
                                        controller.startSearch = p0!;
                                       controller.handlTable(controller.isdateSearch) ;
                                      },
                                      iconSize: 15,
                                      fontSize: 15),
                                  const Text(
                                    "من ",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(
                                    child: CustomBotton1(
                                      text: "بحث",
                                      ontap: () {
                                        
                                        controller.isdateSearch =
                                            !controller.isdateSearch;
                                        controller.handlTable(
                                            controller.isdateSearch);
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
                                ],
                              ),
                            ),
                            //
                            //table that contains data
                            //
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
                                        widths: const [150, 150, 250, 200, 150,250],
                                        header: const [
                                          "التسلسل",
                                          "قيمة المصروف",
                                          "سبب الصرف",
                                          "تاريخ الصرف",
                                          "الشريك",
                                          "ملاحظات"
                                        ],
                                        selectedIndex:
                                              controller.selectedIndex ,
                                        nameOfGlobalID: 'manageCost',
                                        onRowTap: () {
                                          controller.assignModel(
                                              controller.expensesList[
                                                  GlobalVariable.manageCost!]);
                                              controller.selectRow(GlobalVariable.manageCost!) ;
                                        },
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
                                textDirection: TextDirection.rtl,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CustomButton(
                                    text: "أضافه",
                                    ontap: () {
                                      if (controller.canAdd) {
                                        controller.addTrandsAction();
                                      }
                                    },
                                    isActive: controller.canAdd ? true : false,
                                  ),
                                  CustomButton(
                                    text: "تعديل",
                                    ontap: () {
                                      if (!controller.canAdd) {
                                        Get.defaultDialog(
                                            title: "تحذير ",
                                            middleText:
                                                "هل أنت متأكد أنك تريد تعديل المصروف",
                                            actions: [
                                              ElevatedButton(
                                                  onPressed: () {
                                                    Get.back();
                                                    controller
                                                        .editTransAction();
                                                  },
                                                  child: const Text("نعم"),),
                                              ElevatedButton(
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  child: const Text("لا"),),
                                            ],);
                                      }
                                    },
                                    isActive: !controller.canAdd ? true : false,
                                  ),
                                  CustomButton(
                                    text: "حذف",
                                    ontap: () {
                                      if (!controller.canAdd) {
                                        Get.defaultDialog(
                                            title: "تحذير ",
                                            middleText:
                                                "هل أنت متأكد أنك تريد حذف المصروف",
                                            actions: [
                                              ElevatedButton(
                                                  onPressed: () {
                                                    Get.back();
                                                    controller
                                                        .deleteTransAction();
                                                  },
                                                  child: const Text("نعم")),
                                              ElevatedButton(
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  child: const Text("لا")),
                                            ]);
                                      }
                                    },
                                    isActive: !controller.canAdd ? true : false,
                                  ),
                                  CustomButton(
                                    text: "إلغاء",
                                    ontap: () {
                                      controller.clearModel();
                                    },
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
                      child: controller.firstState == StatusRequst.loading
                          ? const CustomLoadingIndecator()
                          : Container(
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
                              child: MangeCostForm(
                                many: controller.totalExpenses.toString(),
                              ),
                            ),
                    )
                  ],
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
