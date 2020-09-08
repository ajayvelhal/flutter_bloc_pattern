import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_bloc_pattern/home.dart';
import 'package:login_bloc_pattern/user.dart';

import 'validator.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;

class Bloc implements BaseBloc {
  final Validators validator = Validators();
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _dataController = BehaviorSubject();

  Stream<String> get email =>
      _emailController.stream.transform(validator.emailValidator);

  Stream<String> get password =>
      _passwordController.stream.transform(validator.passwordValidator);

  Stream get data => _dataController.stream;

  Function(String) get emailChanged => _emailController.sink.add;

  Function(String) get passwordChanged => _passwordController.sink.add;

  Stream<bool> get submit =>
      Rx.combineLatest2(email, password, (email, password) => true);

  void loginClick(context) {
    apiCall();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomePage()));
  }

  apiCall() async {
    final String url = "https://jsonplaceholder.typicode.com/todos";
    var response = await http.get(url);
    var data = json.decode(response.body);
    var result = data as List;
    print(data);
    print(result[0]);
    var respObj = User.fromJson(result[0]); //converted the json here
    print("Object $respObj");
    _dataController.sink.add(respObj); //added the data to the stream
    print("data ${this._dataController.value}");
  }

  @override
  void dispose() {
    _emailController?.close();
    _passwordController?.close();
    _dataController?.close();
  }
}

abstract class BaseBloc {
  void dispose() {}
}
