import 'package:flutter/material.dart';
import 'package:list/classes/tutor.dart';

class TutorTile extends StatelessWidget {
  final Tutor tutor;
  TutorTile({this.tutor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              Container(
                color: Colors.black12,
                child: Text(tutor.name),
              ),
              Container(
                color: Colors.black12,
                child: Text(tutor.values.toString()),
              ),
              Container(
                color: Colors.black12,
                child: Text(tutor.selectedNumber.toString()),
              ),
              Container(
                color: Colors.black12,
                child: Text(tutor.time),
              ),
              Container(
                color: Colors.black12,
                child: Text(tutor.selectedID),
              )
            ],
          )),
    );
  }
}
