import 'dart:async';
import 'dart:ui';


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

  int ninjaLevel = 0;
  String name  =  '';
  String weapon = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Snake Ninja ID'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {ninjaLevel += 1;
          setState(() {
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
              height: 60,
              color: Colors.grey,
            ),
            Text(
              'NAME',
              style: TextStyle(
                letterSpacing: 1,
                color: Colors.grey
              ),
            ),
            SizedBox(height: 10,),

            Text(
              'WillxE',
              style: TextStyle(
                  fontSize: 30,
                  letterSpacing: 1,
                  color: Colors.amber,
              ),
            ),
            SizedBox(height: 20,),
            Text(
              'CURRENT NINJA LEVEL',
              style: TextStyle(
                  letterSpacing: 1,
                  color: Colors.grey
              ),
            ),
            SizedBox(height: 10,),

            Text(
              '$ninjaLevel',
              style: TextStyle(
                fontSize: 30,
                letterSpacing: 1,
                color: Colors.amber,
              ),
            ),
            SizedBox(height: 20,),
            Text(
              'PREFERED WEAPON',
              style: TextStyle(
                  letterSpacing: 1,
                  color: Colors.grey
              ),
            ),
            SizedBox(height: 10,),

            Text(
              'Silenced Pistol',
              style: TextStyle(
                fontSize: 30,
                letterSpacing: 1,
                color: Colors.amber,
              ),
            ),
            SizedBox(height: 20,),
            Text(
              'Signature',
              style: TextStyle(
                  letterSpacing: 1,
                  color: Colors.grey
              ),
            ),
            SizedBox(height: 10,),

            Text(
              'WillxE',
              style: TextStyle(
                fontFamily: 'IndieFlower',
                fontSize: 40,
                letterSpacing: 1,
                color: Colors.amber,
              ),
            ),
            SizedBox(height: 20,),
            Row(
              children: <Widget>[
                Icon(
                  Icons.email,
                  color: Colors.grey,
                ),
                SizedBox(width: 5,),
                Text(
                  'laylax_pss10@hotmail.com',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),


          ],
        ),
      ),


    );
  }
}

