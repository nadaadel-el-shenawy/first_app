import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Page1 extends StatefulWidget {
  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  String email = "";

  getEmail() async {
    final prefs = await SharedPreferences.getInstance();
    email = prefs.getString("email") ?? '--';
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getEmail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(email)),
    );
  }
}
 