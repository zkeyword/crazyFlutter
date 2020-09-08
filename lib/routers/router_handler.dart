import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:crazy/pages/splash.dart';
import 'package:crazy/pages/about.dart';
import 'package:crazy/pages/home.dart';

// 启动页
var splashHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return SplashPage();
  },
);

// app的主页
var mainHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return HomePage();
  },
);

// 关于
var aboutHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return AboutPage();
});
