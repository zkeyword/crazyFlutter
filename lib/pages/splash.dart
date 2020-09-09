import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flustars/flustars.dart';

import 'package:crazy/constant/constant.dart';
import 'package:crazy/routers/routers.dart';
import 'package:crazy/routers/fluro_navigator.dart';

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
  // 定时器相关
  TimerUtil _timerUtil;

  // 计数
  int _count = 5;

  @override
  void initState() {
    super.initState();

    // 配置定时器
    _configureCountDown();
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    child = _buildDefaultLaunchImage();
    return Material(child: child);
  }

  // 配置倒计时
  void _configureCountDown() {
    _timerUtil = TimerUtil(mTotalTime: 5000);
    _timerUtil.setOnTimerTickCallback((int tick) {
      double _tick = tick / 1000;
      if (_tick == 0) {
        // 切换到主页面
        _switchRootView();
      } else {
        setState(() {
          _count = _tick.toInt();
        });
      }
    });
    _timerUtil.startCountDown();
  }

  // 切换rootView
  void _switchRootView() {
    // 跳转路径
    String skipPath;
    // // 跳转模式
    // MHSplashSkipMode skipMode;

    // skipMode = MHSplashSkipMode.homePage;
    skipPath = Routes.mainPage;

    // 跳转对应的主页
    NavigatorUtils.push(context, skipPath,
        clearStack: true, transition: TransitionType.fadeIn);
  }

  // 默认情况是一个启动页
  Widget _buildDefaultLaunchImage() {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: BoxDecoration(
        // 这里设置颜色 跟启动页一致的背景色，以免发生白屏闪烁
        color: Color.fromRGBO(0, 10, 24, 1),
        image: DecorationImage(
          // 注意：启动页 别搞太大 以免加载慢
          image: AssetImage(Constant.assetsImages + 'LaunchImage.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
