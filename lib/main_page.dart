import 'package:aptproj/homepage.dart';
import 'package:flutter/material.dart';
import 'package:aptproj/searchpage.dart';
import 'package:aptproj/profilepage.dart';
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  void pageShifter(index){
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> myScreen =[
    HomePage(),
    Search(),
    Profile(),


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myScreen[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        onTap: pageShifter,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.apps_rounded),label:"home"),
          BottomNavigationBarItem(icon: Icon(Icons.search),label:"Search"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label:"Profile"),
        ],
      ),
    );
  }
}
