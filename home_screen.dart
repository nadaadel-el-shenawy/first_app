import 'package:first_app/veiws/scr/page1.dart';
import 'package:first_app/veiws/scr/page2.dart';
import 'package:first_app/veiws/scr/page3.dart';
import 'package:flutter/material.dart';

class Home_Screen extends StatefulWidget {

   Home_Screen({super.key,});

  static const String id = "Home_screen";
  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  int currentIndex = 0;
  List screens = [
    Page1(),
    SecondScreen(),
    page3(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('task app'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          print(index);
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'page1'),
          BottomNavigationBarItem(icon: Icon(Icons.security), label: 'page2'),
          BottomNavigationBarItem(icon: Icon(Icons.more), label: 'page3'),
        ],
      ),
    );
  }
}
