import 'package:flutter/material.dart';
import 'package:demo/pages/home.dart';
import 'package:demo/pages/choose_location.dart';
import 'package:demo/pages/loading.dart';
import 'package:demo/pages/hello.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/' ,
    routes: {
      '/' : (context) => ListScreen(),
      '/home' : (context) => Home(),
      '/location' : (context) => ChooseLocation(),
    },
  ));
}

