import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Login.dart';

class Chart extends StatelessWidget {
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
            title: Text("VOTEBOOK", style: TextStyle(color: Color.fromARGB(250, 114, 114, 114)),),
            leading: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset("assets/logo.png"),
            ),
            actions: <Widget>[
              IconButton(icon: new Icon(Icons.exit_to_app, color: Color.fromARGB(255, 114, 114, 114)),
                tooltip: 'user',
                onPressed: () {_logoutpopup();},)
            ]
        ), // 앱의 상단 타이틀
        body:  Text("실시간 정보"),
      ),
    );
  }
  void _callLoginApi() async {
    var api = 'https://irritus.serveo.net/';
    var result = await http.post(
        api + 'user/login',
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body: jsonEncode({

        }));
    var res = json.decode(utf8.decode(result.bodyBytes));
    print(res['status']);
  }
}