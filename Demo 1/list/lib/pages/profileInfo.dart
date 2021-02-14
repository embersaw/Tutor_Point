import 'package:flutter/material.dart';
class profileInfo extends StatefulWidget {

  final String name;
  profileInfo({this.name});


  @override
  _profileInfoState createState() => _profileInfoState(name);
}

class _profileInfoState extends State<profileInfo> {

  final String name;
  _profileInfoState(this.name);
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
