import 'package:active_system/core/constant/app_theme.dart';
import 'package:active_system/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LocalController extends GetxController
{
  Locale? language;
  ThemeData apptheme = themeEnglish;
  MyServices myServices =Get.find();

  changeLang(String languageCode)
  {
    Locale locale =Locale(languageCode);
    myServices.sharedPreferences.setString("lang", languageCode);
    apptheme =languageCode =="ar"? themeArabic:themeEnglish;
    Get.changeTheme(apptheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    
    String? sharedPrefLang =myServices.sharedPreferences.getString("lang");
    if(sharedPrefLang == "ar")
    {
      language =const Locale("en");
      apptheme =themeArabic;
    }
    else if(sharedPrefLang == "en")
    {
      language =const Locale("en");
      apptheme =themeEnglish;
    }else 
    {
      language =const Locale("en");
    }
    super.onInit();
  }
}