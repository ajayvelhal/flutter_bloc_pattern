import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bloc.dart';

class Login extends StatelessWidget {
  final bloc = Bloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Login",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: bloc.email,
              builder: (context, snapshot) => TextField(
                onChanged: bloc.emailChanged,
                decoration: InputDecoration(
                    hintText: "xyz@gmail.com",
                    labelText: "Please Enter Email ID",
                    errorText: snapshot.error,
                    border: OutlineInputBorder()),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            StreamBuilder(
              stream: bloc.password,
              builder: (context, snapshot) => TextField(
                onChanged: bloc.passwordChanged,
                decoration: InputDecoration(
                    hintText: "xyz@gmail.com",
                    labelText: "Please Enter Email ID",
                    errorText: snapshot.error,
                    border: OutlineInputBorder()),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            StreamBuilder(
              stream: bloc.submit,
              builder: (context, snapshot) => OutlineButton(
                onPressed: snapshot.hasData?()=>bloc.loginClick(context):null,
                borderSide:
                    BorderSide(style: BorderStyle.solid, color: Colors.red),
                child: Text("Login"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
