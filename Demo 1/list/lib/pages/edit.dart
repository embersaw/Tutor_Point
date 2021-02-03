import 'package:flutter/material.dart'
    show
        AppBar,
        BuildContext,
        Icon,
        IconButton,
        Icons,
        Scaffold,
        State,
        StatefulWidget,
        Widget;

class editProfile extends StatefulWidget {
  @override
  _editProfileState createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                //function when clicked on button
              })
        ],
      ),
    );
  }
}
