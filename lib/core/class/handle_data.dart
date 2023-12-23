// import 'package:active_system/core/class/statuscode.dart';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

// import '../constant/image_asset.dart';

// class HandlingDataView extends StatelessWidget {

//   const HandlingDataView({super.key, required this.statusRequs, required this.widget});
//  final StatusRequst statusRequs;
//  final Widget widget;
//   @override
//   Widget build(BuildContext context) {
//     return statusRequs ==StatusRequst.loading? 
//           Column(children:[
//             SizedBox(height: 120,),
//              LottieBuilder.asset(ImageAsset.loading, )])
//         :
//         statusRequs ==StatusRequst.offlineFailure? 
//          Center(child: LottieBuilder.asset(ImageAsset.offline, repeat: false),)
//          :
//          statusRequs ==StatusRequst.failure? 
//          Center(child: LottieBuilder.asset(ImageAsset.nodata , repeat: false,),)
//          :widget;
//   }
// }
// class HandlingDataReques extends StatelessWidget {

//   const HandlingDataReques({super.key, required this.statusRequs, required this.widget});
//  final StatusRequst statusRequs;
//  final Widget widget;
//   @override
//   Widget build(BuildContext context) {
//     return statusRequs ==StatusRequst.loading? 
//          Center(child: LottieBuilder.asset(ImageAsset.loading, repeat: false),)
//         :
//         statusRequs ==StatusRequst.offlineFailure?//  edit 
//          Center(child: LottieBuilder.asset(ImageAsset.offline, repeat: false),)
//          :widget;
//   }
// }