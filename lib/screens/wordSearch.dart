import 'package:englishskills/screens/search_levels.dart';
import 'package:flutter/material.dart';
import 'package:word_search/word_search.dart';

class Wordsearch extends StatefulWidget {
  const Wordsearch({Key key}) : super(key: key);

  @override
  _WordsearchState createState() => _WordsearchState();
}

class _WordsearchState extends State<Wordsearch> {
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
                            builder: (context) => SearchLevels()),
                      );
                    },
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Text(
                      "Back",
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
  var myController = TextEditingController();
  String enteredWord = "";
  String checker = "";

  var cardColor = Colors.red;
  var changedCardColor = Colors.green;
  var cardColorShadow = Colors.red[500];
  double cardElevation = 10;
  var cardTextColor = Colors.black;
  double spacesBetweenCards = 0;
  double spacesCharBoard = 5;
  double cardTextFontSize = 20;


  int winCounter = 0;
  var puzzle;
  //var r0,r1,r2,r3,r4,r5,r6,r7,r8,r9;

  var solved;
  final List<String> wordList = ["eight"];
  var result = "";
  //WSOrientation wordOrientation;

  //List<List<String>> puzzle;

  //final _random = new Random();

  // Create a list of words to be jumbled into a puzzle
  final List<String> wl = ['one', 'two', 'three','four','five','six','seven','eight','nine','ten'];

  /*var stateList = [
    [0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0]
  ];

   */
 var stateList;
 int cols = 9;
 int rows = 9;

  // Create the puzzle setting object
  final WSSettings ws = WSSettings(
    width: 10,
    height: 10,
    orientations: List.from([
      WSOrientation.horizontal,
      WSOrientation.vertical,
      WSOrientation.diagonal,
    ]),
  );

  // Create new instance of the WordSearch class
  final WordSearch wordSearch = WordSearch();

  WSNewPuzzle newPuzzle = WSNewPuzzle();

  _WordsearchState()
  {
    stateList = List.generate(rows + 1, (i) => List.filled(cols + 1, 0, growable: false), growable: false);

    wl.shuffle();
    // Create a new puzzle
    newPuzzle = wordSearch.newPuzzle(wl.sublist(0, 5), ws);

    puzzle = newPuzzle.puzzle;



    /*newPuzzle.puzzle.map((val) {
      puzzle.add(val);
    });*/
  }

  Widget _buildGameBody() {
    int gridStateLength = puzzle.length;
    return Column(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1.0,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey, width: 2.0)
              ),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: gridStateLength,
                ),
                itemBuilder: _buildGridItems,
                itemCount: gridStateLength * gridStateLength,
              ),
            ),
          ),
        ]);
  }

  Widget _buildGridItems(BuildContext context, int index) {
    int gridStateLength = puzzle.length;
    int x, y = 0;
    x = (index / gridStateLength).floor();
    y = (index % gridStateLength);
    return GestureDetector(
      //onTap: () => _gridItemTapped(x, y),
      child: GridTile(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.blueGrey, width: 1)
          ),
          child: Center(
            child: _buildGridItem(x, y),
          ),
        ),
      ),
    );
  }

  Widget _buildGridItem(int x, int y) {
    switch (stateList[x][y]) {
      case 1:
        return Container(
          height: 30,
          width: 30,
          color: Colors.blue,
          child: Center(child: Text(puzzle[x][y].toString(), style: TextStyle(color: cardTextColor, fontSize: cardTextFontSize),) ),
        );
        break;

      default:
        return Text(puzzle[x][y].toString(), style: TextStyle(color: cardTextColor, fontSize: cardTextFontSize),);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          _buildGameBody(),

          /*Container(
                  color: Colors.white,
                  height: 400,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...r0.map((val) {

                            return Container(
                              padding: EdgeInsets.all(spacesBetweenCards), //spaces between cards
                              child: Card(
                                  color: cardColor,
                                  shadowColor: cardColorShadow,
                                  //elevation: cardElevation,
                                  child: Padding(
                                      padding: EdgeInsets.all(spacesCharBoard),
                                      child: Text(val, style: TextStyle(color: cardTextColor, fontSize: cardTextFontSize),)
                                  )
                              ),
                            );

                          }).toList(),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...r1.map((val) {

                            return Container(
                              padding: EdgeInsets.all(spacesBetweenCards), //spaces between cards
                              child: Card(
                                  color: cardColor,
                                  shadowColor: cardColorShadow,
                                  //elevation: cardElevation,
                                  child: Padding(
                                      padding: EdgeInsets.all(spacesCharBoard),
                                      child: Text(val, style: TextStyle(color: cardTextColor, fontSize: cardTextFontSize),)
                                  )
                              ),
                            );

                          }).toList(),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...r2.map((val) {

                            return Container(
                              padding: EdgeInsets.all(spacesBetweenCards), //spaces between cards
                              child: Card(
                                  color: cardColor,
                                  shadowColor: cardColorShadow,
                                  //elevation: cardElevation,
                                  child: Padding(
                                      padding: EdgeInsets.all(spacesCharBoard),
                                      child: Text(val, style: TextStyle(color: cardTextColor, fontSize: cardTextFontSize),)
                                  )
                              ),
                            );

                          }).toList(),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...r3.map((val) {

                            return Container(
                              padding: EdgeInsets.all(spacesBetweenCards), //spaces between cards
                              child: Card(
                                  color: cardColor,
                                  shadowColor: cardColorShadow,
                                  //elevation: cardElevation,
                                  child: Padding(
                                      padding: EdgeInsets.all(spacesCharBoard),
                                      child: Text(val, style: TextStyle(color: cardTextColor, fontSize: cardTextFontSize),)
                                  )
                              ),
                            );

                          }).toList(),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...r4.map((val) {

                            return Container(
                              padding: EdgeInsets.all(spacesBetweenCards), //spaces between cards
                              child: Card(
                                  color: cardColor,
                                  shadowColor: cardColorShadow,
                                  //elevation: cardElevation,
                                  child: Padding(
                                      padding: EdgeInsets.all(spacesCharBoard),
                                      child: Text(val, style: TextStyle(color: cardTextColor, fontSize: cardTextFontSize),)
                                  )
                              ),
                            );

                          }).toList(),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...r5.map((val) {

                            return Container(
                              padding: EdgeInsets.all(spacesBetweenCards), //spaces between cards
                              child: Card(
                                  color: cardColor,
                                  shadowColor: cardColorShadow,
                                  //elevation: cardElevation,
                                  child: Padding(
                                      padding: EdgeInsets.all(spacesCharBoard),
                                      child: Text(val, style: TextStyle(color: cardTextColor, fontSize: cardTextFontSize),)
                                  )
                              ),
                            );

                          }).toList(),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...r6.map((val) {

                            return Container(
                              padding: EdgeInsets.all(spacesBetweenCards), //spaces between cards
                              child: Card(
                                  color: cardColor,
                                  shadowColor: cardColorShadow,
                                  //elevation: cardElevation,
                                  child: Padding(
                                      padding: EdgeInsets.all(spacesCharBoard),
                                      child: Text(val, style: TextStyle(color: cardTextColor, fontSize: cardTextFontSize),)
                                  )
                              ),
                            );

                          }).toList(),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...r7.map((val) {

                            return Container(
                              padding: EdgeInsets.all(spacesBetweenCards), //spaces between cards
                              child: Card(
                                  color: cardColor,
                                  shadowColor: cardColorShadow,
                                  //elevation: cardElevation,
                                  child: Padding(
                                      padding: EdgeInsets.all(spacesCharBoard),
                                      child: Text(val, style: TextStyle(color: cardTextColor, fontSize: cardTextFontSize),)
                                  )
                              ),
                            );

                          }).toList(),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...r8.map((val) {

                            return Container(
                              padding: EdgeInsets.all(spacesBetweenCards), //spaces between cards
                              child: Card(
                                  color: cardColor,
                                  shadowColor: cardColorShadow,
                                  //elevation: cardElevation,
                                  child: Padding(
                                      padding: EdgeInsets.all(spacesCharBoard),
                                      child: Text(val, style: TextStyle(color: cardTextColor, fontSize: cardTextFontSize),)
                                  )
                              ),
                            );

                          }).toList(),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...r9.map((val) {

                            return Container(
                              padding: EdgeInsets.all(spacesBetweenCards), //spaces between cards
                              child: Card(
                                  color: cardColor,
                                  shadowColor: cardColorShadow,
                                  //elevation: cardElevation,
                                  child: Padding(
                                      padding: EdgeInsets.all(spacesCharBoard),
                                      child: Text(val, style: TextStyle(color: cardTextColor, fontSize: cardTextFontSize),)
                                  )
                              ),
                            );

                          }).toList(),
                        ],
                      ),

                    ],
                  ),
                ),*/


          /*Container(
                  color: Colors.red,
                  child: Text(result, style: TextStyle(fontSize: cardTextFontSize)),
                ),*/
          /*Container(
                  color: Colors.blue,
                  child: Text(wordOrientation.toString(), style: TextStyle(fontSize: cardTextFontSize)),
                ),*/
          /*Container(
                  color: Colors.green,
                  child: Text(x.toString(), style: TextStyle(fontSize: cardTextFontSize)),
                ),*/
          /*Container(
                  color: Colors.yellowAccent,
                  child: Text(y.toString(), style: TextStyle(fontSize: cardTextFontSize)),
                ),*/
          /*Container(
                  color: Colors.pink,
                  child: Text(checker, style: TextStyle(fontSize: cardTextFontSize)),
                ),*/

          //Inf
          Container(
              padding: EdgeInsets.all(10),
              child: Center(child: Text("Find 5 numbers to win!", style: TextStyle(color: Colors.blueGrey, fontSize: 30, )),)
          ),


          //speech button container
          Container(
            child: FloatingActionButton(
              backgroundColor: Colors.blue,
              onPressed: (){},
              child: Icon(
                Icons.keyboard_voice,
              ),
            ),
          ),

          //Enter text

          Container(
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Enter a word"
                ),
                controller: myController,
              )
          ),

          //Raised Button
          Container(
              child: RaisedButton(
                child: Text("Click"),
                splashColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide (width: 1,color: Colors.white,),
                ),
                color: Colors.blue,
                onPressed: (){
                  setState(() {
                    enteredWord = myController.text;
                    solved = wordSearch.solvePuzzle(newPuzzle.puzzle, [enteredWord]);
                    if(solved.found.length != 0 && wl.contains(enteredWord))
                    {
                      /*setState(() {
                              checker = "You found it ya monkey!";
                            });*/

                      if((solved.found[0].orientation.toString()) == (WSOrientation.horizontal.toString()))
                      {
                        for(int i = (solved.found[0].x) ; i < ( (solved.found[0].x) + (enteredWord.length) ) ; i++)
                        {
                          setState(() {
                            stateList[solved.found[0].y][i] = 1;
                          });
                        }
                        setState(() {
                          winCounter++;
                          if(winCounter==5)
                          {
                            _showMyDialogC();
                          }
                        });
                      }
                      else if((solved.found[0].orientation.toString()) == (WSOrientation.vertical.toString()))
                      {
                        for(int i = (solved.found[0].y) ; i < ( (solved.found[0].y) + (enteredWord.length) ) ; i++)
                        {
                          setState(() {
                            stateList[i][solved.found[0].x] = 1;
                          });
                        }
                        setState(() {
                          winCounter++;
                          if(winCounter==5)
                          {
                            _showMyDialogC();
                          }
                        });
                      }
                      else if((solved.found[0].orientation.toString()) == (WSOrientation.diagonal.toString()))
                      {
                        int temp = solved.found[0].x;
                        for(int i = (solved.found[0].y) ; i < ( (solved.found[0].y) + (enteredWord.length) ) ; i++)
                        {
                          setState(() {
                            stateList[i][temp] = 1;
                          });
                          temp++;
                        }
                        setState(() {
                          winCounter++;
                          if(winCounter==5)
                          {
                            _showMyDialogC();
                          }
                        });
                      }
                    }
                    else
                    {
                      /*setState(() {
                              checker = "Blind?";
                            });*/
                    }
                  });

                  //result = solved.found[0].word;
                  //wordOrientation = solved.found[0].orientation;
                  //x = solved.found[0].x;
                  //y = solved.found[0].y;
                },
              )
          ),


          /*Container(
                  child: Text(stateList.toString()),
                )*/
        ],
      ),
    );
  }
}
