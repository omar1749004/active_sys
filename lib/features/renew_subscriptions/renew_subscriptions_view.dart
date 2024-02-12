import 'package:active_system/controller/renew_controller.dart';
import 'package:active_system/core/class/statuscode.dart';
import 'package:active_system/core/constant/color.dart';
import 'package:active_system/core/shared/ModernTable/custom_modern_table.dart';
import 'package:active_system/core/shared/custom_Botton1.dart';
import 'package:active_system/core/shared/custom_app_bar.dart';
import 'package:active_system/core/shared/custom_date_field.dart';
import 'package:active_system/core/shared/custom_table_header.dart';
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
        if (controller.statusRequs == StatusRequst.loading) {
          return const CustomLoadingIndecator();
        } else {
          return Column(children: [
            const CustomAppBar(),
            Expanded(
                child: Row(children: [
              //left menu
              const CustomMenu(
                pageName: 'تجديد الاشتراكات',
              ),
              //the content in the middle
              Expanded(
                flex: 2,
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
                                  controller.dateSearch(controller.startSearch,
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
                                  controller.dateSearch(controller.startSearch,
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
                        child: Container(
                          color: Color.fromARGB(255, 218, 218, 218),
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomButton(
                              text: "تجميد",
                              ontap: () {
                                controller.gotoFrezze(controller.renewUser);
                              },
                            ),
                            CustomButton(
                              text: "طباعة",
                              ontap: () {},
                            ),
                            CustomButton(
                              text: "حذف",
                              ontap: () {},
                            ),
                            CustomButton(
                              text: "تعديل",
                              ontap: () {},
                            ),
                            CustomButton(
                              text: "تجديد",
                              ontap: () {
                                controller.addRenew();
                              },
                            )
                          ],
                        ),
                      ),
                      //
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
                          child: const RenewSubscriptionForm(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],),),
          ]);
        }
      }),
    );
  }
}
