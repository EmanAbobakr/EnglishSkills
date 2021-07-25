import 'package:englishskills/screens/definitions/definitions_screen.dart';
import 'package:englishskills/screens/english/english_screen.dart';
import 'package:englishskills/screens/order/order_screen.dart';
import 'package:englishskills/screens/order_levels.dart';
import 'package:englishskills/screens/search_levels.dart';
import 'package:englishskills/screens/wordSearch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomepageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            height: 30,
            alignment: Alignment.topRight,
            child: FloatingActionButton(
              onPressed: null,
              backgroundColor: Colors.grey[300],
              child: Icon(
                Icons.settings,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 70.0,
              backgroundImage: AssetImage('assets/images/logo.png'),
              backgroundColor: Colors.grey[300],
              ),
            ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.space,
              children: [
                Stack
                  (
                  children: [
                    InkWell(
                      onTap:(){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EnglishScreen()),
                        );
                      },
                      child: Container(
                        alignment: Alignment.topCenter,
                        width: double.infinity,
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(20),
                        child: Text(
                          'Write Sentence',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.white,),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 15),
                      alignment: Alignment.centerLeft,
                      child: CircleAvatar(
                        radius: 40.0,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('assets/images/english.png'),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DefinitionsScreen()),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(20),
                        child: Text(
                          'Definitions',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue[800],
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.white,),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 15),
                      child: CircleAvatar(
                        radius: 40.0,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('assets/images/definition.png'),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OrderScreen()),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(20),
                        child: Text(
                          'Word Order',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.orangeAccent,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.white,),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 15),
                      child: CircleAvatar(
                        radius: 40.0,
                        backgroundImage: AssetImage('assets/images/order.png'),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(context,
                        MaterialPageRoute(
                        builder: (context) => SearchLevels()),
                        );
                        },
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(20),
                        child: Text(
                          'Matrix',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.white,),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 15),
                      child: CircleAvatar(
                        radius: 40.0,
                        backgroundImage: AssetImage('assets/images/search.png'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
