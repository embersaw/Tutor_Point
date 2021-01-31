import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  bool _isLoading = true;
  List<String> _items = [];

  @override
  void initState() {
    super.initState();
    _getListData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(10),
          child: !_isLoading && _items.isEmpty
              ? Center(
            child: Text("No data found"),
          )
              : (_isLoading && _items.isEmpty)
              ? Container(
            color: Colors.transparent,
            child: Center(
              child: CircularProgressIndicator(
                valueColor:
                AlwaysStoppedAnimation<Color>(Colors.pink),
              ),
            ),
          )
              : ListView.builder(
            itemCount: _items.length,
            itemBuilder: (context, index) {
              return _createListRow(_items[index], index);
            },
          ),
        ),
      ),
    );
  }

  _createListRow(String item, int index) {
    return Card(
      elevation: 3,
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(item),
          FlatButton(
            child: Text("Delete"),
            onPressed: () {
              setState(() {
                _items.removeAt(index);
              });
            },
          )
        ],
      ),
    );
  }

  _getListData() {
    //  Create dynamic list
    Future.delayed(Duration(milliseconds: 500));
    setState(() {
      _items.add("First");
      _items.add("Second");
      _items.add("Third");
      _isLoading = false;
    });
  }
}