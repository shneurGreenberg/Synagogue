import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'data.dart';

void main() => runApp(const MaterialApp(
      home: CorentPage(),
    ));

class CorentPage extends StatefulWidget {
  const CorentPage({Key? key}) : super(key: key);

  @override
  _CorentPageState createState() => _CorentPageState();
}

class _CorentPageState extends State<CorentPage> {
  // המידע של העמודים
  List<Mypage> pageList = [
    Mypage(
        name: "Адон Олам",
        text: adonOlamText,
        pageNumber: 12,
        needToStand: false),
    Mypage(
        name: "Шейибонэ",
        text: sheyiboneText,
        pageNumber: 25,
        needToStand: false),
    Mypage(
        name: "КАДИШ ДЕРАБАНАН",
        text: kadishDeranananText,
        pageNumber: 26,
        needToStand: false),
    Mypage(
        name: "Адой-ной мелех",
        text: adoynoyMelechText,
        pageNumber: 29,
        needToStand: true),
    Mypage(
        name: "Борух шеомар",
        text: borukhSheomarText,
        pageNumber: 30,
        needToStand: true),
    Mypage(name: "Ашрэй", text: ashreiText, pageNumber: 31, needToStand: false),
    Mypage(
        name: "Йиштабах", text: yistabyText, pageNumber: 38, needToStand: true),
    Mypage(name: "Овину", text: ovinText, pageNumber: 41, needToStand: false),
    Mypage(
        name: "Шма Йисроэйл",
        text: shmaYisroeilText,
        pageNumber: 42,
        needToStand: false),
    Mypage(
        name: "МОЛИТВА АМИДА",
        text: amidsprayerText,
        pageNumber: 45,
        needToStand: true),
    Mypage(
        name: "КЕДУША", text: kedushaText, pageNumber: 47, needToStand: true),
    Mypage(
        name: "МОДИМ ДЕРАБАНАН",
        text: summarDeolananText,
        pageNumber: 51,
        needToStand: true),
    Mypage(
        name: " МОЛИТВА ТАХАНУН",
        text: therepentantprayerofTahanunText,
        pageNumber: 54,
        needToStand: true),
    Mypage(
        name: "дополнительные молитвы В ПОНЕДЕЛЬНИК И ЧЕТВЕРТ",
        text: additionalprayersonMondayandquarterText,
        pageNumber: 56,
        needToStand: true),
    Mypage(
        name: "Чтение Торы",
        text: readingtheTorahText,
        pageNumber: 61,
        needToStand: true),
    Mypage(name: "Ашрэй", text: ashreiText, pageNumber: 66, needToStand: true),
    Mypage(
        name: "ПСАЛМЫ НА КАЖДЫЙ ДЕНЬ НЕДЕЛИ",
        text: psalmsforeverydayoftheweekText,
        pageNumber: 71,
        needToStand: false),
    Mypage(
        name: "Эйн кэлокэйну",
        text: einKloloineText,
        pageNumber: 78,
        needToStand: false),
    Mypage(
        name: "Наш долг", text: ourdebtText, pageNumber: 81, needToStand: true),
    Mypage(
        name: "Ал тиро", text: alTiroText, pageNumber: 82, needToStand: false),
  ];

  // העמוד הנוכחי
  int _corentPage = 0;

// פונקציית מעבר לעמוד הבא
  void nextPage() {
    setState(() {
      _corentPage++;
      if (_corentPage > pageList.length - 1) {
        _corentPage = 0;
      }
    });
  }

// פונקציית מעבר לעמוד הקודם
  void lastPage() {
    setState(() {
      _corentPage--;
      if (_corentPage < 0) {
        _corentPage = pageList.length - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // העמוד הראשי
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // כפתור הקודם
          Positioned(
            child: ElevatedButton(
              child: const Icon(Icons.arrow_back),
              onPressed: lastPage,
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  // שם העמוד
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    margin: const EdgeInsets.all(10.0),
                    child: Center(
                      child: AutoSizeText(
                        pageList[_corentPage].name,
                        style: const TextStyle(
                            fontSize: 100.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius:
                              20.0, // has the effect of softening the shadow
                          spreadRadius:
                              5.0, // has the effect of extending the shadow
                          offset: Offset(
                            10.0, // horizontal, move right 10
                            10.0, // vertical, move down 10
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                  ),
                ),
                Expanded(
                  // מספר העמוד
                  flex: 3,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Expanded(
                          flex: 1,
                          child: Center(
                            child: AutoSizeText(
                              'Страница',
                              style: TextStyle(fontSize: 100.0),
                              minFontSize: 70,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: AutoSizeText(
                              pageList[_corentPage].pageNumber.toString(),
                              style: const TextStyle(
                                fontSize: 200,
                                fontWeight: FontWeight.bold,
                              ),
                              minFontSize: 70,
                              maxFontSize: 300,
                            ),
                          ),
                        ),
                        Container(
                          // האם צריך לעמוד
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: !pageList[_corentPage].needToStand
                                ? Colors.lightGreen
                                : Colors.red[400],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5000.0)),
                          ),
                          child: Center(
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Flexible(
                                child: AutoSizeText(
                                  pageList[_corentPage].needToStand
                                      ? 'Нужно стоять'
                                      : 'Не нужно стоять',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                  minFontSize: 40,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    padding: const EdgeInsets.all(60),
                    margin: const EdgeInsets.all(10.0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius:
                              20.0, // has the effect of softening the shadow
                          spreadRadius:
                              5.0, // has the effect of extending the shadow
                          offset: Offset(
                            10.0, // horizontal, move right 10
                            10.0, // vertical, move down 10
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            // הטקסט
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(30),
              child: AutoSizeText(
                pageList[_corentPage].text,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                minFontSize: 60,
                // maxFontSize: 50,
              ),
              margin: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 20.0, // has the effect of softening the shadow
                    spreadRadius: 5.0, // has the effect of extending the shadow
                    offset: Offset(
                      10.0, // horizontal, move right 10
                      10.0, // vertical, move down 10
                    ),
                  )
                ],
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
            ),
          ),
          Positioned(
            child: ElevatedButton(
              child: const Icon(Icons.arrow_forward),
              onPressed: nextPage,
            ),
          ),
        ],
      ),
    );
  }
}
