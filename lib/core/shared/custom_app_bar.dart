import 'package:active_system/core/constant/color.dart';
import 'package:active_system/core/constant/image_asset.dart';
import 'package:active_system/core/constant/styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorApp.kPrimaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            ImageAsset.logo,
            width: 100,
          ),
          Text(
            "Welcome To Your Home",
            style: Styles.style20.copyWith(color: Colors.white),
          ),
          //here will add another element in the future
        const  Text("data")
        ],
      ),
    );
  }
}
