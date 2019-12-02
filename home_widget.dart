import 'package:flutter/material.dart';
import 'h.dart';
import 'list.dart';
import 'chart.dart';
import 'listtest.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}
class _HomeState extends State<Home> {
  int _currentIndex=0;
  final List<Widget> _children=[
    Homes(),
    listtest(),
    Chart(),];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text('My Flutter App'),
//      ),
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex, // this will be set when a new tab is tapped
          selectedItemColor: Color.fromARGB(255, 0, 110, 56),
          unselectedItemColor: Color.fromARGB(255, 114, 114, 114),
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text('홈'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.format_list_bulleted),
              title: new Text('투표목록'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.show_chart),
              title: Text('실시간현황'),
            ),
          ],
        )
    );
  }
  void onTabTapped(int index){
    setState((){
      _currentIndex=index;
    });
  }
}