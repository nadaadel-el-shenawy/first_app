

import 'package:first_app/models/user_model.dart';
import 'package:first_app/services/user_service.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  List<UserModel> users = [];

  getMyUsers() async {
    users = await UserServices().getUser();
    setState(() {

    });
  }

  @override
  void initState() {
    getMyUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index)=>ListTile(
          title: Text(users[index].name ?? '--'),
          subtitle: Text(users[index].email ?? '--'),
          trailing: const Icon(Icons.person),
          leading: Text('${index +1}'),
        ),

      ),
    );
  }
}