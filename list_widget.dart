import 'package:flutter/material.dart';

class Vote extends StatelessWidget {
  // 상태 변경이 없는 위젯. 한번 UI가 그려지면 그대로 있음.
  @override
  Widget build(BuildContext context) {

    // UI를 만드는 부분.
    return new MaterialApp( // 구글 기본 디자인인 Material Design을 써서 앱을 만든다.
      title: 'VOTEBOOK',
      home: Scaffold(
        appBar: new AppBar(
            backgroundColor: Color.fromARGB(255, 250, 250, 250),
            automaticallyImplyLeading: true,
            title: Text("VOTEBOOK", style: TextStyle(color: Color.fromARGB(250, 114, 114, 114)),),
            leading: Image.asset("assets/logo.png"),
            actions: <Widget>[
              IconButton(icon: new Icon(Icons.search, color: Color.fromARGB(255, 114, 114, 114)),
                tooltip: 'search',
                onPressed: () => {},),
              IconButton(icon: new Icon(Icons.perm_identity, color: Color.fromARGB(255, 114, 114, 114)),
                tooltip: 'user',
                onPressed: () {},)
            ]
        ), // 앱의 상단 타이틀
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("진행할 투표",style: TextStyle(fontSize: 16,color:Color.fromARGB(255, 0, 110, 56))),
            ),
            ListTile(
              leading: new Image.asset('assets/vote.png', fit: BoxFit.contain,),
              title: Text('2020 학생회장 선거', style: TextStyle(fontSize: 16)),
              trailing: Text('8/10-8/30',style: TextStyle(fontSize: 12, color:Color.fromARGB(255, 100, 100, 100))),
            ),
            ListTile(
              leading: new Image.asset('assets/vote.png', fit: BoxFit.contain,),
              title: Text('2020 공과대학 학생회 선거', style: TextStyle(fontSize: 16)),
              trailing: Text('8/10-8/30',style: TextStyle(fontSize: 12, color:Color.fromARGB(255, 100, 100, 100))),
            ),
            ListTile(
              leading: new Image.asset('assets/vote.png', fit: BoxFit.contain,),
              title: Text('2020 선거선거', style: TextStyle(fontSize: 16)),
              trailing: Text('8/10-8/30',style: TextStyle(fontSize: 12, color:Color.fromARGB(255, 100, 100, 100))),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("완료한 투표",style: TextStyle(fontSize: 16,color:Color.fromARGB(255, 0, 110, 56))),
            ),
            ListTile(
              leading: new Image.asset('assets/didvote.png', fit: BoxFit.contain,),
              title: Text('2019 공과대학 학생회 선거', style: TextStyle(fontSize: 16)),
              trailing: Text('8/10-8/30',style: TextStyle(fontSize: 12, color:Color.fromARGB(255, 100, 100, 100))),
            ),
            ListTile(
              leading: new Image.asset('assets/didvote.png', fit: BoxFit.contain,),
              title: Text('2019 선거선거', style: TextStyle(fontSize: 16)),
              trailing: Text('8/10-8/30',style: TextStyle(fontSize: 12, color:Color.fromARGB(255, 100, 100, 100))),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("마감된 투표",style: TextStyle(fontSize: 16,color:Color.fromARGB(255, 0, 110, 56))),
            ),
            ListTile(
              leading: new Image.asset('assets/vote.png', fit: BoxFit.contain,),
              title: Text('2018 공과대학 학생회 선거', style: TextStyle(fontSize: 16)),
              trailing: Text('8/10-8/30',style: TextStyle(fontSize: 12, color:Color.fromARGB(255, 100, 100, 100))),
            ),
            ListTile(
              leading: new Image.asset('assets/didvote.png', fit: BoxFit.contain,),
              title: Text('2018 선거선거', style: TextStyle(fontSize: 16)),
              trailing: Text('8/10-8/30',style: TextStyle(fontSize: 12, color:Color.fromARGB(255, 100, 100, 100))),
            ),
          ],
        ),

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1, // this will be set when a new tab is tapped
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
            )
//        BottomNavigationBarItem(
//        icon: Icon(Icons.person),
//    title: Text('Profile'),
//    )
          ],
        ),
      ),
    );
  }
}
