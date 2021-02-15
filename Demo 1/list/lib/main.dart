import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:list/pages/createProfile.dart';
import 'package:list/pages/edit.dart';
import 'package:list/pages/loading.dart';
import 'package:list/pages/demo.dart';
import 'package:list/pages/home.dart';
import 'package:list/pages/edit.dart';

import 'pages/createProfile.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: '/',
    routes:{
      '/': (context)=>Loading(),
      '/createProfile': (context)=>createProfile(),
      '/demo': (context)=> myApp(),
      // '/Home' : (context)=> Home(),
      '/editProfile' : (context)=> editProfile(),

    },
  ));
}