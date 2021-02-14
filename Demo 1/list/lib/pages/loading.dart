import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:list/pages/profileInfo.dart';
import 'package:list/pages/profiles.dart';

final profile = Firestore.instance.collection('profiles');

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  
  @override
  void initState() {
    // TODO: implement initState
    getProfiles();
    super.initState();
  }

  getProfiles(){
    profile.getDocuments().then((QuerySnapshot snapshot){
      snapshot.documents.forEach((DocumentSnapshot doc){
        // print(doc.data());

      });
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => profiles(snapshot:snapshot),
      ));

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      body:

      Center(
        child: SpinKitWanderingCubes(
          color: Colors.blue,
          size: 50.0,
        ),

      ),

    );
  }
}
