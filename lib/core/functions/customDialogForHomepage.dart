import 'package:active_system/core/constant/color.dart';
import 'package:active_system/data/models/attend_model.dart';
import 'package:active_system/features/safe/view/widget/custom_display_many.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> customHomePageDialog(AttendModel attendModel) {
  return Get.defaultDialog(
      title: "ملف الشخصى للاعب",
      content: Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                  backgroundImage: AssetImage("assets/image/animals.jpg"),
                  backgroundColor: ColorApp.gray,
                  radius: 80),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 500,
                child: CustomDisplyMany(
                    textColor: ColorApp.thirdColor,
                    many: attendModel.usersName ?? "",
                    text: "الاسم",
                    flexOfMany: 2),
              ),
              SizedBox(
                width: 500,
                child: CustomDisplyMany(
                  textColor: ColorApp.thirdColor,
                  many: attendModel.usersPhone ?? "",
                  text: "التلفون",
                  flexOfMany: 2,
                ),
              ),
              SizedBox(
                width: 500,
                child: CustomDisplyMany(
                  textColor: ColorApp.thirdColor,
                  many: attendModel.subscriptionsName ?? "",
                  text: "أسم الاشتراك",
                  flexOfMany: 2,
                ),
              ),
              SizedBox(
                width: 500,
                child: CustomDisplyMany(
                  textColor: ColorApp.thirdColor,
                  many: attendModel.subscriptionsSessionsNumber == null
                      ? ""
                      : "${attendModel.subscriptionsSessionsNumber}/${attendModel.renewalSessionAttend}",
                  text: "رقم الجلسه",
                  flexOfMany: 2,
                ),
              ),
              SizedBox(
                width: 500,
                child: CustomDisplyMany(
                  textColor: ColorApp.thirdColor,
                  many: attendModel.renewalEnd == null
                      ? ""
                      : attendModel.renewalEnd.toString().substring(0, 11),
                  text: "تاريخ انتهاء الاشتراك",
                  flexOfMany: 2,
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 124, 244, 244));
}
