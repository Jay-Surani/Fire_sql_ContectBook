import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'login.dart';

enum gender { Male, Female }

class singup extends StatefulWidget {
  const singup({Key? key}) : super(key: key);

  @override
  State<singup> createState() => _singupState();
}

class _singupState extends State<singup> {
  TextEditingController rname = TextEditingController();
  TextEditingController rpassword = TextEditingController();
  TextEditingController remail = TextEditingController();
  TextEditingController rnumber = TextEditingController();

  gender _mf = gender.Male;
  bool isBackButtonActivated = false;

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text("Registration Page"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                height: 140,
                width: 140,
                margin: EdgeInsets.all(20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  "assets/ar.png",
                  width: 500,
                  height: 500,
                )),
            Container(
              child: Text(
                '---------Registration Form---------',
                style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Column(
              children: [
                Padding(padding: EdgeInsets.all(10)),
                ListTile(
                  title: const Text('Male'),
                  leading: Radio(
                    value: gender.Male,
                    groupValue: _mf,
                    onChanged: (gender? value) {
                      setState(() {
                        _mf = gender.Male;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Female'),
                  leading: Radio(
                    value: gender.Female,
                    groupValue: _mf,
                    onChanged: (gender? value) {
                      setState(() {
                        _mf = gender.Female;
                      });
                    },
                  ),
                ),
                Form(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 20,
                        ),
                        child: TextFormField(
                            controller: rname,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                icon: Icon(
                                  Icons.person,
                                  color: Colors.blue,
                                ),
                                fillColor: Colors.black,
                                labelText: "Enter Name",
                                hintText: "Name"),
                            validator: (value) {
                              if (value!.isEmpty) {
                                Fluttertoast.showToast(
                                    msg: "Plese Enter Your Name",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 17);
                              } else {
                                null;
                              }
                            }),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 20,
                  ),
                  child: TextFormField(
                      controller: remail,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          icon: Icon(
                            Icons.email,
                            color: Colors.blue,
                          ),
                          fillColor: Colors.black,
                          labelText: "Enter Email",
                          hintText: "Email"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          Fluttertoast.showToast(
                              msg: "Plese Enter Your Email",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 17);
                        } else if (value.length <= 8) {
                          Fluttertoast.showToast(
                              msg: "Use Atleast 8 Values In Email",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 17);
                        } else {
                          null;
                        }
                      }),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 20,
                  ),
                  child: TextFormField(
                      controller: rnumber,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          icon: Icon(
                            Icons.phone,
                            color: Colors.blue,
                          ),
                          fillColor: Colors.black,
                          labelText: "Enter Number",
                          hintText: "Number"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          Fluttertoast.showToast(
                              msg: "Plese Enter Number",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 17);
                        } else if (value.length <= 10) {
                          Fluttertoast.showToast(
                              msg: "Use Atleast 10 Values For Your Password",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 17);
                        } else {
                          null;
                        }
                      }),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 20,
              ),
              child: TextFormField(
                  controller: rpassword,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      icon: Icon(
                        Icons.key,
                        color: Colors.blue,
                      ),
                      suffixIcon: Icon(Icons.remove_red_eye),
                      fillColor: Colors.black,
                      labelText: "Enter Password",
                      hintText: "Password"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      Fluttertoast.showToast(
                          msg: "Plese Enter Your Password",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 17);
                    } else if (value.length <= 8) {
                      Fluttertoast.showToast(
                          msg: "Use Atleast 8 Values For Your Password",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 17);
                    } else {
                      null;
                    }
                  }),
            ),
            Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 20,
                ),
                child: ElevatedButton(
                    onPressed: () async {
                      try {
                        final credential = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: remail.text.trim(),
                                password: rpassword.text.trim())
                            .then((value) {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return logins();
                            },
                          ));
                        });
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          print('The password provided is too weak.');
                        } else if (e.code ==
                            Fluttertoast.showToast(
                                msg: "Invalid Password",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 17)) ;
                        {}
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Text(
                      "Save",
                    ))),
            Container(
                margin: EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 20,
            ))
          ],
        ),
      ),
    ));
  }
}
