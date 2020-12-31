import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Description extends StatefulWidget {
  @override
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  int quantities = 0;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        accentColor: Color(0xff08be06),
      ),
      child: Scaffold(
          resizeToAvoidBottomPadding: false,
          resizeToAvoidBottomInset: false,
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.shopping_cart, color: Colors.white),
          ),
          backgroundColor: Color(0xfff5efef),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Color(0xff08be06),
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
          ),
          drawer: Drawer(
              child: ListView(
            children: [
              DrawerHeader(
                child: Text('do you want to go back?'),
                decoration: BoxDecoration(color: Colors.indigoAccent),
              ),
              ListTile(
                title: Text('home'),
              ),
              ListTile(title: Text('my cart'))
            ],
          )),
          body: Stack(
            children: [
              Positioned(
                  height: MediaQuery.of(context).size.height / 2,
                  child: Container(
                    color: Color(0xff08be06),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Image.asset(
                          'images/bigApple.png',
                          scale: 0.7,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Apple',
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  SmoothStarRating(
                                    color: Color(0xffffc48c),
                                    borderColor: Color(0xffffc48c),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Birr 30 (kg)',
                                    style: TextStyle(
                                        fontSize: 22, color: Colors.white),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  MyButton(
                                    iconData: FontAwesomeIcons.minus,
                                    callBack: () {
                                      if (quantities > 0) {
                                        setState(() {
                                          quantities--;
                                        });
                                      }
                                    },
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    color: Colors.white,
                                    height: 45,
                                    width: 60,
                                    child: Text('$quantities',
                                        style: TextStyle(
                                          fontSize: 22,
                                        )),
                                  ),
                                  MyButton(
                                    iconData: FontAwesomeIcons.plus,
                                    callBack: () {
                                      setState(() {
                                        quantities++;
                                      });
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
              Positioned(
                  top: 235,
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Container(
                      height: 300,
                      width: 325,
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(30),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 30, horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Description',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 20),
                              Text(
                                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. '
                                'Lorem Ipsum has been the industry\'s '
                                'standard dummy text ever since the 1500s, when an unknownprinter took a galley of type and scrambled it to make '
                                'atype specimen book. It has survived not only five centuries,but also the leap i'
                                'nto electronic typesetting,remaining essentially unchanged',
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(height: 25),
                              Align(
                                alignment: Alignment.center,
                                child: RaisedButton(
                                    padding: EdgeInsets.all(12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    onPressed: () {},
                                    color: Color(0xff08be06),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(right: 8),
                                          child: Icon(Icons.shopping_cart,
                                              color: Colors.white),
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  right: BorderSide(
                                                      color: Colors.white,
                                                      width: 2))),
                                        ),
                                        SizedBox(width: 8),
                                        Text('Add to Cart',
                                            style:
                                                TextStyle(color: Colors.white))
                                      ],
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ))
            ],
          )),
    );
  }
}

class MyButton extends StatelessWidget {
  final iconData;
  final Function callBack;
  MyButton({this.iconData, this.callBack});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: EdgeInsets.zero,
      minWidth: 50,
      height: 45,
      color: Colors.white,
      onPressed: callBack,
      child: Icon(iconData),
      shape: CircleBorder(),
    );
  }
}
