import 'package:active_system/controller/renew_controller.dart';
import 'package:active_system/core/class/statuscode.dart';
import 'package:active_system/core/constant/color.dart';
import 'package:active_system/core/shared/ModernTable/custom_modern_table.dart';
import 'package:active_system/core/shared/custom_Botton1.dart';
import 'package:active_system/core/shared/custom_app_bar.dart';
import 'package:active_system/core/shared/custom_date_field.dart';
import 'package:active_system/core/shared/custom_table_header.dart';
import 'package:active_system/core/shared/global_variable.dart';
import 'package:active_system/core/shared/loading_indecator.dart';
import 'package:active_system/features/manage_subscriptions/view/widgets/custom_button.dart';
import 'package:active_system/features/manage_subscriptions/view/widgets/custom_menu.dart';
import 'package:active_system/features/renew_subscriptions/widgets/renew_subscription_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RenewSybscriptionsView extends StatelessWidget {
  const RenewSybscriptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RenewControllerImp());
    return Scaffold(
      body: GetBuilder<RenewControllerImp>(builder: (controller) {
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
                    pageName: 'تجديد الاشتراكات',
                  ),
                  //the content in the middle
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
                                searchController: controller.searchVal,
                                onChanged: (val) {
                                  controller.checkSearch(val);
                                },
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
                                    onChanged: (p0) {
                                      controller.endSearch = p0!;
                                      controller.dateSearch(
                                          controller.startSearch,
                                          controller.endSearch);
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
                                      controller.dateSearch(
                                          controller.startSearch,
                                          controller.endSearch);
                                    },
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
                                    ontap: () {
                                      controller.isdateSearch =
                                          !controller.isdateSearch;
                                      controller
                                          .handlTable(controller.isdateSearch);
                                      // if(controller.isdateSearch){
                                      //  controller.dateSearch(controller.startSearch, controller.endSearch);
                                      // }else{
                                      //   controller.viewAll();
                                      // }
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
                            child:
                            controller.statusRequs == StatusRequst.loading ? const CustomLoadingIndecator():
                             Container(
                              color:const Color.fromARGB(255, 218, 218, 218),
                              child: CustomModernTable(
                                data: controller.dataInTable,
                                widths: const [100, 250, 150, 250, 100, 250],
                                header: const [
                                  "رقم الاشتراك",
                                  "التاريخ",
                                  "كود الاعب",
                                  "الاسم",
                                  "رقم تسلسل اللاعب",
                                  "تاريخ التجديد"
                                ],
                                nameOfGlobalID: 'renewSubscription',
                                onRowTap: () {
                                  controller.assignModel(controller.renewList[GlobalVariable.renewSubscription!]);
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                
                                                                CustomButton(
                                  text: "أضافه",
                                  color: controller.canAdd
                                      ? const Color.fromARGB(217, 255, 255, 255)
                                      : const Color.fromARGB(
                                          217, 202, 193, 193),
                                  ontap: () {
                                    if (controller.canAdd) {
                                      controller.addRenew();
                                    }
                                  },
                                ),
                                CustomButton(
                                  text: "تعديل",
                                  color: !controller.canAdd
                                      ? const Color.fromARGB(217, 255, 255, 255)
                                      : const Color.fromARGB(
                                          217, 202, 193, 193),
                                  ontap: () {
                                    if (!controller.canAdd) {
                                      Get.defaultDialog(
                                          title: "تحذير ",
                                          middleText:
                                              "هل أنت متأكد أنك تريد تعديل الاشتراك",
                                          actions: [
                                            ElevatedButton(
                                                onPressed: () {
                                                  Get.back();
                                                  controller.editPRenew();

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
                                ),
                                CustomButton(
                                  text: "حذف",
                                  color: !controller.canAdd
                                      ? const Color.fromARGB(217, 255, 255, 255)
                                      : const Color.fromARGB(
                                          217, 202, 193, 193),
                                  ontap: () {
                                      if (!controller.canAdd) {
                                      Get.defaultDialog(
                                          title: "تحذير ",
                                          middleText:
                                              "هل أنت متأكد أنك تريد حذف الاشتراك",
                                          actions: [
                                            ElevatedButton(
                                                onPressed: () {
                                                  Get.back();
                                                  controller.deleteRenew();
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
                                ),
                                CustomButton(
                                  text: "إلغاء",
                                  ontap: () {
                                    if(!controller.canAdd){
                                       controller.cleaModel();
                                    }
                                  },
                                ),
                                CustomButton(
                                  text: "تجميد",
                                  color: !controller.canAdd
                                      ? const Color.fromARGB(217, 255, 255, 255)
                                      : const Color.fromARGB(
                                          217, 202, 193, 193),
                                  ontap: () {
                                    if(!controller.canAdd){
                                      controller.gotoFrezze(controller.renewUser);
                                    }
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
                      child: const RenewSubscriptionForm(),
                    ),
                  ),
                ],
              ),
            ),
          ]);
        // }
      }),
    );
  }
}
