import 'package:englishskills/screens/homepage_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'api.dart';

class EnglishScreen4 extends StatefulWidget {
  @override
  _EnglishScreen4State createState() => _EnglishScreen4State();
}

class _EnglishScreen4State extends State<EnglishScreen4> {
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
                        child: Text('4/4',style: TextStyle(color: Colors.white),),
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
                            builder: (context) => HomepageScreen()),
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
  String sentence;
  OutlineInputBorder _inputForm(){
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide:
      BorderSide(width: 1.0, color: Colors.pink, style: BorderStyle.solid),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
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
                      color: Colors.pink,
                    ),
                  ),
                ],
              )),
          Container(
            color: Colors.pink,
            padding: EdgeInsets.all(30),
            height: 300,
            width: double.infinity,
            child: Image.asset("assets/images/monkey.jpg", fit: BoxFit.fill),
          ),
          Container(
            margin: EdgeInsets.only(top: 16),
            color: Colors.white,
            height: 240,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                Container(
                  margin: EdgeInsets.all(20),
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        sentence = value;
                      });

                    },
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      enabledBorder: _inputForm(),
                      focusedBorder: _inputForm(),
                      labelText: 'Look and write what do you see?',
                    ),
                    maxLines: 3,
                  ),
                ),
                // ignore: deprecated_member_use
                FlatButton(
                  onPressed: () {
                    Future<String> res = http_service().GetData(sentence,4);

                    res.then((value) {
                      if(value == "CORRECT"){
                        _showMyDialogC();
                      }else {
                        _showMyDialogW();
                      }


                    });
                  },
                  color: Colors.pinkAccent,
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
