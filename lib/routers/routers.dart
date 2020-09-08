import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import './router_handler.dart';

class Routes {
  static String root = "/";
  static String transitionPage = "/transition";
  static String mainPage = "/main";
  static String aboutPage = "/about";

  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return;
    });

    router.define(root, handler: splashHandler);
    router.define(mainPage, handler: mainHandler);
    router.define(aboutPage, handler: aboutHandler);
  }
}
