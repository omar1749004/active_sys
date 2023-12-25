import 'package:active_system/core/constant/menu_items.dart';
import 'package:active_system/subscriptions/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomMenu extends StatelessWidget {
  const CustomMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: serviceName.length,
        itemBuilder: (context, index) {
          return CustomButton(
              text: serviceName[index],
              ontap: () {
                Get.toNamed(serviceId[index]);
              });
        },
      ),
    );
  }
}
