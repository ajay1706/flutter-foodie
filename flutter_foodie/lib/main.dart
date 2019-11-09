import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: HomePage(),debugShowCheckedModeBanner: false,));

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);




  //Takes the hexcode and return the integrer value.
  int getColorHexFromStr(String colorStr) {
    colorStr = "FF" + colorStr;
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw new FormatException("An error occurred when converting a color");
      }
    }
    return val;
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Food Recipe",style: TextStyle(fontFamily: 'Timesroman',color: Colors.black,fontWeight: FontWeight.bold),),
        backgroundColor: Color(getColorHexFromStr('##ffc584')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 250.0,
                  color: Color(getColorHexFromStr('#ffddb8')),
                ),
                Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 35.0, 15.0, 10.0),
                      child: Material(
                        elevation: 10.0,
                        borderRadius: BorderRadius.circular(25.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.search, color: Colors.black),
                              contentPadding:
                              EdgeInsets.only(left: 15.0, top: 15.0),
                              hintText: 'Search for recipes and channels',
                              hintStyle: TextStyle(color: Colors.grey)),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Container(
                        padding: EdgeInsets.only(left: 10.0),
                        decoration: BoxDecoration(
                            border: Border(
                                left: BorderSide(
                                    color: Colors.orange,
                                    style: BorderStyle.solid,
                                    width: 3.0))),
                        child: Row(
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('POPULAR RECIPES',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontFamily: 'Timesroman',
                                        fontWeight: FontWeight.bold)),
                                Text('THIS WEEK',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontFamily: 'Timesroman',
                                        fontWeight: FontWeight.bold)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 15.0),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 15.0, left: 15.0),
                      height: 125.0,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          FoodCard('assets/balanced.jpg'),
                          SizedBox(width: 10.0),
                          FoodCard('assets/pasta.jpg'),
                          SizedBox(width: 10.0),
                          FoodCard('assets/sandwich.jpg'),
                          SizedBox(width: 10.0),
                          FoodCard('assets/food.jpg'),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 15.0),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                'September 7',
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    color: Colors.grey,
                    fontSize: 14.0
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                'TODAY',
                style: TextStyle(
                    fontFamily: 'Timesroman',
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Container(
                    height: 275.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(image: AssetImage('assets/breakfast.jpg'), fit: BoxFit.cover)
                    ),

                  ),
                ),
                Container(
                    padding: EdgeInsets.only(top: 20.0, left: 20.0),
                    child: Column(
                      children: <Widget>[
                        Text('BEST OF',
                          style: TextStyle(
                              fontFamily: 'Timesroman',
                              fontSize: 25.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Text('THE DAY',
                          style: TextStyle(
                              fontFamily: 'Timesroman',
                              fontSize: 25.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          height: 3.0,
                          width: 50.0,
                          color: Colors.orange,
                        )
                      ],
                    )
                )
              ],
            ),
            SizedBox(height: 10.0),
            Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Container(
                    height: 275.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(image: AssetImage('assets/breakfast.jpg'), fit: BoxFit.cover)
                    ),

                  ),
                ),
                Container(
                    padding: EdgeInsets.only(top: 20.0, left: 20.0),
                    child: Column(
                      children: <Widget>[
                        Text('BEST OF',
                          style: TextStyle(
                              fontFamily: 'Timesroman',
                              fontSize: 25.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Text('THE DAY',
                          style: TextStyle(
                              fontFamily: 'Timesroman',
                              fontSize: 25.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          height: 3.0,
                          width: 50.0,
                          color: Colors.orange,
                        )
                      ],
                    )
                )
              ],
            )

          ],
        ),
      ),
    );
  }}

// ignore: must_be_immutable
class FoodCard extends StatelessWidget {
  final String img;

  FoodCard(this.img);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      width: 250,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white
      ),
      child: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(img),

              ),

            ),
            height: 125,
            width: 100,
          ),
          SizedBox(
            width: 20,

          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Grilled Chicken", style: TextStyle(
                  fontFamily: 'Quicksand'
              ),),
              Text("with Fruit Salad", style: TextStyle(
                  fontFamily: 'Quicksand'
              ),),
              SizedBox(height: 10,),
              Container(
                height: 2,
                width: 75,
                color: Colors.orange,

              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.5),
                      image: DecorationImage(
                          image: AssetImage('assets/chris.jpg')),


                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("James Oliver", style: TextStyle(
                      fontFamily: 'Quicksand'
                  ),)
                ],
              )
            ],
          )
        ],
      ),
    );
  }


}

