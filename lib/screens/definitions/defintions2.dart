import 'dart:math';
import 'dart:ui';
import 'package:englishskills/models/Data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'definitions3.dart';

class Definitions2 extends StatefulWidget {
  @override
  _Definitions2State createState() => _Definitions2State();
}

class _Definitions2State extends State<Definitions2> {
  Random rnd = new Random();

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
                        child: Text('2/4',style: TextStyle(color: Colors.white),),
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
                    onPressed: () {
                      Navigator.pushReplacement(context,
                        MaterialPageRoute(
                            builder: (context) => Definitions3()),
                      );
                    },
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

  bool isPresent(String text) {
    return Data().listCorrect2.contains(text);
  }

  @override
  Widget build(BuildContext context) {
    var element = Data().listOfSent2[rnd.nextInt(Data().listOfSent2.length)];
    return Scaffold(
      backgroundColor: Colors.blue,
      body: ListView(
        children: [
          Container(
            alignment: Alignment.topLeft,
            height: 40,
            margin: EdgeInsets.all(10),
            child: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              backgroundColor: Colors.white,
              child: Icon(
                Icons.arrow_back_outlined,
                size: 30,
                color: Colors.blue[700],
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(40),
            margin: EdgeInsets.all(40),
            width: double.infinity,
            child: Text(
              element,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.white,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 22),
            color: Colors.white,
            height: 330,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    'What means this sentence?',
                    style: TextStyle(
                      //fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                Container(
                  child: FloatingActionButton(
                    backgroundColor: Colors.blue,
                    onPressed: () {},
                    child: Icon(
                      Icons.keyboard_voice,
                    ),
                  ),
                ),
                // ignore: deprecated_member_use
                FlatButton(
                  onPressed: () {
                    _showMyDialogC();
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("Check answer"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      width: 1,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
