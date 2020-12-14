import 'package:JustChat/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    //FlutterStatusbarcolor.setNavigationBarColor(Colors.redAccent.shade400);
    //FlutterStatusbarcolor.setStatusBarColor(Colors.blue.shade900);
    FlutterStatusbarcolor.setNavigationBarColor(Colors.white);
    FlutterStatusbarcolor.setStatusBarColor(Colors.white);

    final Shader gradientText = LinearGradient(
        colors: [Colors.white, Colors.blueAccent.shade400],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        stops: [.3, .5]).createShader(Rect.fromLTWH(50, 60, 200.0, 70.0));

    return Scaffold(
        body: Center(
            child: Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          FadeAnimation(
            1,
            Container(
              margin: EdgeInsets.only(
                  left: 0, top: MediaQuery.of(context).size.height / 4.5),
              child: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Form(
                    child: Container(
                      child: Icon(
                        FlutterIcons.phone_android_mdi,
                        size: 250,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 130,
                    bottom: 140,
                    child: Container(
                      color: Colors.white,
                      height: 130,
                      width: 130,
                      child: Icon(
                        FlutterIcons.chat_mdi,
                        size: 130,
                        color: Colors.grey.shade800,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          FadeAnimation(
            2,
            Container(
              child: Container(
                  margin: EdgeInsets.only(left: 0, top: 25),
                  child: GradientText(
                    "ChatApp",
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        stops: [
                          .55,
                          .5
                        ],
                        colors: [
                          Colors.blue.shade900,
                          Colors.redAccent.shade400
                        ]),
                  )),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 4,
          ),
          SpinKitThreeBounce(
            color: Colors.black,
            size: 25,
          ),
        ],
      ),
    )));

    /*return Scaffold(
        body: Center(
            child: Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
                left: 0, top: MediaQuery.of(context).size.height / 4),
            child: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Form(
                  child: Container(
                    child: Icon(
                      FlutterIcons.phone_android_mdi,
                      size: 200,
                      color: Colors.black,
                    ),
                  ),
                ),
                Positioned(
                  left: 105,
                  bottom: 110,
                  child: Container(
                    color: Colors.white,
                    height: 110,
                    width: 110,
                    child: Icon(
                      FlutterIcons.chat_mdi,
                      size: 110,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Container(
                margin: EdgeInsets.only(left: 0, top: 25),
                child: GradientText(
                  "ChatApp",
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      stops: [.55, .5],
                      colors: [Colors.blue.shade900, Colors.redAccent]),
                )),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 3.5,
          ),
          SpinKitChasingDots(
            size: 25,
            color: Colors.black,
          )
        ],
      ),
    )));*/
  }
}

class GradientText extends StatelessWidget {
  GradientText(
    this.text, {
    @required this.gradient,
  });

  final String text;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        text,
        style: TextStyle(
            // The color must be set to white for this to work
            color: Colors.white,
            fontSize: 50,
            fontWeight: FontWeight.w800),
      ),
    );
  }
}

/*import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setNavigationBarColor(Colors.white);
    FlutterStatusbarcolor.setStatusBarColor(Colors.white);

    final Shader gradientText = LinearGradient(
        colors: [Colors.white, Colors.blueAccent.shade400],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        stops: [.3, .5]).createShader(Rect.fromLTWH(50, 60, 200.0, 70.0));

    return Scaffold(
        body: Center(
            child: Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 150),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 25),
                  child: Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Form(
                        child: Container(
                          child: Icon(
                            FlutterIcons.phone_android_mdi,
                            size: 120,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 65,
                        bottom: 75,
                        child: Container(
                          color: Colors.white,
                          height: 70,
                          width: 70,
                          child: Icon(
                            FlutterIcons.chat_mdi,
                            size: 70,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Container(
                      margin: EdgeInsets.only(left: 15, top: 25),
                      child: GradientText(
                        "justchat",
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            stops: [
                              .45,
                              .5
                            ],
                            colors: [
                              Colors.blue.shade800,
                              Colors.blue.shade400
                            ]),
                      )

                      /*Text(
                      "justchat",
                      style: TextStyle(
                          //color: Colors.blueAccent,
                          fontSize: 50,
                          fontWeight: FontWeight.w500,
                          color: Colors.blueAccent),
                    ),*/
                      ),
                )
              ],
            ),
          )
        ],
      ),
    )));
  }
}

class GradientText extends StatelessWidget {
  GradientText(
    this.text, {
    @required this.gradient,
  });

  final String text;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        text,
        style: TextStyle(
            // The color must be set to white for this to work
            color: Colors.white,
            fontSize: 50,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
*/
