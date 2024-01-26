import 'package:active_system/core/constant/color.dart';
import 'package:active_system/safe/view/widget/custom_display_many.dart';
import 'package:flutter/material.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.only(top: 20, bottom: 30, left: 30),
                child: CircleAvatar(
                  backgroundColor: ColorApp.gray,
                  radius: MediaQuery.of(context).size.width * 0.06,
                ),
              ),
            ),
            const CustomDisplyMany(
                textColor: ColorApp.thirdColor, many: 100, text: "رقم العضوية"),
            const CustomDisplyMany(
                textColor: ColorApp.thirdColor, many: 100, text: "الكود"),
            const CustomDisplyMany(
                textColor: ColorApp.thirdColor, many: 100, text: "الاسم"),
            const CustomDisplyMany(
                textColor: ColorApp.thirdColor, many: 100, text: "العمر"),
            const CustomDisplyMany(
                textColor: ColorApp.thirdColor, many: 100, text: "النوع"),
            const CustomDisplyMany(
                textColor: ColorApp.thirdColor,
                many: 100,
                text: "تاريخ الميلاد"),
            const CustomDisplyMany(
                textColor: ColorApp.thirdColor,
                many: 100,
                text: "تاريخ الانضمام"),
            const CustomDisplyMany(
                textColor: ColorApp.thirdColor, many: 100, text: "البائع"),
            const CustomDisplyMany(
                textColor: ColorApp.thirdColor, many: 100, text: "المدرب"),
            const CustomDisplyMany(
                textColor: ColorApp.thirdColor, many: 100, text: "موبايل"),
            const CustomDisplyMany(
                textColor: ColorApp.thirdColor, many: 100, text: "حساب"),
            const CustomDisplyMany(
                textColor: ColorApp.thirdColor, many: 100, text: "ملاحظات"),
          ],
        ),
      ),
    );
  }
}
