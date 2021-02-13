import 'dart:js';

import 'package:flutter/material.dart';
import 'package:list/pages/createProfile.dart';
import 'package:list/pages/edit.dart';
import 'package:list/pages/loading.dart';
import 'package:list/pages/demo.dart';
import 'package:list/pages/home.dart';
import 'package:list/classes/dummyTutorList.dart';
import 'package:list/pages/tutor_tile.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/editProfile',
    routes: {
      '/': (context) => Loading(),
      '/createProfile': (context) => createProfile(),
      '/demo': (context) => myApp(),
      '/Home': (context) => Home(),
      '/editProfile': (context) => editProfile(),
    },
  ));
}
