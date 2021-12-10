import 'package:ChatApp/Animation/animation.dart';
import 'package:ChatApp/Profiles.dart';
import 'package:ChatApp/chat.dart';
import 'package:ChatApp/staticVars.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setNavigationBarColor(Colors.white);
    FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    FlutterStatusbarcolor.setNavigationBarWhiteForeground(false);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);

    staticVars.authc = FirebaseAuth.instance;

    bool islogged = false;
    bool issigned = false;
    bool iscont = false;

    //Signup

    Future ProfileConfirm() async {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog();
          });
    }

    var body = SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.grey.shade300,
        child: Stack(
          children: <Widget>[
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.topLeft,
              child: FadeAnimation(
                1.5,
                Container(
                    margin: EdgeInsets.only(top: 55, left: 0),
                    child: Image.asset(
                      "images/image9.png",
                      fit: BoxFit.fill,
                    )

                    /*Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w800),
                  ),*/
                    ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 260),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
            ),
            Container(
              alignment: Alignment.center,
              //color: Colors.grey.shade100,
              margin: EdgeInsets.only(top: 300),
              child: Column(
                children: <Widget>[
                  FadeAnimation(
                    1.8,
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 30, bottom: 20),
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 35,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                  FadeAnimation(
                    2.2,
                    Container(
                      height: 30,
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 35, top: 0),
                      child: Text(
                        "Username",
                        style: TextStyle(
                            color: Colors.redAccent.shade400,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  FadeAnimation(
                    2.2,
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(35)),
                      height: 60,
                      width: 370,
                      child: TextField(
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                            color: Colors.grey.shade900,
                            fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: BorderSide(
                                  color: Colors.grey.shade200, width: 2.5)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: BorderSide(
                                  color: Colors.grey.shade100, width: 1.5)),
                          hintText: "email or phone number",
                          hintStyle: TextStyle(
                              color: Colors.grey.shade400, fontSize: 15),
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.grey.shade500,
                            size: 27,
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            staticVars.username = value;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  FadeAnimation(
                    2.6,
                    Container(
                      height: 30,
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 35, top: 0),
                      child: Text(
                        "Password",
                        style: TextStyle(
                            color: Colors.redAccent.shade400,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  FadeAnimation(
                    2.6,
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(35)),
                      height: 60,
                      width: 370,
                      child: TextField(
                        obscureText: true,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                            color: Colors.grey.shade900,
                            fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: BorderSide(
                                  color: Colors.grey.shade200, width: 2.5)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: BorderSide(
                                  color: Colors.grey.shade100, width: 1.5)),
                          hintText: "password",
                          hintStyle: TextStyle(
                              color: Colors.grey.shade400, fontSize: 15),
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.grey.shade500,
                            size: 27,
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            staticVars.password = value;
                          });
                        },
                      ),
                    ),
                  ),
                  FadeAnimation(
                    3,
                    Container(
                      //width: 150,
                      //color: Colors.black,
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(right: 25, top: 10, bottom: 10),
                      child: Text("Forgot password?",
                          style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 13,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  FadeAnimation(
                    3.4,
                    Container(
                        //color: Colors.black,
                        margin: EdgeInsets.only(top: 30),
                        height: 50,
                        width: 250,
                        child: FloatingActionButton(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            isExtended: true,
                            //backgroundColor: Colors.black,
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.redAccent.shade400),
                                height: 70,
                                width: 250,
                                //color: Colors.white,
                                child: Center(
                                    child: islogged
                                        ? SpinKitCircle(
                                            size: 25,
                                            color: Colors.white,
                                          )
                                        : Text("Login"))),
                            onPressed: () async {
                              setState(() {
                                islogged = true;
                              });
                              var retrieved, result2, temp;
                              if (staticVars.username != null &&
                                  staticVars.password != null) {
                                try {
                                  result2 = await staticVars.authc
                                      .signInWithEmailAndPassword(
                                          email: staticVars.username,
                                          password: staticVars.password);
                                  print(staticVars.authc.currentUser.uid);
                                  retrieved = await staticVars.fsconnect
                                      .collection("user")
                                      .doc("Profiles")
                                      .collection("${staticVars.username}")
                                      .doc("${staticVars.username}-Profile")
                                      .get();

                                  print(retrieved.data());
                                  temp = retrieved.data();
                                  staticVars.temp1 = temp;

                                  staticVars.mail = temp["Name"];
                                  staticVars.dob = temp["dob"];
                                  staticVars.lastLogin =
                                      "${staticVars.authc.currentUser.metadata.lastSignInTime}";

                                  print(
                                      "LAST LOGIN = ${staticVars.lastLogin.substring(12, 16)}");

                                  await staticVars.fsconnect
                                      .collection("user")
                                      .doc("ids")
                                      .collection("user-ids")
                                      .doc(staticVars.username)
                                      .update({
                                    "lastLogin":
                                        "${staticVars.lastLogin.substring(12, 16)}"
                                  });

                                  print(
                                      "MAIL = ${staticVars.mail} \n DOB = ${staticVars.dob}");

                                  setState(
                                    () {
                                      islogged = false;
                                    },
                                  );
                                } catch (e) {
                                  print(e);
                                  setState(
                                    () {
                                      islogged = false;
                                    },
                                  );
                                }

                                print(result2);
                                if (result2 != null) {
                                  setState(
                                    () {
                                      islogged = false;
                                    },
                                  );
                                  //AppToast("Logged in");
                                  print('logged in');

                                  /*Navigator.push(context, MaterialPageRoute(
                                      builder: (BuildContext context) {
                                    return MyChat();
                                  }));*/

                                  //###########################################################################//
                                  print(
                                      "NAVIGATING..................................................................................");
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    //return Profile();
                                    if (temp["ProfileName"] != null &&
                                        temp["ProfileDOB"] != null) {
                                      FlutterStatusbarcolor.setStatusBarColor(
                                          Colors.white);
                                      FlutterStatusbarcolor
                                          .setNavigationBarColor(Colors.white);
                                      FlutterStatusbarcolor
                                          .setNavigationBarWhiteForeground(
                                              true);
                                      FlutterStatusbarcolor
                                          .setStatusBarWhiteForeground(true);
                                      return ContinueWithTheProfile();
                                    } else
                                      return Profile();
                                  }));

                                  //################################################################//

                                }
                              } else {
                                setState(
                                  () {
                                    islogged = false;
                                  },
                                );
                                //AppToast("No Credentials found");
                              }
                            })),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  FadeAnimation(
                    3.8,
                    Container(
                      child: Center(
                        child: Text(
                          "Don't have an account?",
                          style: TextStyle(color: Colors.grey.shade400),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  FadeAnimation(
                    4.1,
                    Container(
                        child: GestureDetector(
                            child: Center(
                              child: Text(
                                "SIGN UP",
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
                            onTap: () async {
                              FlutterStatusbarcolor.setStatusBarColor(
                                  Colors.lightBlue.shade900);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return SignUp();
                              }));
                            })),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );

    return Scaffold(body: body);
  }
}

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.lightBlue.shade900);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    FlutterStatusbarcolor.setNavigationBarWhiteForeground(false);

    bool issigned = false;

    var signupBody = SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.grey.shade300,
        child: Stack(
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Container(
                color: Colors.lightBlue.shade900,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.topCenter,
                child: FadeAnimation(
                  1.5,
                  Container(
                      height: 270,
                      margin: EdgeInsets.only(top: 1, left: 0),
                      child: Image.asset(
                        "images/image4.jpg",
                        fit: BoxFit.fill,
                      )),
                )
                /*Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w800),
                ),
              ),*/
                ),
            Container(
              margin: EdgeInsets.only(top: 245),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
            ),
            FadeAnimation(
              1.9,
              Container(
                alignment: Alignment.center,
                //color: Colors.grey.shade100,
                margin: EdgeInsets.only(top: 265),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 30, bottom: 20),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    FadeAnimation(
                      2.3,
                      Container(
                        height: 30,
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 35, top: 0),
                        child: Text(
                          "Username",
                          style: TextStyle(
                              color: Colors.lightBlue.shade900,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    FadeAnimation(
                      2.3,
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(35)),
                        height: 60,
                        width: 370,
                        child: TextField(
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35),
                                borderSide: BorderSide(
                                    color: Colors.grey.shade200, width: 2.5)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35),
                                borderSide: BorderSide(
                                    color: Colors.grey.shade100, width: 1.5)),
                            hintText: "email id",
                            hintStyle: TextStyle(
                                color: Colors.grey.shade400, fontSize: 15),
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.grey.shade500,
                              size: 27,
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              staticVars.username1 = value;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    FadeAnimation(
                      2.7,
                      Container(
                        height: 30,
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 35, top: 0),
                        child: Text(
                          "Phone Number",
                          style: TextStyle(
                              color: Colors.lightBlue.shade900,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    FadeAnimation(
                      2.7,
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(35)),
                        height: 60,
                        width: 370,
                        child: TextField(
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35),
                                borderSide: BorderSide(
                                    color: Colors.grey.shade200, width: 2.5)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35),
                                borderSide: BorderSide(
                                    color: Colors.grey.shade100, width: 1.5)),
                            hintText: "phone number",
                            hintStyle: TextStyle(
                                color: Colors.grey.shade400, fontSize: 15),
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.grey.shade500,
                              size: 27,
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              staticVars.mobile = value;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    FadeAnimation(
                      3.1,
                      Container(
                        height: 30,
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 35, top: 0),
                        child: Text(
                          "Password",
                          style: TextStyle(
                              color: Colors.lightBlue.shade900,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    FadeAnimation(
                      3.1,
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(35)),
                        height: 60,
                        width: 370,
                        child: TextField(
                          obscureText: true,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35),
                                borderSide: BorderSide(
                                    color: Colors.grey.shade200, width: 2.5)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35),
                                borderSide: BorderSide(
                                    color: Colors.grey.shade100, width: 1.5)),
                            hintText: "password",
                            hintStyle: TextStyle(
                                color: Colors.grey.shade400, fontSize: 15),
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.grey.shade500,
                              size: 27,
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              staticVars.password1 = value;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    FadeAnimation(
                      3.5,
                      Container(
                          //color: Colors.black,
                          margin: EdgeInsets.only(top: 10),
                          height: 50,
                          width: 250,
                          child: FloatingActionButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              isExtended: true,
                              //backgroundColor: Colors.black,
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.lightBlue.shade900),
                                  height: 70,
                                  width: 250,
                                  //color: Colors.white,
                                  child: Center(
                                      child: issigned
                                          ? SpinKitCircle(
                                              size: 15,
                                              color: Colors.white,
                                            )
                                          : Text("Sign up"))),
                              onPressed: () async {
                                if (staticVars.username1 != null &&
                                    staticVars.password1 != null) {
                                  setState(() {
                                    issigned = true;
                                  });

                                  var result;
                                  try {
                                    result = await staticVars.authc
                                        .createUserWithEmailAndPassword(
                                      email: staticVars.username1,
                                      password: staticVars.password1,
                                    );
                                    print("this is result \n");
                                    print(staticVars.authc.currentUser.uid);
                                    print(staticVars.username1);
                                    print(staticVars.password1);
                                    print(staticVars.mobile);
                                    await staticVars.fsconnect
                                        .collection("user")
                                        .doc("Profiles")
                                        .collection("${staticVars.username1}")
                                        .doc("${staticVars.username1}-Profile")
                                        .set(
                                      {
                                        "Name": staticVars.username1,
                                        "mob": staticVars.mobile,
                                        "password": staticVars.password1,
                                      },
                                    );

                                    await staticVars.fsconnect
                                        .collection("user")
                                        .doc("ids")
                                        .collection("user-ids")
                                        .doc("${staticVars.username1}")
                                        .set({
                                      "id": staticVars.authc.currentUser.uid
                                    }, SetOptions(merge: true));

                                    setState(() {
                                      issigned = false;
                                    });
                                  } catch (e) {
                                    print(e);
                                  }

                                  print("RESULT = $result");
                                  Navigator.pop(context);
                                } else {
                                  setState(() {
                                    issigned = false;
                                  });
                                  //AppToast("No credentials found");
                                }
                              })),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    FadeAnimation(
                      3.9,
                      Container(
                          child: GestureDetector(
                              child: Center(
                                child: Text(
                                  "Back to the login page",
                                  style: TextStyle(
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                              ),
                              onTap: () async {
                                FlutterStatusbarcolor.setNavigationBarColor(
                                    Colors.white);
                                FlutterStatusbarcolor.setStatusBarColor(
                                    Colors.white);
                                FlutterStatusbarcolor
                                    .setNavigationBarWhiteForeground(false);
                                FlutterStatusbarcolor
                                    .setStatusBarWhiteForeground(false);

                                Navigator.pop(context);
                              })),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

    return Scaffold(
      body: signupBody,
    );
  }
}

class ContinueWithTheProfile extends StatefulWidget {
  @override
  _ContinueWithTheProfileState createState() => _ContinueWithTheProfileState();
}

class _ContinueWithTheProfileState extends State<ContinueWithTheProfile> {
  Future imageRetrieve() async {
    var retrieved = await staticVars.fsconnect
        .collection("user")
        .doc("Profiles")
        .collection("${staticVars.username}")
        .doc("${staticVars.username}-Profile")
        .get();

    print(retrieved.data());

    setState(() {
      staticVars.temp1 = retrieved.data();
    });

    //print("RETRIEVED : ${staticVars.temp['ProfilePic']}");
  }

  var iscont = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            margin: EdgeInsets.only(top: 100),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Card(
                elevation: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(
                        1.5,
                        Container(
                          margin:
                              EdgeInsets.only(top: 25, bottom: 55, left: 25),
                          alignment: Alignment.center,
                          child: Center(
                            child: Text(
                              "Continue with the Profile",
                              style: TextStyle(
                                color: Colors.blue.shade900,
                                fontWeight: FontWeight.w900,
                                fontSize: 28,
                              ),
                            ),
                          ),
                        ),
                      ),
                      FadeAnimation(
                        2,
                        Container(
                          alignment: Alignment.center,
                          height: 280,
                          width: 280,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  width: 15, color: Colors.grey.shade300),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      staticVars.temp1["ProfilePic"]),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      FadeAnimation(
                        2.3,
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Center(
                            child: Card(
                              elevation: 3,
                              color: Colors.grey.shade200,
                              child: IconButton(
                                  icon: Icon(
                                    FlutterIcons.pencil_alt_faw5s,
                                    color: Colors.grey.shade900,
                                  ),
                                  onPressed: () async {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return Profile();
                                    }));
                                  }),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      FadeAnimation(
                        2.8,
                        Container(
                          margin: EdgeInsets.only(top: 25, left: 30),
                          alignment: Alignment.center,
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Name  : ",
                                style: TextStyle(
                                    color: Colors.redAccent.shade400,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              Text(
                                "   " + staticVars.temp1["ProfileName"],
                                style: TextStyle(
                                    color: Colors.grey.shade900,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FadeAnimation(
                        3.3,
                        Container(
                          margin: EdgeInsets.only(left: 30),
                          alignment: Alignment.center,
                          child: Row(
                            children: <Widget>[
                              Text(
                                "DOB    : ",
                                style: TextStyle(
                                    color: Colors.redAccent.shade400,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              Text(
                                "   " +
                                    "${staticVars.temp1["ProfileDOB"]}"
                                        .substring(0, 10),
                                style: TextStyle(
                                    color: Colors.grey.shade900,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      FadeAnimation(
                        3.8,
                        Container(
                          margin: EdgeInsets.only(top: 45, bottom: 30),
                          height: 45,
                          width: 350,
                          child: FloatingActionButton(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            isExtended: true,
                            //backgroundColor: Colors.black,
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    //color: Colors.deepPurpleAccent.shade200
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          Colors.redAccent.shade200,
                                          Colors.redAccent.shade700
                                        ])),
                                height: 50,
                                width: 400,
                                //color: Colors.white,
                                child: Center(
                                    child: iscont
                                        ? SpinKitCircle(
                                            size: 25,
                                            color: Colors.white,
                                          )
                                        : Text(
                                            "Continue",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900,
                                                fontSize: 15),
                                          ))),

                            onPressed: () async {
                              setState(() {
                                iscont = true;
                              });

                              /*Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return MyChat();
                        }));*/

                              try {
                                var retrieved = await staticVars.fsconnect
                                    .collection("user")
                                    .doc("Profiles")
                                    .collection("${staticVars.username}")
                                    .doc("${staticVars.username}-Profile")
                                    .get();

                                print(retrieved.data());
                                staticVars.temp = retrieved.data();
                                var temp = staticVars.temp;

                                print(
                                    "#######################################################\n");

                                print(
                                    "####################################################");

                                var r = staticVars.fsconnect
                                    .collection("user")
                                    .doc("ids")
                                    .collection("user-ids");

                                var documents = await r.get();
                                var docLen = documents.docs.length;

                                List<DocumentSnapshot> docs = documents.docs;
                                int k = 0;
                                /*for (var i in docs) {
                              if (i['name'] == staticVars.name) {
                                print(docs[k]['name']);
                                docs.removeAt(k);
                                print("DONE REMOVING");
                                //docLen--;
                                //print("LENGTH REDUCED");
                              }
                              k++;
                              print(k);
                            }*/
                                setState(() {
                                  staticVars.doclen = docLen;
                                  staticVars.docs = docs;
                                });

                                //profile pic

                                //print("IMAGE = ${temp['ProfilePic']}");

                                print("RETRIEVING IMAGE ******************");

                                await imageRetrieve();

                                print("DONE*********************************");

                                setState(() {
                                  iscont = false;
                                });
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return SelectProfile();
                                }));
                              } catch (e) {
                                setState(() {
                                  iscont = false;
                                });
                                print(e);
                              }
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                )),
          ),
        ));
  }
}
