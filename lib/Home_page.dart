import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lapp/Bproduct.dart';
import 'package:lapp/Login_page.dart';
import 'package:lapp/Product.dart';
import 'package:lapp/api%20&%20bloc/api_controller.dart';
import 'package:lapp/users_Page.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';
import 'models/userInfo.dart';
import 'models/login.dart';

// Future<void> main() async {
//   await SystemChrome.setPreferredOrientations(
//     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
//   );
//   await SystemChrome.setPreferredOrientations(
//     [],
//   );
//   runApp(
//     MaterialApp(
//       home: HomePage(),
//     ),
//   );
// }

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Userinfo? data = Userinfo();
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
        .then((_) {});
    _getUserData();
  }

  _getUserData() async {
    data = await ApiManager.getUserData();
    setState(() {});
  }

  void Product() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BorluulagchProduct(
          userName: "${data?.result?.lastName}",
        ),
      ),
    );
  }

  void _Users() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserPage(
          userName: data?.result?.lastName,
        ),
      ),
    );
  }

  void _LogOut() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  void _Product() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProductPage(
                  userName: data?.result?.lastName,
                )));
  }

  @override
  Widget build(BuildContext context) {
    Future<void> main() async {
      await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
      );
      await SystemChrome.setPreferredOrientations(
        [],
      );
      runApp(
        MaterialApp(
          home: HomePage(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        // leading: Padding(
        //     padding: const EdgeInsets.only(top: 28.0, left: 8),
        //     child: Text(
        //       data?.result?.firstName ?? '',
        //       style: const TextStyle(
        //         backgroundColor: Color.fromARGB(255, 253, 255, 217),
        //         color: Colors.black,
        //         fontSize: 26,
        //         fontWeight: FontWeight.bold,
        //       ),
        //     )),

        title: Text(
          data?.result?.lastName ?? '',
          style: const TextStyle(
            backgroundColor: Color.fromARGB(255, 253, 255, 217),
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        toolbarHeight: 90,
        backgroundColor: Color.fromARGB(255, 253, 255, 217),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 28.0, right: 9),
            child: Text(
              'БОРЛУУЛАГЧ',
              style: TextStyle(
                backgroundColor: Color.fromARGB(255, 253, 255, 217),
                color: Color.fromARGB(255, 11, 115, 117),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/back1.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 168.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 80.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: 157,
                                width: 173,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.white),
                                    foregroundColor: MaterialStateProperty.all(
                                      Color(0xffED5E92),
                                    ),
                                  ),
                                  onPressed: _Product,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      FaIcon(
                                        FontAwesomeIcons.shoppingCart,
                                        size: 110,
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        "Захиалга",
                                        style: TextStyle(
                                          backgroundColor: Colors.white,
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // SizedBox(
                              //   width: 20,
                              // ),
                              SizedBox(
                                height: 157,
                                width: 173,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.white),
                                    foregroundColor: MaterialStateProperty.all(
                                      Color(0xff9BF862),
                                    ),
                                  ),
                                  onPressed: _Users,
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.person,
                                        size: 120,
                                      ),
                                      Text(
                                        "Хэрэглэгчид",
                                        style: TextStyle(
                                          backgroundColor: Colors.white,
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 157,
                              width: 173,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  foregroundColor: MaterialStateProperty.all(
                                    Color(0xffD9D5F7),
                                  ),
                                ),
                                onPressed: Product,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    FaIcon(
                                      FontAwesomeIcons.eyeDropper,
                                      size: 100,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Захиалга харах",
                                      style: TextStyle(
                                        backgroundColor: Colors.white,
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 157,
                              width: 173,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.white),
                                    foregroundColor: MaterialStateProperty.all(
                                        Color(0xffB8D9EC))),
                                onPressed: _LogOut,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    FaIcon(
                                      FontAwesomeIcons.usersCog,
                                      size: 110,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Гарах",
                                      style: TextStyle(
                                        backgroundColor: Colors.white,
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
