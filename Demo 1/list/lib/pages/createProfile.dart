import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:flutter/widgets.dart';
import 'package:weekday_selector/weekday_selector.dart';
import 'package:list/classes/WeekDayClass.dart';
import 'package:list/classes/notificationClass.dart';





class createProfile extends StatefulWidget {
  @override
  _createProfileState createState() => _createProfileState();
}

class _createProfileState extends State<createProfile> {

  String name;
  String time='00:00';



  ExampleNumber selectedNumber;//stores the number of days selected
  notificationClass selectedId;


  final values = List.filled(7, false); //store the days of week

  TimeOfDay _time = new TimeOfDay.now();


  Future<Null> _selectTime(BuildContext context) async{
    final TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime: _time);
    if(picked!=null && picked!=_time){
      setState(() {
        _time=picked;
        time=_time.toString().substring(10,15);
      });
    }
  }


  @override
  Widget build(BuildContext context) {

    


    return Scaffold(
        resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueGrey[300],
        actions: <Widget> [
          IconButton(
              icon: Icon(
                Icons.check,
                color: Colors.black,
              ),
              onPressed: () async {

                print(name);
                print(values);
                print(selectedNumber.getString());
                print(time);
                print(selectedId);


                List<String> weeks = ['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'];

                Map<String,bool> map = Map.fromIterables(weeks,values);

                print(map);

                Firestore.instance.collection("profiles").add({
                  'name' : name,

                  'time' : time,

                  'week' : map,

                  'days' : selectedNumber.getString(),

                  'notification' : selectedId.getIdString(),

                });
              }),
        ],
      ),
      body:Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              Text('Student Name'),
              TextFormField(
                onChanged: (val){
                  name=val;
                },
              ),
              SizedBox(height: 30.0),
              Text('Number of Days'),
              SizedBox(height: 10.0),
              SearchableDropdown.single(
                items: ExampleNumber.list.map((exNum) {
                  return (DropdownMenuItem(
                      child: Text(exNum.numberString), value: exNum));
                }).toList(),
                value: selectedNumber,
                hint: "Select number of days",
                searchHint: "Select a number",
                onChanged: (value) {
                  setState(() {
                    selectedNumber = value;
                  });
                },
                dialogBox: true,
                isExpanded: true,
              ),
              SizedBox(height: 30.0),
              Text('Select the days'),
              SizedBox(height: 10.0),
              WeekdaySelector(
                  onChanged: (int day){
                    setState(() {
                      final index = day%7;
                      values[index] = !values[index];
                    });
                  },
                  values: values),
              SizedBox(height: 30.0),
              Text('Select Time'),
              SizedBox(height: 20.0),
              RaisedButton(
                child: Text(time),
                onPressed: (){
                  _selectTime(context);
                },
              ),
              SizedBox(height: 30.0),
              Text('Notify me before'),
              SizedBox(height: 20.0),
              SearchableDropdown.single(
                items: notificationClass.list.map((exnot) {
                  return (DropdownMenuItem(
                      child: Text(exnot.idString), value: exnot));
                }).toList(),
                value: selectedId,
                hint: "Notify me before",
                searchHint: "Select a time",
                onChanged: (value) {
                  setState(() {
                    selectedId = value;
                  });
                },
                dialogBox: true,
                isExpanded: true,
              ),





            ],
          ),
        ),
      )

    );
  }
}

