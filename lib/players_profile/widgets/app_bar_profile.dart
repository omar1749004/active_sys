import 'package:active_system/core/constant/color.dart';
import 'package:active_system/core/constant/image_asset.dart';
import 'package:active_system/core/shared/custom_Botton1.dart';
import 'package:flutter/material.dart';

typedef void IntCallback(int id);

class AppBarProfilePage extends StatelessWidget {
  AppBarProfilePage({super.key, required this.buttonId});

  final IntCallback buttonId;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(18),
                  bottomRight: Radius.circular(18)),
              color: ColorApp.kPrimaryColor,
            ),
            height: 100,
            width: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(EdgeInsets.all(0))),
                  onPressed: () {},
                  child: const Icon(
                    Icons.close,
                    size: 30,
                  ),
                ),
                Image.asset(
                  ImageAsset.logo,
                  width: 100,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomBotton1(
                    hieght: 40,
                    marginBottom: 20,
                    marginTop: 20,
                    ontap: () {
                      buttonId(1);
                    },
                    text: "سجل التعديلات",
                    color: ColorApp.kPrimaryColor),
                CustomBotton1(
                    hieght: 40,
                    marginBottom: 20,
                    marginTop: 20,
                    ontap: () {
                      buttonId(2);
                    },
                    text: "التجميد",
                    color: ColorApp.kPrimaryColor),
                CustomBotton1(
                    hieght: 40,
                    marginBottom: 20,
                    marginTop: 20,
                    ontap: () {
                      buttonId(3);
                    },
                    text: "حضور وانصراف",
                    color: ColorApp.kPrimaryColor),
                CustomBotton1(
                    hieght: 40,
                    marginBottom: 20,
                    marginTop: 20,
                    ontap: () {
                      buttonId(4);
                    },
                    text: "بحث خزنة",
                    color: ColorApp.kPrimaryColor),
                CustomBotton1(
                    hieght: 40,
                    marginBottom: 20,
                    marginTop: 20,
                    ontap: () {
                      buttonId(5);
                    },
                    text: "تجديدات ومدفوعات",
                    color: ColorApp.kPrimaryColor)
              ],
            ),
          )
        ],
      ),
    );
  }
}
