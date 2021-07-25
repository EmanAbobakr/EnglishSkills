import 'package:englishskills/screens/search.dart';
import 'package:englishskills/screens/wordSearch.dart';
import 'package:flutter/material.dart';
import 'package:word_search/word_search.dart';

import 'homepage_screen.dart';

class SearchLevels extends StatefulWidget {
  @override
  _SearchLevelsState createState() => _SearchLevelsState();
}

class _SearchLevelsState extends State<SearchLevels> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            height: 40,
            alignment: Alignment.topLeft,
            child: FloatingActionButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomepageScreen()),
                );
              },
              backgroundColor: Colors.white,
              child: Icon(
                Icons.home,
                size: 30,
                color: Colors.lightBlueAccent,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 80.0,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/images/search.png'),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            alignment: Alignment.center,
            child: Text(
              'Word Search',
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
                    Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => SearchW()),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(25,10,25,5),
                    padding: EdgeInsets.all(30),
                    child: Text(
                      'Words',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.white,),
                      gradient: LinearGradient(colors: [Colors.lightBlue, Colors.white,],),
                    ),
                  ),
                ),
                InkWell(
                  onTap:(){
                    Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => Wordsearch()),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(25,10,25,5),
                    padding: EdgeInsets.all(30),
                    child: Text(
                      'Numbers',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.white,),
                      gradient: LinearGradient(colors: [Colors.lightBlue, Colors.white,],),
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
