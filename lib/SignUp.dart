import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'Menu.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool login = true;
  List<Widget> buttons = [];
  @override
  void initState() {
    super.initState();
    buttons.add(Positioned(
      left: 90,
      child: MyButton(
        text: 'Sign Up',
        color: Colors.white,
        callBack: callBackSignUp,
      ),
    ));
    buttons.add(Positioned(
      child: MyButton(
          text: "Log in", color: Color(0xff08be06), callBack: callBackLogIn),
    ));
  }

  void callBackLogIn() {
    setState(() {
      login = true;
      buttons.clear();
      buttons.add(Positioned(
        left: 90,
        child: MyButton(
          text: 'Sign Up',
          color: Colors.white,
          callBack: callBackSignUp,
        ),
      ));
      buttons.add(Positioned(
        child: MyButton(
            text: "Log in", color: Color(0xff08be06), callBack: callBackLogIn),
      ));
    });
  }

  void callBackSignUp() {
    setState(() {
      login = false;
      buttons.clear();
      buttons.add(Positioned(
        child: MyButton(
            text: "Log in", color: Colors.white, callBack: callBackLogIn),
      ));
      buttons.add(Positioned(
        left: 90,
        child: MyButton(
            text: "Sign Up",
            color: Color(0xff08be06),
            callBack: callBackSignUp),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff61E002),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/signup.png'), fit: BoxFit.cover)),
          child: Container(
              height: 530,
              width: 330,
              margin: EdgeInsets.only(top: 130),
              padding:
                  EdgeInsets.only(top: 50, left: 60, right: 60, bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
              ),
              child: ListView(children: [
                Stack(
                  children: buttons,
                ),
                SizedBox(height: 10),
                InputField('Enter email or username', false),
                SizedBox(height: 10),
                InputField('Password', true),
                SizedBox(height: 10),
                Visibility(
                    visible: !login,
                    child: InputField('Confirm Password', true)),
                SizedBox(height: !login ? 70 : 40),
                MaterialButton(
                    color: Color(0xff08be06),
                    minWidth: 120,
                    elevation: 5.0,
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(!login ? 'Sign Up' : 'Log In',
                          style: TextStyle(color: Colors.white)),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Menu()));
                    }),
                SizedBox(
                  height: 30,
                ),
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Divider(
                        height: 3,
                        color: Colors.grey,
                        endIndent: 110,
                      ),
                    ),
                    Positioned(
                        top: 5,
                        left: 98,
                        child:
                            Text('Or', style: TextStyle(color: Colors.grey))),
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Divider(
                        height: 3,
                        color: Colors.grey,
                        indent: 110,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FlatButton(
                        minWidth: 20,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        onPressed: () {},
                        child: Image.asset(
                          'images/facebook.png',
                        )),
                    FlatButton(
                        minWidth: 20,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        onPressed: () {},
                        child: Image.asset(
                          'images/gmail.png',
                        )),
                    FlatButton(
                        minWidth: 20,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        onPressed: () {},
                        child: Image.asset(
                          'images/twitter.png',
                        )),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).viewInsets.bottom,
                )
              ])),
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  final String text;
  final bool hide;
  InputField(this.text, this.hide);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        obscureText: hide,
        cursorColor: Color(0xff08be06),
        decoration: InputDecoration(
            suffixIcon:
                hide ? Icon(Icons.remove_red_eye_sharp, size: 15) : null,
            hintText: text,
            hintStyle: TextStyle(color: Colors.grey),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xff08be06), width: 3))),
      ),
      width: 300,
      height: 50,
    );
  }
}

class MyButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function callBack;
  MyButton({this.text, this.color, this.callBack});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
          color: this.color,
          minWidth: 120,
          elevation: 5.0,
          child: Text(text,
              style: TextStyle(
                  color: color == Colors.white
                      ? Color(0xff08BE06)
                      : Colors.white)),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          onPressed: callBack),
    );
  }
}
