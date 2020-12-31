import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:dot_pagination_swiper/dot_pagination_swiper.dart';
import 'Description.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: Color(0xff08be06),
        accentColor: Color(0xff08be06),
      ),
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Description()));
              },
              child: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              )),
          resizeToAvoidBottomPadding: false,
          backgroundColor: Color(0xfff5efef),
          appBar: AppBar(
            backgroundColor: Color(0xfff5efef),
            elevation: 0,
            iconTheme: IconThemeData().copyWith(color: Color(0xff08be06)),
          ),
          drawer: Drawer(
            child: ListView(
              children: [
                DrawerHeader(
                  child: Text('What do you want to have?'),
                  decoration: BoxDecoration(
                    color: Color(0xff08be06),
                  ),
                ),
                ListTile(
                  title: Text('Home'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Menu'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Shop', style: TextStyle(fontSize: 20)),
              SizedBox(height: 10),
              Text('Farm Products',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                    child: TextField(
                      cursorColor: Color(0xff08be06),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 0, left: 10),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff08be06),
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          hintText: 'Search for Products',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          suffixIcon: Container(
                            margin: EdgeInsets.symmetric(vertical: 7),
                            decoration: BoxDecoration(
                                border: Border(
                                    left: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ))),
                            child: Icon(Icons.search, color: Color(0xff08be06)),
                          )),
                    ),
                    height: 50,
                    width: 300),
              ),
              SizedBox(height: 10),
              Text('Categories',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ChoiceBox(
                      title: 'Fruits',
                      imageSrc: 'images/fruit.png',
                    ),
                    SizedBox(width: 20),
                    ChoiceBox(
                      title: 'Vegetables',
                      imageSrc: 'images/vegetables.png',
                    ),
                    SizedBox(width: 20),
                    ChoiceBox(
                      title: 'Cereals',
                      imageSrc: 'images/corn.png',
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Fruits',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 190,
                child: DotPaginationSwiper(
                  children: [
                    Item(
                      title: 'Apple',
                      imageSrc: 'images/apple.png',
                      price: 30.0,
                    ),
                    Item(
                        title: 'Banana',
                        imageSrc: 'images/banana.png',
                        price: 25.0),
                  ],
                ),
              )
            ]),
          )),
    );
  }
}

class ChoiceBox extends StatelessWidget {
  final String imageSrc;
  final String title;
  ChoiceBox({this.title, this.imageSrc});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(imageSrc),
          SizedBox(height: 10),
          Text(title, style: TextStyle(fontSize: 18)),
        ],
      ),
      width: 120,
      alignment: Alignment.center,
    );
  }
}

class Item extends StatelessWidget {
  final String imageSrc;
  final String title;
  final double price;
  Item({this.title, this.imageSrc, this.price});
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {},
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: EdgeInsets.zero,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 5,
            ),
            Image.asset(imageSrc),
            SizedBox(height: 10),
            Text(title, style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            SmoothStarRating(
              color: Color(0xffffc48c),
              borderColor: Color(0xffffc48c),
            ),
            SizedBox(
              height: 10,
            ),
            Text('Birr $price (Kg)',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(
              height: 20,
            )
          ],
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
