import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'register.dart';
import 'home_widget.dart';
import 'package:toast/toast.dart';
import 'globals.dart' as globals;

//void main() {
//  runApp(MaterialApp(
//    title:'VOTEBOOK',
//    home:Login(),
//  ));
//}

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);
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
class _MyHomePageState extends State<Login> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  var id;
  var pw;
  final TextEditingController _usernameController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
      final numberField = TextField(
      obscureText: false,
      controller: _usernameController,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "학번",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(8.0))),
    );

    final passwordField = TextField(
      obscureText: true,
      controller: _passwordController,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "비밀번호",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(8.0))),
    );
    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(8.0),
      color: Color.fromARGB(255, 0, 110, 56),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          id=_usernameController.text.toString();
          pw=_passwordController.text.toString();
          _callLoginApi();
        },
        child: Text("로그인",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    final signButton = Material(
//      elevation: 5.0,
//      borderRadius: BorderRadius.circular(8.0),
      color: Colors.white,
      child: MaterialButton(
//        minWidth: MediaQuery.of(context).size.width,
//        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: (){ Navigator.push(context,
          MaterialPageRoute<void>(builder: (BuildContext context) {
            return Register();
          }
          ),);},
        child: Text("회원가입하기",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Color.fromARGB(255, 0, 110, 56), fontWeight: FontWeight.bold)),
      ),
    );
      return WillPopScope(
          onWillPop: () => Future.value(false),
    child:  Scaffold(
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
                  height: 155.0,
                  child: Image.asset(
                    "assets/logo.png",
                    fit: BoxFit.contain,
                  ),
                ),

                SizedBox(height: 45.0),
                numberField,

                SizedBox(height: 25.0),
                passwordField,

                SizedBox(
                  height: 35.0,
                ),
                loginButton,
                SizedBox(
                  height: 15.0,
                ),
                signButton,
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
      ),
    )
    );
  }

  void _callLoginApi() async {
    var api = 'https://ancient-baboon-56.telebit.io/';
    var result = await http.post(
        api + 'user/login',
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body: jsonEncode({
          "student_id": id,
          "password": pw,
        }));
    var res = json.decode(utf8.decode(result.bodyBytes));
    print(res['status']);
    if(res['status'] == 0) {
      globals.myId = res['data'];
      print(globals.myId);
      // 다음 화면으로 넘어감
      Navigator.push(context,
        MaterialPageRoute<void>(builder: (BuildContext context) {
          return Home();
        }),
      );
    }
    else if(res['status'] == 101) {
      // 비밀번호 틀림
      Toast.show("비밀번호가 일치하지 않습니다.", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
    }
    else if(res['status'] == 100) {
      // 학번 틀림
      Toast.show("존재하지 않는 학번입니다.", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
    }
  }
}
