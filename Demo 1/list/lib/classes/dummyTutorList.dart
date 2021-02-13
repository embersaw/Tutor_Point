import 'package:flutter/material.dart';
import 'package:list/classes/tutor.dart';
import 'package:provider/provider.dart';
import 'package:list/pages/tutor_tile.dart';

class DummyTutor extends StatefulWidget {
  @override
  _DummyTutorState createState() => _DummyTutorState();
}

class _DummyTutorState extends State<DummyTutor> {
  @override
  Widget build(BuildContext context) {
    final tutoring = Provider.of<List<Tutor>>(context) ?? [];

    return ListView.builder(
      itemCount: tutoring.length,
      itemBuilder: (context, index) {
        return TutorTile(tutor: tutoring[index]);
      },
    );
  }
}
