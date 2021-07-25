import 'package:flutter/material.dart';
import 'homepage_screen.dart';

class DefLevels extends StatefulWidget {
  @override
  _DefLevelsState createState() => _DefLevelsState();
}

class _DefLevelsState extends State<DefLevels> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            height: 40,
            alignment: Alignment.topLeft,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomepageScreen()),
                );
              },
              backgroundColor: Colors.white,
              child: Icon(
                Icons.home,
                size: 30,
                color: Colors.blue[700],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 80.0,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/images/definition.png'),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            alignment: Alignment.center,
            child: Text(
              'Definitions',
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
                  onTap: () {
                  },
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(25, 10, 25, 5),
                    padding: EdgeInsets.all(30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Easy',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: Colors.white,
                      ),
                      gradient: LinearGradient(
                        colors: [
                          Colors.blue[900],
                          Colors.white,
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {

                  },
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(25, 10, 25, 5),
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
                      border: Border.all(
                        color: Colors.white,
                      ),
                      gradient: LinearGradient(
                        colors: [
                          Colors.blue[900],
                          Colors.white,
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                  },
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(25, 10, 25, 5),
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
                      border: Border.all(
                        color: Colors.white,
                      ),
                      gradient: LinearGradient(
                        colors: [
                          Colors.blue[900],
                          Colors.white,
                        ],
                      ),
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
