import 'package:flutter/material.dart';
import 'package:wan_android_flutter/pages/main/MainApp.dart';


void main(){
  // 主题设置
  runApp(MaterialApp(
    // 主题设置
    theme: ThemeData(primaryColor: Colors.green),
    home: MainApp(),
  ));
}
