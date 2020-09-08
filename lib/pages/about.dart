import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("about"),
      ),
      body: Container(
        child: Text("I am Dart"),
      ),
    );
  }
}
