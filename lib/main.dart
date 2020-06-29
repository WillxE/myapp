import 'dart:async';
import 'dart:ui';
import 'arena.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {

  runApp(MaterialApp(
    home: NinjaCard(),

  ));


}

class NinjaCard extends StatefulWidget {
  @override

  _NinjaCardState createState() => _NinjaCardState();
}

class _NinjaCardState extends State<NinjaCard> {

String ninjaLevel = '';
String name  =  '';
String weapon = 'BareFist';
String stage = 'Desert';

static String sninjaLevel = '';
static String sname = '';
static String sstage = '';
static String sweapon = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
        resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Taiwanese Ninja ID'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
        setState(() {
          sninjaLevel = ninjaLevel;
          sname  = name;
          sstage  = stage;
          sweapon  = weapon;

              Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BoardState()),
          );


        });
        },

        child: Text('->',
          style: TextStyle(
            fontFamily: 'IndieFlower',
            fontSize: 40,
            fontStyle: FontStyle.normal,
            color: Colors.grey[850],
          ),
        ),


        backgroundColor: Colors.amber,
      ),

      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: <Widget>[
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/zero.jpg'),
              ),
            ),
            Divider(
              height: 40,
              thickness: 1,
              color: Colors.grey,
            ),
            Text(
              'NAME',
              style: TextStyle(
                  letterSpacing: 1,
                  color: Colors.grey
              ),
            ),


            TextField(
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
              onChanged: (String strname){
                name = strname;
                print (name);
              },
              style: TextStyle(
                color: Colors.amber,
                fontSize: 10,
            ),
            ),

            SizedBox(height: 5,),
            Text(
              'PREFERED WEAPON',
              style: TextStyle(
                  letterSpacing: 1,
                  color: Colors.grey
              ),
            ),

            DropdownButton<String>(
              value: weapon,
              onChanged: (String newVal)  {

                setState(() {
                  weapon = newVal;
                });
              },
              items: <String> ['BareFist','Kunai','Tanto','Katana']
                .map<DropdownMenuItem<String>> ((String value){
                  return DropdownMenuItem<String> (
                  value: value,
                  child:  Text(value,
                  style: TextStyle(
                    fontSize: 15,
                    letterSpacing: 1,
                    color: Colors.amber,
                  ),)
                  );
                }).toList()
            ),

            SizedBox(height: 5,),
            Text(
              'NINJA LEVEL',
              style: TextStyle(
                  letterSpacing: 1,
                  color: Colors.grey
              ),
            ),
            SizedBox(height: 5,),

            TextField(
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
              keyboardType: TextInputType.number,
              onChanged: (String strlv){
                ninjaLevel = strlv;
                print (ninjaLevel);
              },
              style: TextStyle(
                color: Colors.amber,
                fontSize: 15,
              ),
            ),
            SizedBox(height: 5,),

            Text(
              'PREFERED STAGE',
              style: TextStyle(
                  letterSpacing: 1,
                  color: Colors.grey
              ),
            ),
            SizedBox(height: 5,),

            DropdownButton<String>(
                value: stage,
                onChanged: (String newVal)  {

                  setState(() {
                    stage = newVal;
                  });
                },
                items: <String> ['Desert','Castle','Jungle','Waterfall']
                    .map<DropdownMenuItem<String>> ((String value){
                  return DropdownMenuItem<String> (
                      value: value,
                      child:  Text(value,
                        style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 1,
                          color: Colors.amber,
                        ),)
                  );
                }).toList()
            ),
            SizedBox(height: 5,),



          ],
        ),
      ),


    );
  }
}

class BoardState extends StatefulWidget {

  @override
  _BoardStateState createState() => _BoardStateState();
}

class _BoardStateState extends State<BoardState> {
  String map = _NinjaCardState.sstage;
  String buki = _NinjaCardState.sweapon;
  String namae = _NinjaCardState.sname;
  String lv = _NinjaCardState.sninjaLevel;

  double hx = 0;
  double hy = 13;
  double rex = 15;
  double rey = 5;
  double lex = 1;
  double ley = 5;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$map.jpg'),
              fit: BoxFit.cover,
            )
        ),
        child: Column(
          children: <Widget>[
            //main board
            SizedBox(height: 30),
            Stack(
              children: <Widget>[
                //area
                Container(
                  height: BOARD_S,
                  width: BOARD_S,
                  color: Colors.black.withOpacity(0.5),
                ),
                Positioned(
                  left: foodx,
                  bottom: foody,

                  child: (
                      Container(
                        height: PIXEL_S,
                        width: PIXEL_S,
                        color: Colors.red,
                      )
                  ),
                ),
                //Snake
                Positioned(
                  left: snakex,
                  bottom: snakey,

                  child: (
                      Stack(
                        children: <Widget>[
                          Container(
                            height: PIXEL_S,
                            width: PIXEL_S,
                            color: Colors.black,
                          ),
                          //HEADBAND
                          Positioned(
                            left: hx,
                            bottom: hy,

                            child: (
                            Container(
                              height: 4,
                              width: 20,
                              color: Colors.red,
                            )
                            ),
                          ),
                          //RIGHT EYE
                          Positioned(
                            left: rex,
                            bottom: rey,

                            child: (
                                Container(
                                  height: 4,
                                  width: 4,
                                  color: Colors.white,
                                )
                            ),
                          ),
                          //LEFT EYE
                          Positioned(
                            left: lex,
                            bottom: ley,

                            child: (
                                Container(
                                  height: 4,
                                  width: 4,
                                  color: Colors.white,
                                )
                            ),
                          ),
                        ],
                      )
                  ),
                ),
              ],
            ),//main board
            SizedBox(height: 5,),
            Text('$namae lv$lv ninja, kill the red enemy with your $buki',
                style: TextStyle(
                  backgroundColor: Colors.red,
                  fontSize: 15,
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                )),
            SizedBox(height: 5,),
            RaisedButton(
              onPressed: () {
                //UP
                setState((){
                  hy = 20;
                  rex = 15;
                  rey = 18;
                  lex = 1;
                  ley = 18;
                  snakey = snakey + 20;
                  if (foodx == snakex && foody == snakey){
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text('You killed enemy from the bottom'),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('Return'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => NinjaCard()),
                              );
                            },
                          ),

                        ],
                      ),
                    );
                    print('kill');
                  };
                });
              },
              child: Text(' Up ',
                style: TextStyle(
                  fontFamily: 'IndieFlower',
                  fontSize: 30,
                  color: Colors.grey[850],
                ),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    //LEFT
                    setState(() {
                      hy = 15;
                      rex = 1;
                      rey = 5;
                      lex = 1;
                      ley = 5;
                      snakex = snakex -20;
                      if (foodx == snakex && foody == snakey){
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: Text('You killed enemy from the right'),
                            actions: <Widget>[
                              FlatButton(
                                child: Text('Return'),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => NinjaCard()),
                                  );
                                },
                              ),

                            ],
                          ),
                        );
                        print('kill');
                      };
                    });
                  },
                  child: Text('Left',
                    style: TextStyle(
                      fontFamily: 'IndieFlower',
                      fontSize: 30,
                      fontStyle: FontStyle.normal,
                      color: Colors.grey[850],
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    //RIGHT
                    setState(() {
                      hy = 15;
                      rex = 15;
                      rey = 5;
                      lex = 15;
                      ley = 5;
                      snakex = snakex +20;
                      if (foodx == snakex && foody == snakey){
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: Text('You killed enemy from the left'),
                            actions: <Widget>[
                              FlatButton(
                                child: Text('Return'),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => NinjaCard()),
                                  );
                                },
                              ),

                            ],
                          ),
                        );
                        print('kill');
                      };
                    });
                  },
                  child: Text('Right',
                    style: TextStyle(
                      fontFamily: 'IndieFlower',
                      fontSize: 30,
                      fontStyle: FontStyle.normal,
                      color: Colors.grey[850],
                    ),
                  ),
                )
              ],
            ),
            RaisedButton(
              onPressed: () {
                //DOWN
                setState(() {
                  hy = 13;
                  rex = 15;
                  rey = 5;
                  lex = 1;
                  ley = 5;

                  snakey = snakey -20;
                  if (foodx == snakex && foody == snakey){
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text('You killed enemy from the top'),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('Return'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => NinjaCard()),
                              );
                            },
                          ),

                        ],
                      ),
                    );
                    print('kill');
                  };
                });
              },
              child: Text('Down',
                style: TextStyle(
                  fontFamily: 'IndieFlower',
                  fontSize: 30,
                  fontStyle: FontStyle.normal,
                  color: Colors.grey[850],
                ),
              ),
            ),

          ],


        ),

      ),
    );
  }
}