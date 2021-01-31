import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:demo/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'loading';

  void setupWorldTIme() async {
    WorldTime instance = WorldTime(location: 'Malta', flag: 'germany.png', url: 'Europe/Malta' );
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
    });

  }


  @override
  void initState() {
    super.initState();
    setupWorldTIme();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Text(time),
      ),
    );
  }
}
