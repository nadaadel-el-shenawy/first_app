import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  State<Page1>  createState() => Page1State();
}
class_Page1State extends; State<Page1>{
  String email='';

  getCashEmail()async{
    final SharedPreferences prefs =await SharedPreferences.getInstance();
    email = prefs.getString('email')?? '--';
    setState(() {} );
  }
  @override
  void initState(){
    super.initState();
    getCashEmail();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Page1 \n $email',
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
  }
}
