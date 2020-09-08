import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_bloc_pattern/bloc.dart';

class HomePage extends StatelessWidget {
  final bloc = Bloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HomePage"),),
      body: StreamBuilder(
        stream: bloc.data,
        builder: (context,snapshot){
          final result = snapshot.data;
          print(snapshot.connectionState);
          return Text("Welcome");
        },
      ),
    );
  }
}
