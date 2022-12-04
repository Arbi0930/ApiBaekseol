import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lapp/Home_page.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';

class ProductPage extends StatefulWidget {
  final String? userName;

  ProductPage({
    Key? key,
    this.userName,
  }) : super(key: key);
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    super.initState();
  }

  final _Formkey1 = GlobalKey<FormState>();
  void _successButton() {
    if (_Formkey1.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Амжилттай захиалга өглөө"),
        ),
      );
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
    }
    ;
  }

  void _BackButton() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 22.0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 78.0),
                    child: Text(
                      "${widget.userName}",
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
            image: AssetImage('images/back1.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Form(
                key: _Formkey1,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          "Захиалга",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            padding: EdgeInsets.only(left: 16),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white, width: 1), color: Colors.white, borderRadius: BorderRadius.circular(20)),
                            child: DropdownButtonFormField(
                              validator: (value) {
                                if (value == null || value.toString().isEmpty) {
                                  return "Хоосон байж болохгүй";
                                }
                                return null;
                              },
                              icon: Icon(
                                Icons.arrow_drop_down,
                                size: 35,
                                color: Colors.black,
                              ),
                              dropdownColor: Colors.white,
                              isExpanded: true,
                              style: TextStyle(color: Colors.black, fontSize: 16),
                              hint: Text("Бүтээгдэхүүний бренд"),
                              items: [
                                DropdownMenuItem(
                                  value: "1",
                                  child: Text("  бренд 1"),
                                ),
                                DropdownMenuItem(
                                  value: "2",
                                  child: Text("Бараа бренд 1"),
                                ),
                              ],
                              onChanged: (value) {},
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            padding: EdgeInsets.only(left: 16, right: 16),
                            decoration:
                                BoxDecoration(color: Colors.white, border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(20)),
                            child: DropdownButtonFormField(
                              validator: (value) {
                                if (value == null || value.toString().isEmpty) {
                                  return "Хоосон байж болохгүй";
                                }
                                return null;
                              },
                              hint: Text("Бүтээгдэхүүний нэр"),
                              icon: Icon(
                                Icons.arrow_drop_down,
                                size: 35,
                              ),
                              dropdownColor: Colors.white,
                              isExpanded: true,
                              style: TextStyle(color: Colors.black, fontSize: 16),
                              items: [
                                DropdownMenuItem(
                                  value: "1",
                                  child: Text("Бараа1"),
                                ),
                                DropdownMenuItem(
                                  value: "2",
                                  child: Text("Баоаа-"),
                                ),
                              ],
                              onChanged: (value) {},
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          padding: EdgeInsets.only(left: 16, right: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Бүтээгдэхүүний тоо ширхэг хоосон байна";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              label: Text("Бүтээгдэхүүний тоо ширхэг"),
                              labelStyle: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          padding: EdgeInsets.only(left: 16, right: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Захиалагчийн нэр хоосон байна";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              label: Text("Захиалагчийн нэр"),
                              labelStyle: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          padding: EdgeInsets.only(left: 16, right: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Захиалагчийн утасны дугаар хоосон байна";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              label: Text("Захиалагчийн утасны дугаар"),
                              labelStyle: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            onEditingComplete: () {},
                            keyboardType: TextInputType.phone,
                            maxLength: 8,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          padding: EdgeInsets.only(left: 16, right: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Захиалагчийн гэрийн хаяг хоосон байна";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              label: Text("Захиалагчийн гэрийн хаяг"),
                              labelStyle: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 182,
                        height: 51,
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration:
                              BoxDecoration(color: Colors.white, border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(20)),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all<double>(0),
                              backgroundColor: MaterialStateProperty.all(Colors.white),
                              foregroundColor: MaterialStateProperty.all(Colors.black),
                            ),
                            onPressed: _successButton,
                            child: Text(
                              "Захиалах",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
