import 'package:active_system/controller/home_controller.dart';
import 'package:active_system/core/constant/color.dart';
import 'package:active_system/core/functions/validate_input.dart';
import 'package:active_system/core/shared/custom_botton_copy.dart';
import 'package:active_system/core/shared/custom_dropdown_menu.dart';
import 'package:active_system/core/shared/custome_textform_auth.dart';
import 'package:active_system/features/home/data/service/static/sup_type.dart';
import 'package:active_system/link_api.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrcode_barcode_scanner/qrcode_barcode_scanner.dart';

class ClinetInfo extends StatelessWidget {
  const ClinetInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 10, right: 20),
        child: SingleChildScrollView(
          child: GetBuilder<HomeControllerImp>(
            builder: (controller) => Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...List.generate(
                        4,
                        (index) => CustomBotton1(
                          marginLeft: 0,
                          marginRight: 0,
                          marginTop: 10,
                          marginBottom: 25,
                          hieght: 50,
                          ontap: () {
                            controller.selectSupType(index);
                          },
                          text: supType[index],
                          color: controller.supType == index
                              ? ColorApp.onfoucosColor
                              : ColorApp.kPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // IconButton(
                      //   onPressed: () {},
                      //   icon: Icon(
                      //     CupertinoIcons.antenna_radiowaves_left_right,
                      //     color: ColorApp.kPrimaryColor,
                      //     size: MediaQuery.of(context).size.width * 0.04,
                      //   ),
                      // ),

                      Container(
                        padding: const EdgeInsets.only(bottom: 30, left: 30),
                        child: CircleAvatar(
                            backgroundColor: ColorApp.gray,
                            radius: MediaQuery.of(context).size.width * 0.06,
                            child: ClipOval(
                              child: SizedBox.fromSize(
                                  size: Size.fromRadius(
                                      MediaQuery.of(context).size.width *
                                          0.06), // Image radius
                                  child: controller.imageName != null
                                      ? CachedNetworkImage(
                                          fit: BoxFit.fill,
                                          imageUrl:
                                              "$linkImageUpload/${controller.imageName}",
                                        )
                                      : const SizedBox()),
                            )),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(
                            left: 30,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              MaterialButton(
                                minWidth: 180,
                                color: ColorApp.secondColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16)),
                                onPressed: () {
                                  controller.rightSearch();
                                },
                                child: const Icon(
                                  Icons.search,
                                  color: Colors.white,
                                  size: 50,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              MaterialButton(
                                  minWidth: 180,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  color: ColorApp.secondColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16)),
                                  onPressed: () {
                                    controller.handleFunctionsAdd();
                                  },
                                  child: const Text(
                                    "حضور",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: 90,
                                child: CustomeTextFormAuth(
                                  fontSize: 30,
                                  hintText: "",
                                  lableText: "الكود",
                                  myController: controller.barcode,
                                  onChanged: (p0) {
                                    controller.handlebarcode();
                                  },
                                  onTapOnTextField: () {
                                    QrcodeBarcodeScanner(
                                      onScannedCallback: (String value) {
                                        if(controller.supType != 1 && int.tryParse(value) != null)
                                        {
                                          controller.barcode.text = value;
                                          controller.handleFunctionsAdd();
                                        }
                                      },
                                    );
                                   print("aaaaaaaa${controller.barcode.text}");
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  CustomeTextFormAuth(
                      hintText: "",
                      lableText: "الاسم",
                      myController: controller.username,
                      validator: (val) {
                        return validInput(val!, 2, 50, "");
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomeTextFormAuth(
                      hintText: "",
                      lableText: "الهاتف",
                      myController: controller.phone,
                      validator: (val) {
                        return validInput(val!, 5, 11, "num");
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomeTextFormAuth(
                    hintText: "",
                    lableText: "الاشتراك",
                    myController: controller.subscriptions,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomeTextFormAuth(
                    hintText: "",
                    lableText: "انتهاء",
                    myController: controller.deadline,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomeTextFormAuth(
                    hintText: "",
                    lableText: "العمر",
                    myController: controller.age,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomeTextFormAuth(
                    hintText: "",
                    lableText: "ملاحظات",
                    myController: controller.note,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomDropDownMenu(
                    redius: 30,
                    items: controller.subNameList,
                    label: "اشتراك",
                    intialValue: controller.subValue,
                    onChanged: (val) {
                      controller.changemodel(val!);
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
