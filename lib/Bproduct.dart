import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lapp/Home_page.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BorluulagchProduct extends StatefulWidget {
  final String userName;
  BorluulagchProduct({
    Key? key,
    this.userName = '',
  }) : super(key: key);

  @override
  State<BorluulagchProduct> createState() => _BorluulagchProductState();
}

class _BorluulagchProductState extends State<BorluulagchProduct> {
  DateTime dateTime = DateTime.now();

  void _onsar() {
    final date = showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(1800),
      lastDate: DateTime(2200),
    );
  }

  void _onBackButton() {
    Navigator.pop(context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]).then((_) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 78.0),
                child: Text(
                  widget.userName,
                  style: TextStyle(
                    backgroundColor: Color.fromARGB(255, 253, 255, 217),
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        leading: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(
              Color.fromARGB(255, 253, 255, 217),
            ),
            elevation: MaterialStatePropertyAll<double>(0),
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          child: FaIcon(
            FontAwesomeIcons.arrowLeft,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 90,
        backgroundColor: Color.fromARGB(255, 253, 255, 217),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'images/back1.jpg',
            ),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 408.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 288.0),
                    child: Text(
                      "???? ??????",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 128.0,
                      top: 10,
                      left: 10,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: ElevatedButton(onPressed: _onsar, child: Text('$dateTime')),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          columns: <DataColumn>[
                            DataColumn(
                              label: Text(
                                "??.??????????",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                "??.??????",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                "??/????????????",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                "??.??????",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                "??.????????????",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                "??.??????",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                "??.????????",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                "??.????????",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                          rows: <DataRow>[
                            DataRow(
                              cells: [
                                DataCell(
                                  Text("??????????"),
                                ),
                                DataCell(
                                  Text("??????"),
                                ),
                                DataCell(
                                  Text("12"),
                                ),
                                DataCell(
                                  Text("120000???"),
                                ),
                                DataCell(
                                  Text("89111145"),
                                ),
                                DataCell(
                                  Text("??????"),
                                ),
                                DataCell(
                                  Text("Bat123@gmail.com"),
                                ),
                                DataCell(
                                  Text("?????? 26 ?????????? ??????????????"),
                                ),
                              ],
                            ),
                          ]),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(5.0),
                  //   child: Container(
                  //     padding: EdgeInsets.all(5),
                  //     decoration: BoxDecoration(
                  //         color: Colors.white,
                  //         border: Border.all(color: Colors.white),
                  //         borderRadius: BorderRadius.circular(20)),
                  //     child: ElevatedButton(
                  //       style: ButtonStyle(
                  //         backgroundColor: MaterialStateProperty.all<Color>(
                  //             Colors.white),
                  //         foregroundColor: MaterialStateProperty.all<Color>(
                  //             Colors.black),
                  //         elevation: MaterialStateProperty.all<double>(0),
                  //       ),
                  //       onPressed: _onBackButton,
                  //       child: Text(
                  //         "??????????",
                  //         style: TextStyle(
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    Future<DateTime?> pickDate() => showDatePicker(
          context: context,
          initialDate: dateTime,
          firstDate: DateTime(1800),
          lastDate: DateTime(2200),
        );
  }
}
