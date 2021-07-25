import 'package:flutter/material.dart';


class EngLevels extends StatefulWidget {

  @override
  _EngLevelsState createState() => _EngLevelsState();
}

class _EngLevelsState extends State<EngLevels> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            height: 40,
            alignment: Alignment.topLeft,
            child: FloatingActionButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              backgroundColor: Colors.white,
              child: Icon(
                Icons.home,
                size: 30,
                color: Colors.pink,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 80.0,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/images/english.png'),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            alignment: Alignment.center,
            child: Text(
              'Use of English',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            child: Column(
              children: [
                InkWell(
                  onTap:(){
                  },
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(25,10,25,5),
                    padding: EdgeInsets.all(30),
                    child: Text(
                      'Easy',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.white,),
                      gradient: LinearGradient(colors: [Colors.pinkAccent, Colors.white,],),
                    ),
                  ),
                ),
                InkWell(
                  onTap:(){

                  },
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(25,10,25,5),
                    padding: EdgeInsets.all(30),
                    child: Text(
                      'Medium',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.white,),
                      gradient: LinearGradient(colors: [Colors.pinkAccent, Colors.white,],),
                    ),
                  ),
                ),
                InkWell(
                  onTap:(){
                    // Navigator.of(context).pop();
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => EnglishScreen()),
                    // );
                  },
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(25,10,25,5),
                    padding: EdgeInsets.all(30),
                    child: Text(
                      'Hard',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.white,),
                      gradient: LinearGradient(colors: [Colors.pinkAccent, Colors.white,],),
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
