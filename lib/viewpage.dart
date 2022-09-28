import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import 'insertpage.dart';
import 'listupdatepage.dart';
import 'model.dart';

void main() {
  runApp(MaterialApp(
    title: "SqfLite",
    home: homep(),
  ));
}

class homep extends StatefulWidget {
  const homep({Key? key}) : super(key: key);

  @override
  State<homep> createState() => _homepState();
}

class _homepState extends State<homep> {
  @override


  initState() {
    super.initState();
    get();
    setState(() {});
  }

  Widget? l;
  Database? db;
  List<Map> list = [];

  get() {
    DbHelper dbHelper = DbHelper();
    dbHelper.cfolder().then((value) async {
      db = value;
      String qry = 'SELECT * FROM Test';
      list = await db!.rawQuery(qry);
      l = ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          Map map = list[index];
          return ListTile(
            title: Text("${map["name"]}"),
            subtitle: Text("${map["password"]}"),
            trailing: TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Container(

                        child: AlertDialog(
                          backgroundColor: Colors.greenAccent,
                          elevation: 24.0,




                          title: Text("Are You Sure"),
                          content: Text("Enter Your Choice"),
                          actions: [

                            Icon(

                              Icons.edit,
                              color: Colors.blue,
                            ),
                            TextButton(


                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return listupdate(map);
                                  },
                                ));
                              },
                              child: Text("Update"),
                            ),
                            Icon(
                              Icons.delete,
                              color: Colors.blue,
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Icon(
                                    Icons.delete,
                                    color: Colors.blue,
                                  );
                                },
                                child: Text("Delete"))
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Icon(Icons.more_vert)),
          );
        },
      );
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("HomePage"),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              print("Searching....");
            },
          ),
        ],
      ),
      body: l,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return insertp();
            },
          ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
