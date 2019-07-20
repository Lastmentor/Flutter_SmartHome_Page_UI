import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final imgPath;

  DetailPage({Key key, this.imgPath}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  bool tempValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          new Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(widget.imgPath), fit: BoxFit.cover)),
          ),
          new Padding(
            padding: EdgeInsets.only(top: 25),
            child: new Row(
              children: <Widget>[
                new IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                Spacer(),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage('images/image.jpg'),
                          fit: BoxFit.cover)),
                ),
                SizedBox(width: 15)
              ],
            ),
          ),
          new Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 340,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Color.fromRGBO(31, 58, 47, 1.0),
              ),
              child: new Column(
                children: <Widget>[
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      listItemStats('images/creative.png',"6 Lights",true),
                      listItemStats('images/air-conditioner.png',"Air Conditioner", false),
                      listItemStats('images/washing-machine.png',"Washing Machine", false)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: Divider(color: Colors.white,)
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: <Widget>[
                        Text("Maximum Power", style: new TextStyle(color: Colors.white),),
                        Spacer(),
                        Text("60W", style: new TextStyle(color: Colors.white),),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: <Widget>[
                        Text("Total Working Hours", style: new TextStyle(color: Colors.white),),
                        Spacer(),
                        Text("145", style: new TextStyle(color: Colors.white),),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: <Widget>[
                        Text("Average Daily Working Hours", style: new TextStyle(color: Colors.white),),
                        Spacer(),
                        Text("5.6", style: new TextStyle(color: Colors.white),),
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                      child: Divider(color: Colors.white,)
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 10),
                    child: Row(
                      children: <Widget>[
                        Text("Day Schedule", style: new TextStyle(color: Colors.white),),
                        Spacer(),
                        Switch(
                          value: tempValue,
                          onChanged: (newVal){
                            setState(() {
                              tempValue = newVal;
                              print(newVal);
                            });
                          },
                          activeColor: Colors.green,
                        )
                      ],
                    ),
                  ),
                ],
              )
            ),
          )
        ],
      ),
    );
  }

  Widget listItemStats(String imgpath, String name, bool value){
    return Container(
      width: 110,
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: value == true ? Colors.white : Color.fromRGBO(75, 97, 88, 1.0)
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Image(image: AssetImage(imgpath),width: 45,height: 45, color: value == true ? Colors.black : Colors.white),
          SizedBox(height: 15),
          Text(name, style: TextStyle(fontSize: 13, color: value == true ? Colors.black : Colors.white)),
          SizedBox(height: 5),
          Switch(
            value: value,
            onChanged: (newVal){
              setState(() {
                value = newVal;
                print(newVal);
              });
            },
            activeColor: Colors.green,
          )
        ],
      ),
    );
  }
}
