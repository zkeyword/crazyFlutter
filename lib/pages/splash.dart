import 'package:flutter/material.dart';

// 闪屏跳转模式
enum MHSplashSkipMode {
  newFeature, // 新特性（引导页）
  login, // 登陆
  currentLogin, // 账号登陆
  homePage, // 主页
  ad, // 广告页
}

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("启动页"),
      ),
    );
  }
}
