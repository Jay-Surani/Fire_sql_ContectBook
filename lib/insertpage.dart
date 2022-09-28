
import 'package:fire_sql_mycontectbook/viewpage.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import 'model.dart';


class insertp extends StatefulWidget {
  const insertp({Key? key}) : super(key: key);

  @override
  State<insertp> createState() => _insertpState();
}

class _insertpState extends State<insertp> {
  TextEditingController iname = TextEditingController();
  TextEditingController ipassword = TextEditingController();
  Database? db;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DbHelper dbhelper = DbHelper();
    dbhelper.cfolder().then((value) {
      db = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.greenAccent[0xFF69F0AE],

        appBar: AppBar(
          backgroundColor: Colors.tealAccent,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text("Insert Page"),
        ),
        body: Column(
          children: [
            Image.asset(
              "assets/adddata.png",
              height: 200,
              width: 200,
            ),
            Padding(padding: EdgeInsets.all(5)),
            TextFormField(
              controller: iname,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                  hintText: "Enter Name",
                  labelText: "Name"),
            ),
            Padding(padding: EdgeInsets.all(10)),
            TextFormField(

              controller: ipassword,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                  hintText: "Enter Password",
                  labelText: "Password"),
            ),
            Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(


                onPressed: () async {
                  String qry =
                      'INSERT INTO Test(name, password) VALUES("${iname.text}","${ipassword.text}")';

                  int i = await db!.rawInsert(qry);
                  print("value of i=${i}");
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return homep();
                    },
                  ));
                },

                child: Text("Save"))
          ],
        ),
      ),
    );
  }
}
