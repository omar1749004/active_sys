import 'package:active_system/core/constant/image_asset.dart';
import 'package:active_system/core/constant/styles.dart';
import 'package:active_system/core/shared/customSearch.dart';
import 'package:active_system/core/shared/custom_table.dart';
import 'package:active_system/home/controller/home_controller.dart';
import 'package:active_system/home/data/service/static/header_table.dart';
import 'package:active_system/home/view/widget/client_info.dart';
import 'package:active_system/home/view/widget/custombottom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
TextEditingController search  =TextEditingController();
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController()) ;
    return Scaffold(
      body: Container(
        padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: GetBuilder<HomeController>(
          builder:(controller)=> Column(
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
                    CustomBottom(),
                  ],
                ),
              ),
              Divider(
               
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height *0.7,
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                          child: Text("data"),
                        )),
                        VerticalDivider(),
                    Expanded(
                        flex: 2,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 2),
                          
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                   Container(
                                     width: MediaQuery.of(context).size.width *0.25,
                                     height: 50,
                                     padding: EdgeInsets.only(bottom: 10),
                                    child: CustomSearch(searchController: search,titlAppbar: "بحث",
                                    onChanged: (val){},onPressedSearch: (){}, ),),
                                  Text(
                                    "سجل الحضور اليومي", style: Styles.style23,
                                  ),
                                 
                                ],
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *0.64,
                                  
                                  child: CustomTable(columnsHeader: headerTable, rowInfo: []),),
                            ],
                          ),
                        )),
                        VerticalDivider(),
                    ClinetInfo(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
