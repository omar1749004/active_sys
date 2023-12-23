// import 'package:active_system/controller/orders/pending_controller.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:get/get.dart';
// import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

// requestPrimationNotification() async{
//   // NotificationSettings settings = 
//   await FirebaseMessaging.instance.requestPermission(
//   alert: true,
//   announcement: false,
//   badge: true,
//   carPlay: false,
//   criticalAlert: false,
//   provisional: false,
//   sound: true,
// );
// }

// fcmconfig(){
//   FirebaseMessaging.onMessage.listen((message) {
//     FlutterRingtonePlayer.playNotification();
//     Get.snackbar(message.notification!.title!, message.notification!.body!);
//     refreshNotification(message.data);
//   });
// }
// refreshNotification(data){
//   if(Get.currentRoute == "/ordersPending" && data["pagename"] =="refreshOrderPending")
//   {
//     PendingOrdersControllerImp controller = Get.find();
//     controller.refreshOrder();
//   }
// }