import 'dart:ui';
import 'package:englishskills/screens/order/info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "dart:math";

class OrderScreen extends StatefulWidget {

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final _random = new Random();

  List<String> sentences = ["I am making an appointment","All that glitters is not gold","he can not refuse my offer"];
  String fullSentence;
  List<String> words;
  String sentence = " ";
  _OrderScreenState(){
    fullSentence = sentences[_random.nextInt(sentences.length)];
    words = fullSentence.split(" ");
    words.shuffle();
  }


//  String fullSentence = "I am making an appointment";
//  String sentence = " ";
//  List<String> Words = ['I','making','an','appointment','am'];



  Future<void> _showMyDialogW() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Container(
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        radius: 50.0,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('assets/images/sad.png'),
                      ),
                      Text('Ops!'),
                      Text('Your answer is wrong!'),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  // ignore: deprecated_member_use
                  child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      setState(() {
                        sentence = " ";
                      });
                    },
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Text(
                      "Try again",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  Future<void> _showMyDialogC() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          //title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Container(
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        child: Text('1/4',style: TextStyle(color: Colors.white),),
                        backgroundColor: Colors.green,
                      ),
                      CircleAvatar(
                        radius: 50.0,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('assets/images/smile.png'),
                      ),
                      Text('Congratulation'),
                      Text('Your answer is correct'),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  // ignore: deprecated_member_use
                  child: FlatButton(
                    onPressed: () {},
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Text(
                      "Next",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: ListView(
        children: [
          Container(
              height: 40,
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.arrow_back_outlined,
                      size: 30,
                      color: Colors.orange,
                    ),
                  ),
                ],
              )),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(60),
            color: Colors.orange,
            child: Text(sentence, style: TextStyle(fontSize: 20,),),
            //child: Text(sentence),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            color: Colors.white,
              alignment: Alignment.center,
              height: 350,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ...words.map((val){
                    return Column(
                      children: [
                        FlatButton(onPressed: (){
                          setState(() {
                            sentence=sentence+' '+val;
                          });
                    },
                          child: Text(val),
                          color: Colors.orange,
                                              shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide (width: 1,color: Colors.white,),
                    ),
                        ),
                      ],
                    );
                  }).toList()
                ],
              )
          ),
          Container(
                  margin: EdgeInsets.only(top: 50),
                  // ignore: deprecated_member_use
                  child: FlatButton(
                    onPressed: (){
                      int flag = 1;
                      //var givenWords = fullSentence.split(" ");
                      //var returnedWords = sentence.split(" ");
                      var givenSentence = fullSentence.replaceAll(' ', '');
                      var returnedSentence = sentence.replaceAll(' ', '');
                      if(givenSentence == returnedSentence)
                        {
                          _showMyDialogC();
                        }
                      else
                        {
                          _showMyDialogW();
                        }

                      /*
                      if(givenWords.length == returnedWords.length)
                        {
                          for(int i = 0 ; i < givenWords.length ; i++)
                            {
                              if(givenWords[i] != returnedWords[i])
                                _showMyDialogW();
                              flag = 0;
                            }
                          if(flag == 1)
                            {
                              _showMyDialogC();
                            }
                        }

                       */

                    },
                    color: Colors.orange,
                    textColor: Colors.white,
                    child: Text("Check answer"),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide (width: 1,color: Colors.white,),
                    ),
                  ),
                ),
//          Container(
//            color: Colors.white,
//            margin: EdgeInsets.only(top: 20),
//            height: 340,
//            child: Column(
//              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//              children: [
//                Container(
//                  margin: EdgeInsets.only(top: 10),
//                  child: Text(
//                    'Order these words:',
//                    style: TextStyle(
//                      //fontSize: 16,
//                      fontWeight: FontWeight.bold,
//                      fontStyle: FontStyle.italic,
//                    ),
//                  ),
//                ),

//
//
//
//
//
        ],
      ),
    );
  }
}


