import 'package:active_system/core/class/handle_data_in_table.dart';
import 'package:active_system/core/constant/color.dart';
import 'package:active_system/data/models/user_model.dart';
import 'package:active_system/features/safe/view/widget/custom_display_many.dart';
import 'package:active_system/link_api.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> customManagePlayerDialog(UserModel userModel) {
  return Get.defaultDialog(
      title: "ملف الشخصى للاعب",
      content: Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 30, left: 30),
                child: CircleAvatar(
                    backgroundColor: ColorApp.gray,
                    radius: 100,
                    child: ClipOval(
                      child: SizedBox.fromSize(
                          size: const Size.fromRadius(100), // Image radius
                          child: userModel.usersImage != null
                              ? CachedNetworkImage(
                                  fit: BoxFit.fill,
                                  imageUrl:
                                      "$linkImageUpload/${userModel.usersImage}",
                                )
                              : const SizedBox()),
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 500,
                child: CustomDisplyMany(
                    textColor: ColorApp.thirdColor,
                    many: userModel.usersName ?? "",
                    text: "الاسم",
                    flexOfMany: 2),
              ),
              SizedBox(
                width: 500,
                child: CustomDisplyMany(
                  textColor: ColorApp.thirdColor,
                  many: userModel.usersGender == null
                      ? ""
                      : handleDataInTable().handleGenderData(userModel.usersGender),
                  text: "الجنس",
                  flexOfMany: 2,
                ),
              ),
              SizedBox(
                width: 500,
                child: CustomDisplyMany(
                  textColor: ColorApp.thirdColor,
                  many: userModel.usersPhone ?? "",
                  text: "تلفون",
                  flexOfMany: 2,
                ),
              ),
              // SizedBox(
              //   width: 500,
              //   child: CustomDisplyMany(
              //     textColor: ColorApp.thirdColor,
              //     many: userModel.usersEmail,
              //     text: "البريد الاكترونى",
              //     flexOfMany: 2,
              //   ),
              // ),
              SizedBox(
                width: 500,
                child: CustomDisplyMany(
                  textColor: ColorApp.thirdColor,
                  many: userModel.subscriptionsName ?? "",
                  text: "الاشتراك",
                  flexOfMany: 2,
                ),
              ),
              SizedBox(
                width: 500,
                child: CustomDisplyMany(
                  textColor: ColorApp.thirdColor,
                  many: userModel.renewalEnd == null
                      ? ""
                      : userModel.renewalEnd.toString(),
                  text: "تاريخ الانتهاء",
                  flexOfMany: 2,
                ),
              ),
              SizedBox(
                width: 500,
                child: CustomDisplyMany(
                  textColor: ColorApp.thirdColor,
                  many: userModel.usersCreate == null
                      ? ""
                      : userModel.usersCreate.toString().substring(0, 11),
                  text: "تاريخ الانشاء",
                  flexOfMany: 2,
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 124, 244, 244));
}
