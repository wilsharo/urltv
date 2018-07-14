import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';

import 'package:urltv_master/home.dart';




void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'URLTV.TV',
        theme: new ThemeData(
            accentColor: Colors.orange, primaryColor: const Color(0xFFDE4435)),
        home: new AnimationDemoHome());
  }
}