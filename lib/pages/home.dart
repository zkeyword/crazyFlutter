import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:crazy/routers/application.dart';
import 'package:crazy/routers/routers.dart';
import 'package:crazy/constant/constant.dart';
import 'package:crazy/constant/style.dart';
import 'about.dart';
import 'profile.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  static List tabData = [
    _TabBarItem('微信', Constant.assetsImagesTabbar + 'icons_outlined_chats.svg',
        Constant.assetsImagesTabbar + 'icons_filled_chats.svg'),
    _TabBarItem(
        '通讯录',
        Constant.assetsImagesTabbar + 'icons_outlined_contacts.svg',
        Constant.assetsImagesTabbar + 'icons_filled_contacts.svg'),
  ];

  // pages
  List<Widget> _pageList = List();

  // 当前索引
  int _currentIndex = 0;

  // 底部导航items
  List<BottomNavigationBarItem> _tabItems = [];

  // page
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    for (int i = 0; i < tabData.length; i++) {
      final item = tabData[i];
      _tabItems.add(
        BottomNavigationBarItem(
          icon: new SvgPicture.asset(
            item.image,
          ),
          activeIcon: new SvgPicture.asset(
            item.selectedImage,
            color: Style.pTintColor,
          ),
          title: Text(
            item.title,
            textScaleFactor: 1.0,
            // Fixed Bug: 这个只需要设置字体大小即可，颜色不要设置
            style: TextStyle(
              fontSize: 10.0,
            ),
          ),
        ),
      );
    }
    _pageList..add(ProfilePage())..add(AboutPage());
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // bottom nav bar action
  void _itemTapped(int index) {
    // 跳转指定页
    _pageController.jumpToPage(index);
  }

  // page controller 事件
  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _pageList,
        physics: NeverScrollableScrollPhysics(), // 禁止滑动
      ),
      bottomNavigationBar: CupertinoTabBar(
        items: _tabItems,
        onTap: _itemTapped,
        currentIndex: _currentIndex,
        activeColor: Style.pTintColor,
        inactiveColor: Color(0xFF191919),
      ),
    );
  }

  Widget _listItem(Widget title, onTap) {
    return Container(
      child: ListTile(
        title: title,
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: onTap,
      ),
    );
  }
}

class _TabBarItem {
  String title, image, selectedImage;
  _TabBarItem(this.title, this.image, this.selectedImage);
}
