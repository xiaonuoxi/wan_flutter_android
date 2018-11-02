import 'package:flutter/material.dart';
import 'package:wan_android_flutter/pages/HomePage.dart';
import 'package:wan_android_flutter/pages/HotPage.dart';
import 'package:wan_android_flutter/pages/KnowledgePage.dart';

// 这是一个点击Tabitem进行切换显示的风格主页
class TabBarViewMain extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => TabBarViewMainState();
  
}

class TabBarViewMainState extends State<TabBarViewMain>
  with SingleTickerProviderStateMixin{

  // 底部导航的文字， 给 appbar共用一下
  var _bottomTitles = ['首页','知识体系','热门'];

  // 底部导航为未选中时图片
  var _bottomIconNor = [
    "images/icon_bottom_main_nor.png",
    "images/icon_bottom_knowledge_nor.png",
    "images/icon_bottom_hot_nor.png"
  ];

  // 底部导航栏选中的图片
  var _bottomIconChecked = [
    "images/icon_bottom_main_checked.png",
    "images/icon_bottom_knowledge_checked.png",
    "images/icon_bottom_hot_checked.png"
  ];
  // 底部导航栏当前选中的页面
  var _currentBottomIndex = 0;

  // controller
  TabController _tabController;
  VoidCallback _tabOnCheanged;

  // 页面
  var _body;


  @override
  void initState() {

    _tabController = TabController(length: _bottomTitles.length, vsync: this);
    _tabOnCheanged = (){
      setState(() {
        _currentBottomIndex = _tabController.index;
      });
    };
    _tabController.addListener(_tabOnCheanged);
    super.initState();

  }

  @override
  void dispose() {
    _tabController.removeListener(_tabOnCheanged);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    _body = TabBarView(
      children: <Widget>[HomePage(),KnowledgePage(),HotPage()],
      controller: _tabController,
    );

    return Scaffold(
      // 顶部标题
      appBar: AppBar(
        title: Text(
          _bottomTitles[_currentBottomIndex],
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          // 搜索
          IconButton(icon: Icon(Icons.search),onPressed: (){},),
          
        ],
        // icon主题设置
        iconTheme: IconThemeData(color: Colors.white),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: getBottomNavigationBarItems(),
          currentIndex: _currentBottomIndex,
          onTap: (index){
            setState(() {
              _currentBottomIndex = index;
              _tabController.index = index;
            });
          },),
      body: _body,
    );
  }

  getBottomNavigationBarItems() => List.generate(
      _bottomTitles.length,
      (index)=> BottomNavigationBarItem(
        icon: getBottomIcon(index),
        title: getBottomTitle(index)
      ));

  getBottomIcon(int i) => Image.asset(
    getBottomIconPath(i),
    width: 25.0,
    height: 25.0,
  );

  getBottomTitle(int i) => Text(
    _bottomTitles[i],
    style: TextStyle(
      color: _currentBottomIndex == i ? Colors.green : Colors.grey
    ),
  );

  String getBottomIconPath(int i) =>
    _currentBottomIndex == i ? _bottomIconChecked[i]: _bottomIconNor[i];

}