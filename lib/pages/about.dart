import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crazy/providers/test_provider.dart';

TextStyle bold24Roboto = new TextStyle(
  color: Colors.white,
  fontSize: 24.0,
  fontWeight: FontWeight.w900,
);

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TestProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("about"),
      ),
      body: Column(
        children: <Widget>[
          GestureDetector(
            child: Container(
              child: Text("I am Dart"),
              height: 30,
              decoration: BoxDecoration(
                  border:
                      Border(bottom: BorderSide(width: 1, color: Colors.red))),
              margin: new EdgeInsets.only(left: 16.0),
              padding: new EdgeInsets.only(left: 16.0),
              width: double.infinity,
            ),
          ),
          Text(
            "I am Dart",
            style: bold24Roboto,
          ),
          Text("I am Dart"),
          Text(provider.val),
        ],
      ),
    );
  }
}
