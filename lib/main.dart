import 'package:flutter/material.dart';
import './screens/homepage_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        textTheme: Theme.of(context).textTheme.apply(
            fontFamily: 'poppins'
        ),
      ),
      // home: HomepageScreen(),
      routes:{
        '/': (ctx) => HomepageScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("English skills"),
      ),
      body: null, // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
