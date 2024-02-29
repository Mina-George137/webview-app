import 'package:flutter/material.dart';
import '../settings/setting_screen.dart';
import 'home_screen_body.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';
  final String url;
  const HomeScreen({Key? key,required this.url}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    var pageList = [ HomeScreenBody(url: widget.url), const SettingScreen()];
    var appTitles = ["Web View", "Settings"];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:Text(appTitles[selectedIndex],style: TextStyle(color: Colors.white),) ,
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
          currentIndex: selectedIndex,
          elevation: 0,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          showUnselectedLabels: true,

          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_suggest_outlined),
              label: 'Settings',
            ),
          ],
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          }),
      body: pageList[selectedIndex],
    );
  }
}
