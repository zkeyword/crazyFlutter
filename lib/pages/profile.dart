import 'package:flutter/material.dart';
import 'package:crazy/routers/fluro_navigator.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("ProfilePage"),
      ),
      body: Container(
        child: GestureDetector(
          child: Text("I am ProfilePage"),
          onTap: () {
            NavigatorUtils.goWebViewPage(
              context,
              'xxx',
              'https://m.baidu.com/',
            );
          },
        ),
      ),
    );
  }
}
