import 'package:flutter/material.dart';
import 'Info_cand.dart';
import 'vote2.dart';
import 'globals.dart' as globals;
import 'Login.dart';

class Info2 extends StatelessWidget {
  // This widget is the root of your application.
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
    return new MaterialApp(
      debugShowCheckedModeBanner: false,// 구글 기본 디자인인 Material Design을 써서 앱을 만든다.
      title: 'VOTEBOOK',
      home: Scaffold(
        appBar: new AppBar(
            backgroundColor: Color.fromARGB(255, 250, 250, 250),
            automaticallyImplyLeading: true,
            title: Text("상세정보", style: TextStyle(color: Color.fromARGB(250, 114, 114, 114)),),
            leading: IconButton(icon: new Icon(Icons.arrow_back, color: Color.fromARGB(255, 144, 144, 144)), onPressed:() => Navigator.pop(context, false),),
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
            ListTile(
                title: Text('2020 컴퓨터공학과 선거',style: TextStyle(fontSize: 20,color:Color.fromARGB(255, 0, 110, 56))),
                subtitle: Text('~19/12/31',style: TextStyle(fontSize: 16),)
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("투표 정보",style: TextStyle(fontSize: 16,color:Color.fromARGB(255, 0, 110, 56))),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Text("2020년 컴퓨터공학과 학생선거입니다. 컴퓨터공학과를 대표하는 학생 회장과 학생 부회장을 선출하는 투표입니다.",style: TextStyle(fontSize: 16))),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("후보자 설명",style: TextStyle(fontSize: 16,color:Color.fromARGB(255, 0, 110, 56))),
            ),
            Container(
              margin:EdgeInsets.fromLTRB(8.0,0.0,8.0,8.0),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(2.0))),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Image.asset("assets/logo.png",
                        width: 40,
                        height: 40,),
                      title: Text('기호 1번'),
                      subtitle: Text('회장 김컴컴, 부회장 김공공'),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                      child: Image.asset(
                          'assets/can1.png',
                          width: 300,
                          height: 200,
                          fit:BoxFit.fill
                      ),
                    ),
                    ButtonBar(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new FlatButton(
                            child: const Text('공약 자세히 보기',style: TextStyle(fontSize: 16.0),),
                            onPressed: (){ Navigator.push(context,
                              MaterialPageRoute<void>(builder: (BuildContext context) {
                                return Info_cand();
                              }),
                            );
                            }
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin:EdgeInsets.fromLTRB(8.0,0.0,8.0,0.0),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(2.0))),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Image.asset("assets/logo.png",
                        width: 40,
                        height: 40,),
                      title: Text('기호 2번'),
                      subtitle: Text('회장 이컴컴, 부회장 김공공'),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                      child: Image.asset(
                          'assets/can2.png',
                          width: 300,
                          height: 200,
                          fit:BoxFit.fill
                      ),
                    ),
                    ButtonBar(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new FlatButton(
                            onPressed: null,
                            child: const Text('공약 자세히 보기',style: TextStyle(fontSize: 16.0),)
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: new RaisedButton(
                  child: const Text('투표하기',style: TextStyle(fontSize: 16.0, color: Color.fromARGB(255, 255, 255, 255)),),
                  color:Color.fromARGB(255, 0, 110, 56),
                  onPressed: (){ if(globals.completed_2019_cse == true){
                    _mainvotepopup();
                  } else{
                    Navigator.push(context,
                      MaterialPageRoute<void>(builder: (BuildContext context) {
                        return Vote2();
                      }
                      ),);}}
              ),
            ),
          ],
        ),
      ),
    );
  }
}