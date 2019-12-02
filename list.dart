import 'package:flutter/material.dart';
import 'Info.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Login.dart';

class Votelist extends StatelessWidget {
  // 상태 변경이 없는 위젯. 한번 UI가 그려지면 그대로 있음.
  @override
  Widget build(BuildContext context) {
    // UI를 만드는 부분.
    void _dismissDialog() {
      Navigator.pop(context);
    }
    void _logoutpopup() {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('로그아웃 하시겠습니까?'),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    _dismissDialog();
                  },
                  child: Text('취소'),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute<void>(builder: (BuildContext context) {
                        return Login();
                      }),);
                  },
                  child: Text('확인'),
                ),
              ],
            );
          });
    }
    return new MaterialApp( // 구글 기본 디자인인 Material Design을 써서 앱을 만든다.
      debugShowCheckedModeBanner: false,
      title: 'VOTEBOOK',
      home: Scaffold(
        appBar: new AppBar(
            backgroundColor: Color.fromARGB(255, 250, 250, 250),
            automaticallyImplyLeading: true,
            title: Text("VOTEBOOK",
              style: TextStyle(color: Color.fromARGB(250, 114, 114, 114)),),
            leading: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset("assets/logo.png"),
            ),
            actions: <Widget>[
              IconButton(icon: new Icon(Icons.exit_to_app,
                  color: Color.fromARGB(255, 114, 114, 114)),
                tooltip: 'user',
                onPressed: () {_logoutpopup();},)
            ]
        ), // 앱의 상단 타이틀
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("진행할 투표", style: TextStyle(
                  fontSize: 16, color: Color.fromARGB(255, 0, 110, 56))),
            ),
            ListTile(
              leading: new Image.asset('assets/vote.png', fit: BoxFit.contain,),
              title: Text('2020 공과대학 선거', style: TextStyle(fontSize: 16)),
              trailing: Text('8/10-8/30', style: TextStyle(
                  fontSize: 12, color: Color.fromARGB(255, 100, 100, 100))),
              onTap: () {
                Navigator.push(context,
                  MaterialPageRoute<void>(builder: (BuildContext context) {
                    return Info();
                  }
                  ),);
              },
            ),
            ListTile(
              leading: new Image.asset('assets/vote.png', fit: BoxFit.contain,),
              title: Text('2020 컴퓨터공학과 선거', style: TextStyle(fontSize: 16)),
              trailing: Text('8/10-8/30', style: TextStyle(
                  fontSize: 12, color: Color.fromARGB(255, 100, 100, 100))),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("완료한 투표", style: TextStyle(
                  fontSize: 16, color: Color.fromARGB(255, 0, 110, 56))),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 8, 16, 8),
              child: Text("완료한 투표가 없습니다", style: TextStyle(
                  fontSize: 16, color: Color.fromARGB(255, 150, 150, 150)),
                  textAlign: TextAlign.center),
            ),
//            ListTile(
//              leading: new Image.asset('assets/vote.png', fit: BoxFit.contain,),
//              title: Text('2020 컴퓨터공학과 선거', style: TextStyle(fontSize: 16)),
//              trailing: Text('8/10-8/30',style: TextStyle(fontSize: 12, color:Color.fromARGB(255, 100, 100, 100))),
//            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("마감된 투표", style: TextStyle(
                  fontSize: 16, color: Color.fromARGB(255, 0, 110, 56))),
            ),
//            Padding(
//              padding: const EdgeInsets.fromLTRB(16.0,8,16,8),
//              child: Text("마감된 투표가 없습니다",style: TextStyle(fontSize: 16,color:Color.fromARGB(255, 150,150,150)),textAlign: TextAlign.center,),
//            ),
            ListTile(
              leading: new Image.asset('assets/vote.png', fit: BoxFit.contain,),
              title: Text('2018 공과대학 학생회 선거', style: TextStyle(fontSize: 16)),
              trailing: Text('8/10-8/30', style: TextStyle(
                  fontSize: 12, color: Color.fromARGB(255, 100, 100, 100))),
            ),
            ListTile(
              leading: new Image.asset(
                'assets/didvote.png', fit: BoxFit.contain,),
              title: Text('2018 선거선거', style: TextStyle(fontSize: 16)),
              trailing: Text('8/10-8/30', style: TextStyle(
                  fontSize: 12, color: Color.fromARGB(255, 100, 100, 100))),
            ),
          ],
        ),
      ),
    );
  }
}