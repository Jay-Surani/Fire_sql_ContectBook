
import 'package:fire_sql_mycontectbook/regs.dart';
import 'package:fire_sql_mycontectbook/viewpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class logins extends StatefulWidget {
  const logins({Key? key}) : super(key: key);

  @override
  State<logins> createState() => _loginsState();
}

class _loginsState extends State<logins> {
  TextEditingController lname = TextEditingController();
  TextEditingController lpassword = TextEditingController();
  var checkform = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text("Contect Book"),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body:

      SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                height: 80,
                width: 80,
                margin: EdgeInsets.only(top: 25),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  "assets/contectn.png",
                  width: 400,
                  height: 400,
                )),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Account Login',
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Center(
              child: Form(
                  key: checkform,
                  child: Column(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.all(15)),
                      TextFormField(
                        controller: lname,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            icon: Icon(
                              Icons.email,
                              color: Colors.blue,
                            ),
                            suffixIcon: Icon(Icons.remove_red_eye),
                            fillColor: Colors.black,
                            labelText: "Enter Email",
                            hintText: "Email"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            Fluttertoast.showToast(
                                msg: "Plese Enter Email",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 17);
                          } else {
                            null;
                          }
                        },
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      TextFormField(
                          controller: lpassword,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
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
                              return null;
                            }
                          })
                    ],
                  )),
            ),
            Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ElevatedButton(
                    onPressed: () async {
                      try {
                        final credential = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                            email: lname.text.trim(),
                            password: lpassword.text.trim())
                            .then((value) {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return homep();
                            },
                          ));
                        });
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          print('No user found for that email.');
                        } else if (e.code ==
                            Fluttertoast.showToast(
                                msg: "Invalid Password",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 17)) ;
                      }
                      if (checkform.currentState!.validate()) {}
                    },
                    child: Text("Login"))),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 30,
              ),
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                        text: '         Forget Password? ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                            fontWeight: FontWeight.w500),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Sing Up',
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return singup();
                                    },
                                  ));
                                }),
                        ]),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(child: Expanded(flex: 1, child: Container())),
            Container(
              margin: EdgeInsets.only(
                left: 30,
                right: 30,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(2),
                      height: 1,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'Quick Login',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Expanded(
                    child: Container(
                      height: 1,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(7),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Image.asset(
                        "assets/gogglep.png",
                        height: 10,
                        width: 5,
                      ),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Image.asset("assets/facebbok.jpg"),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Image.asset(
                        "assets/twiiter.png",
                        height: 10,
                        width: 5,
                      ),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
