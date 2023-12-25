import 'package:active_system/core/constant/color.dart';
import 'package:active_system/core/constant/styles.dart';
import 'package:active_system/home/controller/home_controller.dart';
import 'package:active_system/home/data/service/static/sup_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottoms extends GetView<HomeController> {
  const CustomBottoms({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(

                    width: MediaQuery.of(context).size.width * 0.206,
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>const  SizedBox(
                        width: 10,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: supType.length,
                      itemBuilder: (context, index) => Container(
                        margin:const EdgeInsets.symmetric(vertical: 10),
                        child: MaterialButton(
                          color: controller.supType == index ? ColorApp.onfoucosColor:ColorApp.kPrimaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          onPressed:(){
                            controller.selectSupType(index);
                           
                          } ,
                           child: Text(
                            supType[index],
                            style: Styles.style18,
                          ),
                        ),
                      ),
                    ),
                  );

  }
}
