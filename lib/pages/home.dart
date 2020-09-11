import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:crazy/constant/style.dart';
import 'about.dart';
import 'profile.dart';
import 'preview.dart';
import 'favourite.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  List<BottomNavigationBarItem> getTabs() => [
        // BottomNavigationBarItem(
        //         icon: new SvgPicture.asset(
        //           item.image,
        //         ),
        //         activeIcon: new SvgPicture.asset(
        //           item.selectedImage,
        //           color: Style.pTintColor,
        //         ),
        //         title: Text(
        //           item.title,
        //           textScaleFactor: 1.0,
        //           // Fixed Bug: 这个只需要设置字体大小即可，颜色不要设置
        //           style: TextStyle(
        //             fontSize: 10.0,
        //           ),
        //         ),
        //       ),
        BottomNavigationBarItem(
            title: Text('主页'),
            icon: Icon(
              Icons.home,
              size: 22.0,
            )),
        BottomNavigationBarItem(
            title: Text('分类'),
            icon: Icon(
              Icons.list,
              size: 22.0,
            )),
        BottomNavigationBarItem(
            title: Text('活动'),
            icon: Icon(
              Icons.local_activity,
              size: 22.0,
            )),
        BottomNavigationBarItem(
            title: Text('消息'),
            icon: Icon(
              Icons.notifications,
              size: 22.0,
            )),
        BottomNavigationBarItem(
          title: Text('我的'),
          icon: Icon(
            Icons.person,
            size: 22.0,
          ),
        )
      ];

  List<Widget> getTabWidget(BuildContext context) =>
      [ProfilePage(), AboutPage(), PreviewPage(), FavouritePage(), AboutPage()];

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var tabs = getTabs();
    return Scaffold(
      appBar: null,
      body: IndexedStack(
        index: _currentIndex,
        children: getTabWidget(context),
      ),
      bottomNavigationBar: CupertinoTabBar(
        items: tabs,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        activeColor: Style.pTintColor,
        inactiveColor: Color(0xFF191919),
      ),
    );
  }
}
