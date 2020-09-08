import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:crazy/routers/application.dart';
import 'package:crazy/routers/routers.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Dart"),
      ),
      body: Container(
        child: _listItem(Text("I am DartI am DartI am DartI am Dart"), () {
          Application.router.navigateTo(
            context,
            Routes.aboutPage,
            transition: TransitionType.inFromRight,
          );
        }),
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
