import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Login.dart';

class listtest extends StatelessWidget {

  var test =0;

  // 상태 변경이 없는 위젯. 한번 UI가 그려지면 그대로 있음.
  Future<List<voteList>> _getVote() async {
    var api = "https://ancient-baboon-56.telebit.io/";
    print('d');
    var result = await http.get(
      api+'vote/',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
    );




    var res = json.decode(utf8.decode(result.bodyBytes));
    print(res['status']);
    //var jsonData = json.decode(utf8.decode(api.bodyBytes));
    print(res['data']);
    print('e');
    List<voteList> ingvotes = [];
    List<voteList> donevotes = [];
    List<voteList> votes = [];
    for(var v in res['data']){
      voteList VOTElist = voteList(v["id"],v["title"],v["contents"],v["starts_at"],v["expired_at"]);

      if (v['dat']=="False")
        {
          ingvotes.add(VOTElist);
          test += 1 ;
        }
      else {
        donevotes.add(VOTElist);
      }
      votes = ingvotes + donevotes;
     // votes.add(VOTElist);
    }

    print('a');
    return votes;
  }

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
              title: Text("VOTEBOOK",
                style: TextStyle(color: Color.fromARGB(250, 114, 114, 114)),),
              leading: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset("assets/logo.png"),
              ),
              actions: <Widget>[
                IconButton(icon: new Icon(Icons.exit_to_app,
                    color: Color.fromARGB(255, 114, 114, 114)),
                  tooltip: 'user',
                  onPressed: () {_logoutpopup();},)
              ]
          ), // 앱의 상단 타이틀
          body: Container(
            child: FutureBuilder(
              future: _getVote(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return Container(
                      child: Center(
                        child: Text("로딩중"),
                      )
                  );
                } else {
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("진행할 투표",style: TextStyle(fontSize: 16,color:Color.fromARGB(255, 0, 110, 56))),
                  );
                  
                  return ListView.builder(
                    itemCount: (snapshot.data.length)+1,
                    itemBuilder: (BuildContext context, int id) {
                      if (test ==0 ){
                       test =1;
                        return
                          ListTile(
                            title: Text("진행할 투표", style: TextStyle(
                                fontSize: 16, color: Color.fromARGB(255, 0, 110, 56))),
                          );
                      }
                      else {
                        return
                          ListTile(
                            leading: new Image.asset(
                              'assets/vote.png', fit: BoxFit.contain,),
                            title: Text(snapshot.data[id-1].title),
                            trailing: Text(
                                "~ " + snapshot.data[id-1].exprired_at),
                          );
                      }
                    },
                  );
                }
              },
            ),
          )
      ),
    );
  }
}

class voteList{
  final int id;
  final String title;
  final String contents;
  final String starts_at;
  final String exprired_at;

  voteList(this.id, this.title, this.contents,this.exprired_at,this.starts_at);

}