import 'package:flutter/material.dart';
import 'home_widget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'globals.dart' as globals;
import 'Login.dart';
class Vote2 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    int canNumber=0;

    void _callVoteApi() async {
      var api_blockchain = 'http://15.164.170.254:3000/api/org.sample.votebook.Vote';
      var result = await http.post(
          api_blockchain + '',
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
          },
          body: jsonEncode(
              {
                "tokenId": globals.myId,
                "electionId": "2020컴퓨터공학과",
                "select": canNumber-1
              })
      );
      var res = json.decode(utf8.decode(result.bodyBytes));
      print(res);
    }
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
                    globals.completed_2019_cse = true;
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
    void _votepopup() {
      if (canNumber == 1) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('기호 1번에 투표하시겠습니까?'),
                content: Text('확인을 누르시면 투표가 완료되며 다시 투표하실 수 없습니다.'),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      _dismissDialog();
                    },
                    child: Text('취소'),
                  ),
                  FlatButton(
                    onPressed: () {
                      globals.completed_2019_cse = true;
                      _callVoteApi();
                      Navigator.push(context,
                        MaterialPageRoute<void>(
                            builder: (BuildContext context) {
                              return Home();
                            }
                        ),);
                    },
                    child: Text('확인'),
                  )
                ],
              );
            });
      }
      else if (canNumber == 2) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('기호 2번에 투표하시겠습니까?'),
                content: Text('확인을 누르시면 투표가 완료되며 다시 투표하실 수 없습니다.'),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      _dismissDialog();
                    },
                    child: Text('취소'),
                  ),
                  FlatButton(
                    onPressed: () {
                      globals.completed_2019_cse = true;
                      Navigator.push(context,
                        MaterialPageRoute<void>(
                            builder: (BuildContext context) {
                              return Home();
                            }
                        ),);
                      _callVoteApi();
                    },
                    child: Text('확인'),
                  )
                ],
              );
            });
      }
    }
    return new MaterialApp(// 구글 기본 디자인인 Material Design을 써서 앱을 만든다.
        debugShowCheckedModeBanner: false,
        title: 'VOTEBOOK',
        home: Scaffold(
          appBar: new AppBar(
              backgroundColor: Color.fromARGB(255, 250, 250, 250),
              automaticallyImplyLeading: true,
              title: Text("2020 컴퓨터공학과 선거", style: TextStyle(color: Color.fromARGB(250, 114, 114, 114)),),
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
          body:  Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("이화여자대학교 학생선거", style: TextStyle(fontSize: 24, color:Color.fromARGB(255, 0, 110, 56)),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("2020 컴퓨터공학과 선거",style: TextStyle(fontSize: 18)),
                ),
                Container(
                  margin:EdgeInsets.fromLTRB(8.0,32.0,8.0,8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(2.0))),
                    child: Column(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ListTile(
                                leading: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("1", style: TextStyle(fontSize: 16),),
                                ),
                                title: Text('기호 1번'),
                                subtitle: Text('회장 김컴컴, 부회장 김공공'),
                                trailing: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset("assets/vote.png"),
                                ),
                                onTap: (){
                                  canNumber=1;
                                  _votepopup();
                                }
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 2, 16, 2),
                              child: Divider(
                                height: 2.0,
                                color: Colors.grey,
                              ),
                            ),
                            ListTile(
                                leading: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("2", style: TextStyle(fontSize: 16)),
                                ),
                                title: Text('기호 2번'),
                                subtitle: Text('회장 이컴컴, 부회장 이공공'),
                                trailing: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset("assets/vote.png"),
                                ),
                                onTap: (){
                                  canNumber=2;
                                  _votepopup();
                                  _callVoteApi();
                                }
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                ),
              ],
            ),
          ),
        )
    );
  }
}