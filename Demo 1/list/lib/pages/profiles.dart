import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:list/classes/profiles.dart';
import 'package:list/pages/createProfile.dart';
import 'package:list/pages/profileInfo.dart';

class profiles extends StatefulWidget {
  final QuerySnapshot snapshot;
  profiles({this.snapshot});
  @override
  _profilesState createState() => _profilesState(snapshot);
}

class _profilesState extends State<profiles> {
  final QuerySnapshot snapshot;

  _profilesState(this.snapshot);

  // List<Profile> profiles = new List();

  List<String> names = new List();


  @override
  void initState() {
    // TODO: implement initState
    convert(snapshot);
    super.initState();
  }

  convert(snapshot){
    snapshot.documents.forEach((DocumentSnapshot doc){

       String name = doc.data()["name"];
       // String days = doc.data()["days"];
       // String notification = doc.data()["notification"];
       // String time = doc.data()["time"];
       // Map<String,bool> map = doc.data()["week"];

       // Profile profile = new Profile(name,days,notification,time);

      // profiles.add(profile);
      // print(profiles);
      names.add(name);
      print(names);
    });
  }


  @override



  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
              'All Profiles',
              style:TextStyle(fontSize: 30) ,

          ),

        ),
        toolbarHeight: 200,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),

        child: ListView.builder(
            itemCount: names.length,
            itemBuilder: (context,index){
              return Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
                color: Colors.grey[900],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),

                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                  child: ListTile(

                    onTap: (){

                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => profileInfo(name:names[index]),
                      ));



                    },

                    leading: Icon(Icons.circle, color: Colors.white, ),
                    trailing: Icon(Icons.more_vert, color: Colors.white,),


                    title: Text(

                        names[index],
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                        ) ,

                    ),

                  ),

                ),


              );


            }
        ),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => createProfile(),
          ));

        },
        child: Icon(Icons.add),
        backgroundColor: Colors.deepOrange,
      ),


    );
  }
}
