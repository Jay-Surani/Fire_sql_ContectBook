
import 'package:fire_sql_mycontectbook/viewpage.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import 'model.dart';

class listupdate extends StatefulWidget {
  Map<dynamic,dynamic>map;



  listupdate(this.map);


  @override
  State<listupdate> createState() => _listupdateState();
}

class _listupdateState extends State<listupdate> {
  Database ?db;

  TextEditingController uname = TextEditingController();
  TextEditingController upassword = TextEditingController();

  @override


  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }
  get(){
    DbHelper dbHelper=DbHelper();
    dbHelper.cfolder().then((value){
      db=value;

    });

    uname.text=widget.map["name"];
    upassword.text=widget.map["password"];




  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text("Update Page")),
      body: Column(children: [
        TextFormField(
          controller: uname,
          decoration: InputDecoration(
              border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
              hintText: "Enter Name",
              labelText: "Name"),
        ),
        Padding(padding: EdgeInsets.all(10)),
        TextFormField(
          controller: upassword,
          decoration: InputDecoration(
              border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
              hintText: "Enter Password",
              labelText: "Password"),
        ),
        Padding(padding: EdgeInsets.all(10)),
        ElevatedButton(
            onPressed: () async {

              var nname=uname.text;
              var npassword=upassword.text;

              var i=widget.map["id"];


              var qry='UPDATE Test SET name = "${nname}", password = "${npassword}" WHERE id = "${i}"';
              var p=await db!.rawUpdate(qry);
              print(p);


              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return homep();
                },
              ));
            },
            child: Text("Update"))
      ]),
    );
  }
}
