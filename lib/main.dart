import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:html';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Parallax",
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double rateZero = 0;
  double rateOne = 0;
  double rateTwo = 0;
  double rateThree = 0;
  double rateFour = 0;
  double rateFive = 0;
  double rateSix = 0;
  double rateSeven = 0;
  double rateEight = 300;
  double rateBlack = 1380;



  String asset="";
  double top=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener(
        onNotification: (v){
          if(v is ScrollUpdateNotification){
            setState((){
              rateBlack -=  v.scrollDelta!/1;
              rateEight -=  v.scrollDelta!/1;
              rateSeven -=  v.scrollDelta!/2;
              rateSix -=  v.scrollDelta!/3;
              rateFive -=  v.scrollDelta!/4;
              rateFour -=  v.scrollDelta!/5;
              rateThree -=  v.scrollDelta!/6;
              rateTwo -=  v.scrollDelta!/7;
              rateOne -=  v.scrollDelta!/8;
              rateZero -=  v.scrollDelta!/9;


            });
          }
          return true;
        },
        child: Stack(
          children: [
            ParallaxWidget(top: rateZero, asset: "parallax0"),
            ParallaxWidget(top: rateOne, asset: "parallax1"),
            ParallaxWidget(top: rateTwo, asset: "parallax2"),
            ParallaxWidget(top: rateThree, asset: "parallax3"),
            ParallaxWidget(top: rateFour, asset: "parallax4"),
            ParallaxWidget(top: rateFive, asset: "parallax5"),
            ParallaxWidget(top: rateSix, asset: "parallax6"),
            ParallaxWidget(top: rateSeven, asset: "parallax7"),
            ParallaxWidget(top: rateEight, asset: "parallax8"),


            ListView(
              children: [
                Container(
                  height: 1080,
                  color: Colors.transparent,
                ),
                Container(
                  color:  Color(0x0ff21002),
                  width: double.infinity,
                  padding:  EdgeInsets.only(top: 70),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:  [
                      Text("Flutter ile",
                        style: TextStyle(fontSize: 30,
                            fontFamily: "Montserrat-ExtraLight",
                            letterSpacing: 1.8,
                            color: Color(0xffffaf00)
                        ),
                      ),
                      Text("Parallax",
                        style: TextStyle(
                            fontSize: 51,
                            fontFamily: "Montserrat-Regular",
                            letterSpacing: 1.8,
                            color: Color(0xffffaf00)
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 190,
                        child: Divider(
                          height: 1,
                          color: Color(0xffffaf00),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Flutter Tasarımcısı",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Montserrat-ExtraLight",
                          letterSpacing: 1.3,
                          color: Color(0xffffaf00),
                        ),),
                      Text("Fatih Mehmet Yüksel",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Montserrat-Regular",
                          letterSpacing: 1.8,
                          color: Color(0xffffaf00),
                        ),),
                      SizedBox(
                        height: 50,
                      ),
                      Container(color: Color(0xff2d0202),
                      width: window.screen?.width?.toDouble(),
                      height: window.screen?.height?.toDouble(),)

                    ],
                  ),
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
}

class ParallaxWidget extends StatelessWidget {
  const ParallaxWidget({
    Key? key,
    required this.top,
    required this.asset,
  }) : super(key: key);

  final double top;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: top,
      child: SizedBox(
        height: window.screen?.height?.toDouble(),
        width: window.screen?.width?.toDouble(),
        child: Image.asset(
          "assets/$asset.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
