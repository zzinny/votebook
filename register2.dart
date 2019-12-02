import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Login.dart';
import 'register.dart';

class Code extends StatefulWidget {
  Code({Key key, this.title}) : super(key: key);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.
  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<Code> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  var code='0';

  final TextEditingController _codeController = new TextEditingController();

  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final Codeinput = TextField(
      obscureText: false,
      controller: _codeController,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "인증코드",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(8.0))),
    );

    final Codecorrect = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(8.0),
      color: Color.fromARGB(255, 0, 110, 56),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          code=_codeController.text.toString();
          _callCodeApi();
          //_correctcode();
        },
        child: Text("인증하기",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 100.0,
                  child: Image.asset(
                    "assets/logo.png",
                    fit: BoxFit.contain,
                  ),
                ),

                        SizedBox(height: 25.0),
                        Codeinput,

                        SizedBox(height: 25.0),
                        Codecorrect,

              ],
            ),
          ),
        ),
      ),
    );
  }
  void _registerSuccess() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('인증번호가 일치합니다. 회원가입이 정상적으로 완료되었습니다.'),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute<void>(builder: (BuildContext context) {
                      return Login();
                    }),
                  );
                },
                child: Text('확인'),
              )
            ],
          );
        });
  }
  void _registerfail() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('인증번호가 일치하지 않습니다.'),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  _dismissDialog();
                },
                child: Text('확인'),
              )
            ],
          );
        });
  }

  void _dismissDialog() {
    Navigator.pop(context);
  }

  void _callCodeApi() async {
    var api = 'https://ancient-baboon-56.telebit.io/';
    var result = await http.post(
        api + 'user/code_authentication',
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body: jsonEncode({
        "student_id": id,
        "code": code,
        })
    );
    var res = json.decode(utf8.decode(result.bodyBytes));
    print(res['status']);
    if(res['status'] == 0) {
      _registerSuccess();
    }
    else{
      _registerfail();
    }
  }
}
