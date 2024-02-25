import 'package:active_system/core/constant/color.dart';
import 'package:active_system/data/models/user_model.dart';
import 'package:active_system/features/safe/view/widget/custom_display_many.dart';
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
                  radius: 300,
                  child: ClipOval(
                      child: SizedBox.fromSize(
                          size: Size.fromRadius(300), // Image radius
                          child: Image.asset(
                              "assets/image/animals.jpg") //controller.imageName != null
                          // ? CachedNetworkImage(
                          //     fit: BoxFit.fill,
                          //     imageUrl:
                          //         "$linkImageUpload/${controller.imageName}",
                          // )
                          //: const SizedBox()),
                          )),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 500,
                child: CustomDisplyMany(
                    textColor: ColorApp.thirdColor,
                    many: userModel.usersName ?? "",
                    text: "ألاسم",
                    flexOfMany: 2),
              ),
              SizedBox(
                width: 500,
                child: CustomDisplyMany(
                  textColor: ColorApp.thirdColor,
                  many: userModel.usersGender == null
                      ? ""
                      : userModel.usersGender.toString(),
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
                  many: userModel.usersAddress ?? "",
                  text: "العنوان",
                  flexOfMany: 2,
                ),
              ),
              // SizedBox(
              //   width: 500,
              //   child: CustomDisplyMany(
              //     textColor: ColorApp.thirdColor,
              //     many: userModel.usersBranch.toString(),
              //     text: "الفرع",
              //     flexOfMany: 2,
              //   ),
              // ),
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
