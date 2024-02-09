import 'package:active_system/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoadingIndecator extends StatelessWidget {
  const LoadingIndecator({super.key, required this.widget});
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget,
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color.fromARGB(50, 0, 0, 0),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 60,
                height: 60,
                child: LoadingIndicator(
                  colors: [
                    ColorApp.kPrimaryColor,
                    ColorApp.secondColor,
                    ColorApp.thirdColor
                  ],
                  indicatorType: Indicator.lineSpinFadeLoader,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}