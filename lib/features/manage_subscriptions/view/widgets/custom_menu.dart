import 'package:active_system/core/constant/menu_items.dart';
import 'package:active_system/features/manage_subscriptions/view/widgets/custom_menu_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomMenu extends StatelessWidget {
  const CustomMenu({super.key, required this.pageName});

  final String pageName;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Align(
        alignment: Alignment.topCenter,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: servicePowerName.length,
          itemBuilder: (context, index) {
            return SizedBox(
              height: 60,
              child: CustomMenuButton(
                backgroundColor: servicePowerName[index] == pageName
                    ? const Color.fromARGB(137, 255, 255, 255)
                    : Colors.white,
                text: servicePowerName[index],
                ontap: () {
                  if (servicePowerName[index] != pageName) {
                    Get.offAllNamed(servicePowerRoutes[index]);
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
