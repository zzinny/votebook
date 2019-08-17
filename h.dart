import 'package:flutter/material.dart';
import 'Info.dart';
import 'vote.dart';

class Homes extends StatelessWidget {
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
            leading: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset("assets/logo.png"),
            ),
            actions: <Widget>[
              IconButton(icon: new Icon(Icons.search, color: Color.fromARGB(255, 114, 114, 114)),
                tooltip: 'search',
                onPressed: () => {},),
              IconButton(icon: new Icon(Icons.perm_identity, color: Color.fromARGB(255, 114, 114, 114)),
                tooltip: 'user',
                onPressed: () {},)
            ]
        ), // 앱의 상단 타이틀

        body:   ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("현재 진행 중인 투표",style: TextStyle(fontSize: 16,color:Color.fromARGB(255, 0, 110, 56))),
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
                        title: Text('2020 학생회장 선거'),
                        subtitle: Text('10/5~10/9'),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                        child: Image.asset(
                            'assets/vote.png',
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
                              onPressed: (){ Navigator.push(context,
                                MaterialPageRoute<void>(builder: (BuildContext context) {
                                  return Vote();
                                }
                                ),);}
                          ),
                        ],
                      ),
                    ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("마감된 투표",style: TextStyle(fontSize: 16,color:Color.fromARGB(255, 0, 110, 56))),
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
                      title: Text('2019 학생회장 선거'),
                      subtitle: Text('10/5~10/9'),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                      child: Image.asset(
                          'assets/vote.png',
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
                            onPressed: null,
                            child: const Text('상세정보', style: TextStyle(fontSize: 16.0),)
                        ),
                        new FlatButton(
                            onPressed: null,
                            child: const Text('투표하기',style: TextStyle(fontSize: 16.0),)
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),],
        ),
      ),
    );
  }
}

