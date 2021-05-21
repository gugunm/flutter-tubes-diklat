import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../views/home/home.dart';
import '../../constant/color.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 150),
      color: HexColor(AppColor.biru),
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.center,
      child: new SplashScreen(
          seconds: 3,
          navigateAfterSeconds: new AfterSplash(),
          title: new Text(
            'Mari Sukseskan Vaksinasi \n Covid-19 di Indonesia!',
            textAlign: TextAlign.center,
            style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: HexColor(AppColor.abumuda),
            ),
          ),
          loadingText: Text(
            "© 2021 Kelompok 1",
            style: TextStyle(
              color: HexColor(AppColor.abumuda),
            ),
          ),
          backgroundColor: HexColor(AppColor.biru),
          image: new Image.asset('assets/images/splash.png'),
          styleTextUnderTheLoader: new TextStyle(),
          photoSize: 150.0,
          loaderColor: HexColor(AppColor.birumuda)),
    );
  }
}

class AfterSplash extends StatefulWidget {
  @override
  _AfterSplashState createState() => _AfterSplashState();
}

class _AfterSplashState extends State<AfterSplash> {
  String _username = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: HexColor(AppColor.abumuda),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Icon(
                  Icons.account_circle,
                  size: 80,
                  color: HexColor(AppColor.biru),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    onChanged: (text) {
                      setState(() {
                        _username = text;
                      });
                    },
                    decoration: new InputDecoration(
                      labelText: "Username",
                      // icon: Icon(Icons.people),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    onChanged: (text) {
                      setState(() {
                        _password = text;
                      });
                    },
                    decoration: new InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forget password?",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Home(
                                  username: _username,
                                  password: _password,
                                )),
                      );
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: HexColor(AppColor.biru),
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class AfterSplash extends StatelessWidget {
// String _username = "";
// String _password = "";

// @override
// Widget build(BuildContext context) {
//   return new Scaffold(
//     body: new Center(
//       child: SingleChildScrollView(
//         child: Container(
//           height: MediaQuery.of(context).size.height,
//           color: HexColor(AppColor.abumuda),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               new Icon(
//                 Icons.account_circle,
//                 size: 80,
//                 color: HexColor(AppColor.biru),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 height: 50,
//                 padding: EdgeInsets.symmetric(horizontal: 40),
//                 child: TextFormField(
//                   decoration: new InputDecoration(
//                     labelText: "Username",
//                     // icon: Icon(Icons.people),
//                     border: OutlineInputBorder(
//                         borderRadius: new BorderRadius.circular(25.0)),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Container(
//                 height: 50,
//                 padding: EdgeInsets.symmetric(horizontal: 40),
//                 child: TextFormField(
//                   decoration: new InputDecoration(
//                     labelText: "Password",
//                     border: OutlineInputBorder(
//                       borderRadius: new BorderRadius.circular(25.0),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 50),
//                 alignment: Alignment.centerRight,
//                 child: Text(
//                   "Forget password?",
//                   style: TextStyle(fontSize: 12),
//                 ),
//               ),
//               SizedBox(
//                 height: 80,
//               ),
//               Container(
//                 height: 50,
//                 width: double.infinity,
//                 alignment: Alignment.center,
//                 margin: EdgeInsets.symmetric(horizontal: 40),
//                 child: GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => Home()),
//                     );
//                   },
//                   child: Text(
//                     'Login',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//                 decoration: BoxDecoration(
//                     color: HexColor(AppColor.biru),
//                     borderRadius: BorderRadius.all(Radius.circular(25))),
//               )
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }
// }
