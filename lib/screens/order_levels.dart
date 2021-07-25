import 'package:flutter/material.dart';
import 'homepage_screen.dart';

class OrderLevels extends StatefulWidget {
  const OrderLevels({Key key}) : super(key: key);

  @override
  _OrderLevelsState createState() => _OrderLevelsState();
}

class _OrderLevelsState extends State<OrderLevels> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
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
                color: Colors.orangeAccent,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 80.0,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/images/order.png'),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            alignment: Alignment.center,
            child: Text(
              'Word Order',
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
                      gradient: LinearGradient(colors: [Colors.orange, Colors.white,],),
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
                      gradient: LinearGradient(colors: [Colors.orange, Colors.white,],),
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
