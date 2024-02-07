import 'package:active_system/controller/home_controller.dart';
import 'package:active_system/core/constant/styles.dart';
import 'package:active_system/features/home/data/service/static/sup_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottoms extends GetView<HomeControllerImp> {
  const CustomBottoms({required this.color, super.key});
 final Color color ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.206,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: supType.length,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: MaterialButton(
            color: color,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            onPressed: () {
              controller.selectSupType(index);
            },
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
