import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Login.dart';
import 'register2.dart';
import 'globals.dart';

TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
String dropdownValue1 = '인문과학대학';
String dropdownValue2= '국어국문학과';
String dropdownValue3= '정치외교학과';

var id;
var pw;
var email;

class Register extends StatefulWidget {
  Register({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<Register> {

  final TextEditingController _usernameController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _repasswordController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();

  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _usernameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
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
    final repasswordField = TextField(
      obscureText: true,
      controller: _repasswordController,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "비밀번호 재입력",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(8.0))),
    );

    final mail = TextField(
      obscureText: false,
      controller: _emailController,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "ewhain.net 메일을 입력해주십시오",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(8.0))),
    );

    final univ = DropdownButton<String>(
      value: dropdownValue1,
      icon: Icon(Icons.keyboard_arrow_down),
      iconSize: 24,
      elevation: 16,
      onChanged: (String newValue) {
        setState(() {
          dropdownValue1 = newValue;
        });
      },
      items: <String>['인문과학대학', '사회과학대학', '자연과학대학', '엘텍공과대학','음악대학',
        '조형예술대학','사범대학','경영대학','신산업융합대학','의과대학','간호대학','약학대학',
        '스크랜튼대학','호크마교양대학']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
    final depart1 = DropdownButton<String>(
      value: dropdownValue2,
      icon: Icon(Icons.keyboard_arrow_down),
      iconSize: 24,
      elevation: 16,
      onChanged: (String newValue) {
        setState(() {
          dropdownValue2 = newValue;
        });
      },
      items: <String>['국어국문학과','중어중문학과','불어불문학과','독어독문학과','사학과','철학과','기독교학과','영어영문학부',
        '정치외교학과','행정학과','경제학과','문헌정보학과','사회학과','사회복지학과','심리학과','소비자학과','커뮤니케이션 미디어학부',
        '수학과','통계학과','물리학과','화학나노과학과','생명과학과',
        '컴퓨터공학과','사이버보안학과','전자전기공학과','식품공학과','화학신소재공학과','건축학과','건축도시시스템공학과','환경공학과','기후에너지시스템공학과',
        '건반악기과','관현악과','성악과','작곡과','한국음악과','무용과',
        '동양화과','서양화과','조소과','도자예술과',
        '교육학과','유아교육과','초등교육과','교육공학과','특수교육과','영어교육과','사회과교육과','국어교육과','과학교육과','수학교육과',
        '경영학과',
        '융합콘텐츠학과','의류산업학과','국제사무학과','체육과학부','식품영양학과','융합보건학과',
        '의예과','의학과',
        '간호학부',
        '약학과',
        '스크랜튼학부','뇌인지과학과','국제학과','글로벌한국학과',
        '호크마교양대학']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );

    final depart2 = DropdownButton<String>(
      value: dropdownValue3,
      icon: Icon(Icons.keyboard_arrow_down),
      iconSize: 24,
      elevation: 16,
      onChanged: (String newValue) {
        setState(() {
          dropdownValue3 = newValue;
        });
      },
      items: <String>['정치외교학과','행정학과','경제학과','문헌정보학과','사회학과','사회복지학과','심리학과','소비자학과','커뮤니케이션 미디어학부']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );

    final RegisterButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(8.0),
      color: Color.fromARGB(255, 0, 110, 56),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          id=_usernameController.text.toString();
          pw=_passwordController.text.toString();
          email=_emailController.text.toString();
          _callRegisterApi();
        },
        child: Text("인증코드 받기",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    final backButton = Material(
//      elevation: 5.0,
//      borderRadius: BorderRadius.circular(8.0),
      color: Colors.white,
      child: MaterialButton(
//        minWidth: MediaQuery.of(context).size.width,
//        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: (){ Navigator.push(context,
          MaterialPageRoute<void>(builder: (BuildContext context) {
            return Login();
          }
          ),);},
        child: Text("로그인 화면으로 돌아가기",
            textAlign: TextAlign.center,
            style: style.copyWith(
                fontSize: 14,
                color: Colors.black)),
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

                SizedBox(height: 45.0),
                numberField,

                SizedBox(height: 25.0),
                passwordField,

                SizedBox(height: 25.0),
                repasswordField,

                SizedBox(height: 25.0),
                mail,

//                Padding(padding: const EdgeInsets.all(8),
//                    child: Row(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        children: <Widget>[
//                          SizedBox(height: 25.0),
//                          mail,
//
//                          SizedBox(height: 10),
//                          CodeButton,
//                        ]
//                    ),
//                ),

//                Padding(padding: const EdgeInsets.all(8),
//                  child: Row(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: <Widget>[
//                        SizedBox(height: 25.0),
//                        Codeinput,
//
//                        SizedBox(height: 10),
//                        Codecorrect,
//                      ]
//                  ),
//                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0,15.0,0,0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 25.0),
                        univ,

                        SizedBox(height: 25.0),
                        depart1,
                      ]
                  ),
                ),

                SizedBox(
                  height: 35.0,
                ),
                RegisterButton,
                SizedBox(
                  height: 7.0,
                ),
                backButton,
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
            content: Text('이메일로 인증코드가 전송되었습니다.'),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute<void>(builder: (BuildContext context) {
                      return Code();
                    }),
                  );
                },
                child: Text('확인'),
              )
            ],
          );
        });
  }
  void _registerIDFail() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('이미 가입된 사용자입니다.'),
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
  void _registerUnFail() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('잘못된 단과대학입니다.'),
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
  void _registerDeFail() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('잘못된 학과입니다.'),
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
  void _passwordMatchFail() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('비밀번호 확인란에 동일한 비밀번호를 입력해 주십시오'),
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
  void _callRegisterApi() async {
    var api = 'https://ancient-baboon-56.telebit.io/';
    var result = await http.post(
        api + 'user/',
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body: jsonEncode({
          "student_id": id,
          "password": pw,
          "college": dropdownValue1,
          "dept": dropdownValue2,
          "email": email,
        })
    );
    var res = json.decode(utf8.decode(result.bodyBytes));
    print(res['status']);
    if(res['status'] == 0) {
      _registerSuccess();
    }
    else if(res['status'] == 102) {
      _registerIDFail();
    }
    else if(res['status'] == 100) {
      _registerUnFail();
    }
    else if(res['status'] == 101) {
      _registerDeFail();
    }
    else if (_passwordController.text.toString()!=_repasswordController.text.toString()){
      _passwordMatchFail();  
    }
  }
}
