import 'package:flutter/material.dart';

class Info_cand extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp( // 구글 기본 디자인인 Material Design을 써서 앱을 만든다.
      title: 'VOTEBOOK',
      home: Scaffold(
        appBar: new AppBar(
            backgroundColor: Color.fromARGB(255, 250, 250, 250),
            automaticallyImplyLeading: true,
            title: Text("후보자 설명", style: TextStyle(color: Color.fromARGB(250, 114, 114, 114)),),
            leading: IconButton(icon: new Icon(Icons.arrow_back, color: Color.fromARGB(255, 144, 144, 144)), onPressed:() => Navigator.pop(context, false),),
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
              ListTile(
                  title: Text('기호 1번',style: TextStyle(fontSize: 20,color:Color.fromARGB(255, 0, 110, 56))),
                  subtitle: Text('회장 이화연, 부회장 김화연',style: TextStyle(fontSize: 16),)
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset("assets/can1.png"),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Text("저희 기호 1번 이화연, 김화연은 더 나은 공대를 위해 노력할 것입니다.",style: TextStyle(fontSize: 16)),
              ),
            ]
        ),
      ),
    );
  }
}