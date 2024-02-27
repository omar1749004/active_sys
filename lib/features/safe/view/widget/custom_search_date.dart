
import 'package:active_system/controller/safe_controller.dart';
import 'package:active_system/core/constant/styles.dart';
import 'package:active_system/core/shared/custom_botton_copy.dart';
import 'package:active_system/core/shared/custom_date_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearchDate extends GetView<SafeControllerImp> {
  const CustomSearchDate({super.key,required this.color, this.ontap,});
final Color color ;
final void Function()? ontap ;
  @override
  Widget build(BuildContext context) {
    return Row(

      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomDateField(
            width: 150,
            height: 30,
            onChanged: (p0) {
              controller.endSearch =p0! ;
              controller.dateSearch(controller.startSearch, controller.endSearch);
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
              controller.startSearch =p0! ;
              controller.dateSearch(controller.startSearch, controller.endSearch);
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
            ontap: ontap,
            color: color,  
            marginBottom: 0,
            marginLeft: 0,
            marginRight: 0,
            marginTop: 0,
          ),
        ),
        Text(
          "سجل الخزنة",
          style: Styles.style23,
        ),
      ],
    );

  }
}
