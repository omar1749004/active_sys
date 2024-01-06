import 'package:active_system/core/constant/color.dart';
import 'package:active_system/core/constant/image_asset.dart';
import 'package:active_system/core/constant/styles.dart';
import 'package:active_system/core/shared/custom_Botton1.dart';
import 'package:active_system/core/shared/custom_dropdown_menu.dart';
import 'package:active_system/core/shared/custom_table.dart';
import 'package:active_system/core/shared/custom_table_header.dart';
import 'package:active_system/home/controller/home_controller.dart';
import 'package:active_system/home/data/service/static/header_table.dart';
import 'package:active_system/home/data/service/static/note_knoladge.dart';
import 'package:active_system/home/data/service/static/sup_type.dart';
import 'package:active_system/home/view/widget/client_info.dart';
import 'package:active_system/manage_subscriptions/view/widgets/custom_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      body:  GetBuilder<HomeController>(
          builder: (controller) => Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.09,
                child: Row(
                  children: [
                    Image.asset(ImageAsset.logo),
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
                    ...List.generate(4, (index) => CustomBotton1(ontap: (){
                      controller.selectSupType(index) ;
                    }, text: supType[index] , 
                    color: controller.supType == index ?ColorApp.onfoucosColor: ColorApp.kPrimaryColor,
                    
                    ),
                    
                    ),
                   
                  ],
                ),
              ),
              const Divider(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: Row(
                  children: [
                    const CustomMenu(pageName: "الصفحة الرئيسية",),
                    const VerticalDivider(),
                    Expanded(
                        flex: 2,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                             CustomTableHeader(searchController: controller.search, header: "سجل الحضور اليومي"),
                              Expanded(
                                child: CustomTable(
                                    columnsHeader: headerTable, rowInfo: []),
                              ),
                            ],
                          ),
                        )),
                    const VerticalDivider(),
                    const Expanded(flex: 1, child: ClinetInfo()),
                  ],
                ),
              ),
              const Divider(),
              Expanded(
                child: Row(
                 crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...List.generate(
                      3,
                      (index) => Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 10, left: 10),
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
                    const Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.27,
                      padding: const EdgeInsets.only(right: 20),
                      child: CustomDropDownMenu(
                        items: items,
                        intialValue: selectedItem,
                        onChanged: (val) {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

    );
  }
}
