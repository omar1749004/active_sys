import 'package:active_system/controller/renew_controller.dart';
import 'package:active_system/core/class/statuscode.dart';
import 'package:active_system/core/constant/color.dart';
import 'package:active_system/core/services/services.dart';
import 'package:active_system/core/shared/ModernTable/custom_modern_table.dart';
import 'package:active_system/core/shared/custom_botton_copy.dart';
import 'package:active_system/core/shared/custom_app_bar.dart';
import 'package:active_system/core/shared/custom_date_field.dart';
import 'package:active_system/core/shared/custom_table_header.dart';
import 'package:active_system/core/shared/global_variable.dart';
import 'package:active_system/core/shared/loading_indecator.dart';
import 'package:active_system/core/shared/custom_button.dart';
import 'package:active_system/features/auth/view/screen/auth_view.dart';
import 'package:active_system/features/manage_subscriptions/view/widgets/custom_menu.dart';
import 'package:active_system/features/renew_subscriptions/widgets/renew_subscription_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RenewSybscriptionsView extends StatelessWidget {
  const RenewSybscriptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices services = Get.find();
    if (services.sharedPreferences.get("id") == "" &&
        services.sharedPreferences.get("name") == "") {
      return const AuthView();
    } else {
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
                                      widths: const [
                                        150,
                                        150,
                                        250,
                                        250,
                                        200,
                                        200,
                                        150,
                                        250,
                                      ],
                                      header: const [
                                        "رقم الاشتراك",
                                        "الكود",
                                        "الاشتراك",
                                        "الاسم",
                                        "تاريخ البدايه",
                                        "تاريخ النهاية",
                                        "عدد الجلسات",
                                        "ملاحظات",
                                      ],
                                      selectedIndex: controller.selectedIndex,
                                      nameOfGlobalID: 'renewSubscription',
                                      onRowTap: () {
                                        controller.assignModel(controller
                                                .renewList[
                                            GlobalVariable.renewSubscription!]);
                                        controller.selectRow(
                                            GlobalVariable.renewSubscription!);
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
                                  ontap: () {
                                    controller.addRenew();
                                  },
                                ),
                                CustomButton(
                                  text: "تعديل",
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
                                  isActive: !controller.canAdd ? true : false,
                                ),
                                CustomButton(
                                  text: "حذف",
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
                                  isActive: !controller.canAdd ? true : false,
                                ),
                                CustomButton(
                                  text: "إلغاء",
                                  ontap: () {
                                    if (!controller.canAdd) {
                                      controller.cleaModel();
                                    }
                                  },
                                  // isActive: controller.canAdd ? true : false,
                                ),
                                CustomButton(
                                  text: "تجميد",
                                  ontap: () {
                                    // if (!controller.canAdd) {
                                    //   controller.gotoFrezze(controller.renewUser);
                                    // }
                                    Get.offAllNamed(AppRoute.freezescreenid);
                                  },
                                  isActive: !controller.canAdd ? true : true,
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
}
