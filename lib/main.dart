import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          constraints: BoxConstraints.expand(),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: Container(
                    width: 80,
                    height: 80,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xffd8d8d8)),
                    child: Image.asset('assets/image/uit-logo.png')),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: Text(
                  "Hello\nWelcome back !",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: TextField(
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  decoration: InputDecoration(
                      labelText: "USERNAME",
                      labelStyle:
                          TextStyle(color: Color(0xff888888), fontSize: 15)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: <Widget>[
                    TextField(
                      obscureText: true,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      decoration: InputDecoration(
                          labelText: "PASSWORD",
                          labelStyle: TextStyle(
                              color: Color(0xff888888), fontSize: 15)),
                    ),
                    Text(
                      "SHOW",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Image.asset('assets/image/capcha.png')),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    color: Colors.blue,
                    onPressed: onSigninClicked,
                    child: Text(
                      "SIGNIN",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
              Container(
                height: 130,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "New user? Signup",
                      style: TextStyle(color: Color(0xff888888), fontSize: 15),
                    ),
                    Text(
                      "Forgot password ?",
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onSigninClicked() {}
}
