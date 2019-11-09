import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: HomePage(),));

class HomePage extends StatelessWidget {

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
    return Scaffold(
body: Column(
  children: <Widget>[
    Stack(
      children: <Widget>[
        Container(
          height: 250,
          color: Color(getColorHexFromStr('#fff5ea')),
        ),
        Column(

          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(15, 35, 15, 10),
              child: Material(

                elevation: 10,
                borderRadius: BorderRadius.circular(25),
                child: TextFormField(

                  decoration: InputDecoration(

                    prefixIcon: Icon(Icons.search,color: Colors.black,),
                    contentPadding: EdgeInsets.only(left: 15,top: 15),
                    hintText: "Search for recipes and channels",
                    hintStyle: TextStyle(color: Colors.grey)

                  ),
                ),
              ),

            ),
            SizedBox(
              height: 15,
            ),

            //Makes the border for only left side
            Padding(padding: EdgeInsets.only(left:15),
            child: Container(
              padding: EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                border: Border(left: BorderSide(
                  color: Colors.orange,
                  style: BorderStyle.solid,
                  width: 3.0
                ))
              ),
              child: Row(
                children: <Widget>[Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('POPULAR RECIPES',style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Timesroman',
                      fontWeight: FontWeight.bold
                    ),),
                    Text('THIS WEEK',style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Timesroman',
                        fontWeight: FontWeight.bold
                    ),)
                  ],
                )],
              ),
            ),),
            Padding(
              padding: EdgeInsets.only(bottom: 15),

            ),
            Container(
              padding: EdgeInsets.only(top: 15,left: 15),
              height: 125,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
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
                              image: AssetImage()
                            )
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ],
    )
  ],
),

    );
  }
}



