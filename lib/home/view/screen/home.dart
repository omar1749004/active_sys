import 'package:active_system/core/constant/image_asset.dart';
import 'package:active_system/core/constant/styles.dart';
import 'package:active_system/core/shared/customSearch.dart';
import 'package:active_system/core/shared/custom_table.dart';
import 'package:active_system/home/controller/home_controller.dart';
import 'package:active_system/home/data/service/static/header_table.dart';
import 'package:active_system/home/view/widget/client_info.dart';
import 'package:active_system/home/view/widget/custombottom.dart';
import 'package:active_system/subscriptions/view/widgets/custom_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      body: Container(
       
        padding: const EdgeInsets.symmetric( vertical: 40 ,horizontal: 20),
        child: GetBuilder<HomeController>(
          builder: (controller) => Column(
            children: [
              SizedBox(
                height: 70,
                child: Row(
                  children: [
                    Image.asset(ImageAsset.lohgo),
                    const Spacer(
                      flex: 2,
                    ),
                    Text(
                      "Welcome To Your Home",
                      style: Styles.style20,
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    CustomBottoms(),
                  ],
                ),
              ),
             const Divider(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: Row(
                  children: [
                    Container(
                      child: CustomMenu(),
                    ),
                    VerticalDivider(),
                    Expanded(
                        flex: 2,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.39,
                                    height: 50,
                                    padding: EdgeInsets.only(bottom: 10 ,left: 20),
                                    child: CustomSearch(
                                      searchController: controller.search,
                                      titlAppbar: "بحث",
                                      onChanged: (val) {},
                                      onPressedSearch: () {},
                                    ),
                                  ),
                                  Text(
                                    "سجل الحضور اليومي",
                                    style: Styles.style23,
                                    
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.64,
                                child: CustomTable(
                                    columnsHeader: headerTable, rowInfo: []),
                              ),
                            ],
                          ),
                        )),
                    VerticalDivider(),
                    Expanded(
                      flex: 1,
                      child: ClinetInfo()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
