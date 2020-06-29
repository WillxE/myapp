import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:core';
import 'main.dart';
import 'package:flutter/widgets.dart';


final double BOARD_S = 340;
final double PIXEL_S = 20;
int score = 0;
var random = new Random();
double snakex = 300;
double snakey = 300;
double foodx = 80;
double foody = 80;
Timer timer;

void main() {

  runApp(MaterialApp(
    home: BoardState(),
  ));


}



class BoardState extends StatefulWidget {

  @override
  _BoardStateState createState() => _BoardStateState();
}

class _BoardStateState extends State<BoardState> {


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage('assets/Waterfall.jpg'),
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
                  Container(
                    height: PIXEL_S,
                    width: PIXEL_S,
                    color: Colors.black,
                  )
                  ),
                ),
              ],
            ),//main board
            Text('Kill the red target',
              style: TextStyle(
                fontSize: 20,
                color: Colors.red[700],
                fontStyle: FontStyle.normal,
              )),
            SizedBox(height: 10,),
            RaisedButton(
              onPressed: () {
                //UP
                setState((){
                  snakey = snakey + 20;
                  if (foodx == snakex && foody == snakey){
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text('You killed enemy from the bottom'),
                      ),
                    );
                    print('kill');
                  };
                });
              },
              child: Text(' Up ',
                style: TextStyle(
                  fontFamily: 'IndieFlower',
                  fontSize: 50,
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
                      snakex = snakex -20;
                      if (foodx == snakex && foody == snakey){
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: Text('You killed enemy from the right'),
                          ),
                        );
                        print('kill');
                      };
                    });
                  },
                  child: Text('Left',
                    style: TextStyle(
                      fontFamily: 'IndieFlower',
                      fontSize: 50,
                      fontStyle: FontStyle.normal,
                      color: Colors.grey[850],
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    //RIGHT
                    setState(() {
                      snakex = snakex +20;
                      if (foodx == snakex && foody == snakey){
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: Text('You killed enemy from the left'),
                          ),
                        );
                        print('kill');
                      };
                    });
                  },
                  child: Text('Right',
                    style: TextStyle(
                      fontFamily: 'IndieFlower',
                      fontSize: 50,
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
                  snakey = snakey -20;
                  if (foodx == snakex && foody == snakey){
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text('You killed enemy from the top'),
                        ),
                    );
                    print('kill');
                  };
                });
              },
              child: Text('Down',
                style: TextStyle(
                  fontFamily: 'IndieFlower',
                  fontSize: 50,
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
