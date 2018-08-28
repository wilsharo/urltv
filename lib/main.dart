import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';

import 'package:urltv_master/home.dart';

import 'package:flutter/services.dart';


void main() {

  //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'URLTV.TV',
        theme: new ThemeData(
            accentColor: Colors.black, primaryColor: const Color(0xFFDE4435)),
        home: new AnimationDemoHome());
  }
}