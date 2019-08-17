import 'package:flutter/material.dart';

class Vote extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp( // 구글 기본 디자인인 Material Design을 써서 앱을 만든다.
      title: 'VOTEBOOK',
      home: Scaffold(
        appBar: new AppBar(
            backgroundColor: Color.fromARGB(255, 250, 250, 250),
            automaticallyImplyLeading: true,
            title: Text("2020 학생회장 선거", style: TextStyle(color: Color.fromARGB(250, 114, 114, 114)),),
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

        body:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("이화여자대학교 학생선거", style: TextStyle(fontSize: 24, color:Color.fromARGB(255, 0, 110, 56)),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("2020 학생회장 선거",style: TextStyle(fontSize: 18)),
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
                            subtitle: Text('회장 이화연, 부회장 김화연'),
                              trailing: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset("assets/vote.png"),
                              ),
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
                              subtitle: Text('회장 이화연, 부회장 김화연'),
                              trailing: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset("assets/vote.png"),
                              ),
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
                  onPressed:() => Navigator.pop(context, false)
                ),
              ),
            ],
          ),
          ),
        )
      );
  }
}
