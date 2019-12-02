import 'package:flutter/material.dart';
import 'Info.dart';
import 'vote.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'globals.dart' as globals;
import 'Login.dart';
import 'vote2.dart';
import 'Info2.dart';

void main() {
  runApp(MaterialApp(
    title:'VOTEBOOK',
    home:Homes(),
  ));
}
class Homes extends StatelessWidget {
  // 상태 변경이 없는 위젯. 한번 UI가 그려지면 그대로 있음.
  @override
  Widget build(BuildContext context) {
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
    void _mainvotepopup() {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('이미 완료한 투표입니다.'),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    _dismissDialog();
                  },
                  child: Text('확인'),
                ),
              ],
            );
          });
    }
    // UI를 만드는 부분.
    return new MaterialApp(
      debugShowCheckedModeBanner: false,// 구글 기본 디자인인 Material Design을 써서 앱을 만든다.
      title: 'VOTEBOOK',
      home: Scaffold(
        appBar: new AppBar(
            backgroundColor: Color.fromARGB(255, 250, 250, 250),
            automaticallyImplyLeading: true,
            title: Text("VOTEBOOK", style: TextStyle(color: Color.fromARGB(250, 114, 114, 114)),),
            leading: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset("assets/logo.png"),
            ),
            actions: <Widget>[
              IconButton(icon: new Icon(Icons.exit_to_app, color: Color.fromARGB(255, 114, 114, 114)),
                tooltip: 'user',
                onPressed: () {
                  globals.myId = '';
                  _logoutpopup();
                }
                )
            ]
        ), // 앱의 상단 타이틀

        body:   ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("현재 진행 중인 투표",style: TextStyle(fontSize: 16,color:Color.fromARGB(255, 0, 110, 56))),
            ),
            Container(
              margin:EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(0.0))),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Image.asset("assets/gong.png",
                        width: 40,
                        height: 40,),
                      title: Text('2020 공과대학 선거'),
                      subtitle: Text('~19/12/31'),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                      child: Image.asset(
                          'assets/gongdae.png',
                          width: 300,
                          height: 200,
                          fit:BoxFit.fill
                      ),
                    ),
                    ButtonBar(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new FlatButton(
//                            padding: EdgeInsets.all(8.0),
                          child: const Text('상세정보', style: TextStyle(fontSize: 16.0),),
                          onPressed: (){ Navigator.push(context,
                            MaterialPageRoute<void>(builder: (BuildContext context) {
                              return Info();
                            }
                            ),);},),
                        new FlatButton(
                            child: const Text('투표하기',style: TextStyle(fontSize: 16.0),),
                            onPressed: (){
                              if(globals.completed_2019_eltec == true){
                                _mainvotepopup();
                              } else{
                                Navigator.push(context,
                              MaterialPageRoute<void>(builder: (BuildContext context) {
                                return Vote();
                              }),);}}
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin:EdgeInsets.fromLTRB(8, 0, 8, 8),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(0.0))),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Image.asset("assets/gong.png",
                        width: 40,
                        height: 40,),
                      title: Text('2020 컴퓨터공학과 선거'),
                      subtitle: Text('~19/12/31'),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                      child: Image.asset(
                          'assets/comgong.png',
                          width: 300,
                          height: 200,
                          fit:BoxFit.fill
                      ),
                    ),
                    ButtonBar(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new FlatButton(
//                            padding: EdgeInsets.all(8.0),
                          child: const Text('상세정보', style: TextStyle(fontSize: 16.0),),
                          onPressed: (){
                            Navigator.push(context,
                            MaterialPageRoute<void>(builder: (BuildContext context) {
                              return Info2();
                            }
                            ),);},),
                        new FlatButton(
                            child: const Text('투표하기',style: TextStyle(fontSize: 16.0),),
                            onPressed: (){
                              if(globals.completed_2019_cse == true){
                                _mainvotepopup();
                              }else {Navigator.push(context,
                              MaterialPageRoute<void>(builder: (BuildContext context) {
                                return Vote2();

                              }
                              ),);}}
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ]
        )
      ),
    );
  }
  void _callVoteInfoAll() async {
    var api = 'https://ancient-baboon-56.telebit.io/';
    var result = await http.post(
        api + 'user/login',
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body: jsonEncode({
          "student_id": 'id',
          "password": 'pw',
        }));
    var res = json.decode(utf8.decode(result.bodyBytes));
    print(res['status']);
  }
}
