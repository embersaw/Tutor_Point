import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:list/classes/WeekDayClass.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:list/classes/notificationClass.dart';
import 'package:weekday_selector/weekday_selector.dart';

import 'loading.dart';

var map = new Map();
var list = new List();

var values = List.filled(7, false);

class profileInfo extends StatefulWidget {
  final QuerySnapshot snapshot;
  final String xname;

  profileInfo({this.xname, this.snapshot});

  @override
  _profileInfoState createState() => _profileInfoState(xname, snapshot);
}

class _profileInfoState extends State<profileInfo> {
  final String xname;
  final QuerySnapshot snapshot;

  _profileInfoState(this.xname, this.snapshot);

  var name;
  var days;
  var time;
  var notification;
  var weekdays;
  var bool;

  var newtime;
  var newday;
  var newname;
  var newnotification;

  @override
  void initState() {
    // TODO: implement initState
    getProfiles();

    super.initState();
  }

  TimeOfDay _time = new TimeOfDay.now();

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: _time);
    if (picked != null && picked != _time) {
      setState(() {
        _time = picked;
        newtime = _time.toString().substring(10, 15);
      });
    }
  }

  @override
  Future getProfiles() {
    snapshot.documents.forEach((DocumentSnapshot doc) {
      if (doc.data()['name'] == xname) {
        // print(doc.data()['name']);
        // print (doc.data());
        map.addAll(doc.data());
        list = map.values.toList();
        print(list);
        name = list[2];
        notification = list[0];
        days = list[3];
        time = list[4];
        weekdays = list[1];
        weekdays.forEach((k, v) => {
              if (k == "Sunday")
                {
                  if (v == true)
                    {
                      values[0] = true,
                    }
                  else if(v==false)
                    {
                      values[0] = false,
                    }
                },
              if (k == "Monday")
                {
                  if (v == true)
                    {
                      values[1] = true,
                    }
                  else if(v==false)
                    {
                      values[1] = false,
                    }
                },
              if (k == "Tuesday")
                {
                  if (v == true)
                    {
                      values[2] = true,
                    }
                  else if(v==false)
                    {
                      values[2] = false,
                    }
                },
              if (k == "Wednesday")
                {
                  if (v == true)
                    {
                      values[3] = true,
                    }
                  else if(v==false)
                    {
                      values[3] = false,
                    }
                },
              if (k == "Thursday")
                {
                  if (v == true)
                    {
                      values[4] = true,
                    }
                  else if(v==false)
                    {
                      values[4] = false,
                    }
                },
              if (k == "Friday")
                {
                  if (v == true)
                    {
                      values[5] = true,
                    }
                  else if(v==false)
                    {
                      values[5] = false,
                    }
                },
              if (k == "Saturday")
                {
                  if (v == true)
                    {
                      values[6] = true,
                    }
                  else if(v==false)
                    {
                      values[6] = false,
                    }
                }
            });
        print(values);
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueGrey[300],
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.check,
                color: Colors.black,
              ),
              onPressed: () async {
                // print(name);
                // print(values);
                // print(selectedNumber.getString());
                // print(time);
                // print(selectedId);

                // List<String> weeks = ['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'];
                //
                // Map<String,bool> map = Map.fromIterables(weeks,values);

                // print(map);
                //
                // Firestore.instance.collection("profiles").({
                //   'name' : newname,
                //
                //   'time' : newtime,
                //
                //   'week' : map,
                //
                //   'days' : selectedNumber.getString(),
                //
                //   'notification' : selectedId.getIdString(),
                //
                // });

                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Loading(),
                ));
              }),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Text('Student Name'),
              TextField(
                decoration: InputDecoration(
                  hintText: name,
                ),
                onChanged: (val) {
                  newname = val;
                },
              ),
              // SizedBox(height: 30.0),
              Text('Number of Days'),
              SizedBox(height: 10.0),
              SearchableDropdown.single(
                items: ExampleNumber.list.map((exNum) {
                  return (DropdownMenuItem(
                      child: Text(exNum.numberString), value: exNum));
                }).toList(),
                value: newday,
                hint: days,
                searchHint: "Select a number",
                onChanged: (value) {
                  setState(() {
                    newday = value;
                  });
                },
                dialogBox: true,
                isExpanded: true,
              ),
              SizedBox(height: 30.0),
              Text('Select the days'),
              SizedBox(height: 10.0),
              WeekdaySelector(
                  onChanged: (int day) {
                    setState(() {
                      final index = day % 7;
                      values[index] = !values[index];
                    });
                  },
                  values: values),
              SizedBox(height: 30.0),
              Text('Select Time'),
              SizedBox(height: 20.0),
              RaisedButton(
                child: Text(time),
                onPressed: () {
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
                value: newnotification,
                hint: notification,
                searchHint: "Select a time",
                onChanged: (value) {
                  setState(() {
                    newnotification = value;
                  });
                },
                dialogBox: true,
                isExpanded: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
