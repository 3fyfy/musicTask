import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:musictask/UI/home.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), ()=>Navigator.of(context).pushReplacement((MaterialPageRoute(builder: (context)=>Home()))));
  }
  @override
  Widget build(BuildContext context) {
   double width= MediaQuery.of(context).size.width;
   double height= MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
          color: Colors.black26,

          image: DecorationImage(image: AssetImage("assets/logo.jpg"),fit: BoxFit.cover)
      ),
//      child: Center(
//        child: Image.asset("assets/logo.jpg",fit: BoxFit.contain,width: width*.7,height:height*.7),
//      ),
    );
  }
}
