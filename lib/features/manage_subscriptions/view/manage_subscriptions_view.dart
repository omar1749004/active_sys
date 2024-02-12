import 'package:active_system/controller/sub_controller.dart';
import 'package:active_system/core/class/statuscode.dart';
import 'package:active_system/core/shared/ModernTable/custom_modern_table.dart';
import 'package:active_system/core/shared/custom_app_bar.dart';
import 'package:active_system/core/shared/custom_table_header.dart';
import 'package:active_system/core/shared/loading_indecator.dart';
import 'package:active_system/features/manage_subscriptions/view/widgets/custom_button.dart';
import 'package:active_system/features/manage_subscriptions/view/widgets/custom_input_form.dart';
import 'package:active_system/features/manage_subscriptions/view/widgets/custom_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageSubscriptionsView extends StatelessWidget {
 const ManageSubscriptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MangeSubControllerImp());

    return Scaffold(
      body: GetBuilder<MangeSubControllerImp>(builder: (controller) {
        if (controller.statusRequs == StatusRequst.loading) {
          return const CustomLoadingIndecator();
        } else {
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
                      pageName: 'ادارة الاشتراكات',
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
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: CustomTableHeader(
                                searchController: controller.search,
                                header: "",
                              ),
                            ),
                            //
                            //table that contains data
                            //
                            Expanded(
                              flex: 6,
                              child: Container(
                                color: Color.fromARGB(255, 218, 218, 218),
                                child: CustomModernTable(
                                  data: controller.dataInTable,
                                  widths: const [100, 250, 150, 250, 100],
                                  header: const [
                                    "رقم التسلسل",
                                    "اسم الاشتراك",
                                    "قيمة الاشتراك",
                                    "نوع الاشتراك",
                                    "عدد الايام",
                                  ],
                                  nameOfGlobalID: 'manageSubscription',
                                  onRowTap: () {},
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
                                      controller.addSub();
                                    },
                                  ),
                                  CustomButton(
                                    text: "تعديل",
                                    ontap: () {},
                                  ),
                                  CustomButton(
                                    text: "حذف",
                                    ontap: () {},
                                  ),
                                  CustomButton(
                                    text: "طباعة",
                                    ontap: () {},
                                  ),
                                ],
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
                        child: const SubscriptionForm(),
                      ),
                    )
                  ],
                ),
              )),
            ],
          );
        }
      }),
    );
  }
}
