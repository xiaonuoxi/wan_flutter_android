import 'package:flutter/material.dart';
import 'package:wan_android_flutter/pages/HomePage.dart';
import 'package:wan_android_flutter/pages/HotPage.dart';
import 'package:wan_android_flutter/pages/KnowledgePage.dart';


// 这是一个点击tabItem进行切换显示的风格的主页

class IndexedStackMain extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => IndexedStackMainState();

}

class IndexedStackMainState  extends State<IndexedStackMain>{

  // 底部导航栏的文字，给appBar 共用一下
  var _bottomTitles = ['首页','知识体系','热门'];

  // 导航栏未选中的图片
  var _bootomIconNor = [
    'images/icon_bottom_main_nor.png',
    'images/icon_bottom_knowledge_nor.png',
    'images/icon_bottom_hot_nor.png'
  ];

  // 底部导航栏选中时的图片
  var _bottomIconChecked = [
    'images/icon_bottom_main_checked.png',
    'images/icon_bottom_knowledge_checked.png',
    'images/icon_bottom_hot_checked.png'
  ];

  // 底部导航栏当前选中的页面
  var _currentBottomIndex = 0;

  // 页面
  var _body;

  @override
  Widget build(BuildContext context) {

    _body = IndexedStack(
      children: <Widget>[HomePage(),KnowledgePage(),HotPage()],
      index: _currentBottomIndex,
    );

    return Scaffold(
      // 顶部标题
      appBar: AppBar(
        title: Text(
            _bottomTitles[_currentBottomIndex],
            style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              // 打开搜索页面
            },
          )
        ],
        iconTheme: IconThemeData(color: Colors.white),),
        // 底部导航栏 CupertionTabBar 是ios风格的，BottomNavigationBar是Android风格的
        bottomNavigationBar: BottomNavigationBar(
            items: getBottomNavigationBarItems(),
            currentIndex: _currentBottomIndex,
            onTap: (index){
              setState(() {
                _currentBottomIndex = index;
              });

            },
        ),
      // body 放pages，主要是用来切换这几个页面
      body: _body,
    );
  }
  getBottomNavigationBarItems() => List.generate(
      _bottomTitles.length,
      (index) => BottomNavigationBarItem(
        icon: getBottomIcon(index),
        title: getBottomTitle(index)));

  getBottomTitle(int i) => Text(
    _bottomTitles[i],
    style: TextStyle(
      color: _currentBottomIndex == i ? Colors.green : Colors.grey),
  );

  getBottomIcon(int i) => Image.asset(
    getBottomIconPath(i),
    width: 25.0,
    height: 25.0,
  );

  String getBottomIconPath(int i) =>
      _currentBottomIndex == i ? _bottomIconChecked[i] : _bootomIconNor[i];
}