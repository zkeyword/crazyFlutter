import 'dart:io';
import 'package:flutter/services.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crazy/routers/application.dart';
import 'package:crazy/routers/routers.dart';
import 'package:crazy/providers/tab_bar_provider.dart';
import 'package:crazy/providers/keyboard_provider.dart';
import 'package:crazy/providers/test_provider.dart';

void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    //设置Android头部的导航栏透明
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  MyApp() {
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => TabBarProvider()),
          ChangeNotifierProvider(create: (_) => KeyboardProvider()),
          ChangeNotifierProvider(create: (_) => TestProvider()),
        ],
        child: RestartWidget(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: Application.router.generator,
            theme: ThemeData(
                backgroundColor: Colors.white,
                appBarTheme: AppBarTheme(elevation: 1),
                buttonTheme: ButtonThemeData(minWidth: 44.0),
                scaffoldBackgroundColor: Color(0xFFEDEDED)),
          ),
        ));
  }
}

///这个组件用来重新加载整个child Widget的。当我们需要重启APP的时候，可以使用这个方案
///https://stackoverflow.com/questions/50115311/flutter-how-to-force-an-application-restart-in-production-mode
class RestartWidget extends StatefulWidget {
  final Widget child;

  RestartWidget({Key key, @required this.child})
      : assert(child != null),
        super(key: key);

  static restartApp(BuildContext context) {
    final _RestartWidgetState state =
        context.findAncestorStateOfType<_RestartWidgetState>();
    state.restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      child: widget.child,
    );
  }
}
