import 'package:flutter/material.dart';
import 'Info_cand.dart';
import 'vote.dart';

class Info extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp( // 구글 기본 디자인인 Material Design을 써서 앱을 만든다.
      title: 'VOTEBOOK',
      home: Scaffold(
        appBar: new AppBar(
            backgroundColor: Color.fromARGB(255, 250, 250, 250),
            automaticallyImplyLeading: true,
            title: Text("상세정보", style: TextStyle(color: Color.fromARGB(250, 114, 114, 114)),),
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

        body:   ListView(
          children: <Widget>[
            ListTile(
                title: Text('2020 학생회장 선거',style: TextStyle(fontSize: 20,color:Color.fromARGB(255, 0, 110, 56))),
                subtitle: Text('2019년 10/5~10/9',style: TextStyle(fontSize: 16),)
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("투표 정보",style: TextStyle(fontSize: 16,color:Color.fromARGB(255, 0, 110, 56))),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Text("1886년 한국 최초의 근대식 여성 교육기관 ‘이화학당’으로 시작한 이화는 이 땅의 여성들에게 새로운 변화를 가져왔습니다. 차별과 편견 속에서 한 사람의 인간으로 존중받지 못하던 한국 여성들은, 이화가 뿌린 교육의 씨앗을 통해 자신이 여성임을 긍정하고 당당한 사회의 일원으로 우뚝 설 수 있었습니다. 한국 여성 고등교육의 선구자로서 각계각층의 여성 리더를 배출하며 학문과 사회의 발전에 기여해온 이화는 이제 또 다른 전환점을 맞았습니다. 4차 산업혁명의 거대한 물결 속에서 사회가 급변하고 융·복합 인재에 대한 수요가 급증하는 등 매우 도전적인 환경이 우리를 둘러싸고 있습니다. 한 세기가 넘는 역사 속에서 그래왔듯이, 이화는 남이 가지 않은 길을 개척하며 밝은 미래를 만들어 나갈 것입니다. 이를 위해 학문의 자율권을 바탕으로 교육 및 연구 역량을 강화하고, 도전정신으로 대학교육의 새로운 모델을 제시하며, 소통과 신뢰를 기반으로 공동체 윤리의식을 추구함으로써 미래 사회를 바르게 이끌어 나가겠습니다. 한 명의 여학생으로 시작해 인문, 사회, 자연, 공학, 의학, 예술 등 모든 계열의 전공을 갖춘 세계적 여자 종합대학으로 성장한 이화. 우리는 ‘세상 어디에도 없는 이화’의 자부심을 바탕으로 시대를 앞서가는 도전을 통해 미래를 개척하는 여성 지성 공동체가 되겠습니다.",style: TextStyle(fontSize: 16)),
            ),
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
                      subtitle: Text('회장 이화연, 부회장 김화연'),
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
                      subtitle: Text('회장 이화연, 부회장 김화연'),
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
                  onPressed: (){ Navigator.push(context,
                    MaterialPageRoute<void>(builder: (BuildContext context) {
                      return Vote();
                    }
                    ),);}
              ),
            ),
          ],
        ),
      ),
    );
  }
}
