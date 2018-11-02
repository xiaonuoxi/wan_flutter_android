import 'package:flutter/material.dart';
import 'package:wan_android_flutter/pages/main/IndexedStackMain.dart';
import 'package:wan_android_flutter/pages/main/TabBarViewMain.dart';

// 一个左右滑动的ViewPage样式
// 一个点击ItemBar切换显示样式

class MainApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => MainAppState();
}

class MainAppState extends State<MainApp>{
  // 这里使用Scaffold
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) => Scaffold(
    key: _scaffoldState,
    appBar: AppBar(
      title: Text(
        '请选择一种主页风格',
          style: TextStyle(color: Colors.white),
      ),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    body: Center(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: (){
              // 跳转 这里一定要跟Widget是Scaffold 才能使用这个context，
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => IndexedStackMain()
                  ));
            },
            child: Container(
              width: 200.0,
              height: 200.0,
              child: Card(
                color: Colors.green,
                child: Center(
                  child: Text(
                    '进入不可以左右滑动的主页',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TabBarViewMain())
              );
            },
            child: Container(
              width: 200.0,
              height: 200.0,
              child: Card(
                color: Colors.green,
                child: Center(
                  child: Text(
                    '进入可以左右滑动主页',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}