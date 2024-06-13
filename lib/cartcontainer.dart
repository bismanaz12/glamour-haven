import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

class CartContainer extends StatefulWidget {
  CartContainer(
      {super.key,
      required this.img,
      required this.txt,
      required this.quantity,
      required this.value,
      required this.price
      // required this.data,
      });
  String txt;
  // List<String> data;
  double quantity;
  String img;
  bool value;
  double price;

  @override
  State<CartContainer> createState() => _CartContainerState();
  // remove(String cart) async {
  //   List<dynamic> allItems = data!.map((item) => jsonDecode(item)).toList();
  //   allItems.removeWhere((element) => element['Id'] == cart);
  //   log('remove ${allItems}');
  // }
}

class _CartContainerState extends State<CartContainer> {
  @override
  Widget build(BuildContext context) {
    // remove(String cart) async {
    //   List<dynamic> allItems =
    //       widget.data!.map((item) => jsonDecode(item)).toList();
    //   allItems.removeWhere((element) => element['Id'] == cart);
    //   log('remove ${allItems}');
    // }

    return InkWell(
      onDoubleTap: () {
        setState(() {
          if (widget.value == false) {
            widget.value = true;
          } else {
            widget.value = false;
          }
        });
      },
      child: widget.value
          ? Stack(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 130,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromARGB(142, 100, 97, 97).withOpacity(0.1),
                            Color.fromARGB(255, 8, 1, 1).withOpacity(0.3)
                          ])),
                  child: Row(children: [
                    //  Padding(
                    //    padding: const EdgeInsets.only(top:5),
                    //    child: Align(
                    //     alignment: Alignment.topCenter,
                    //      child: Container(
                    //       height: 30,
                    //       decoration: BoxDecoration(color: Colors.black,
                    //       shape: BoxShape.circle
                    //       ),
                    //       child:  Checkbox(
                    //      fillColor: MaterialStateProperty.all(Colors.transparent),

                    //         checkColor: Colors.white,
                    //         value: value, onChanged:(value){
                    //         value = value;
                    //       }

                    //       ),

                    //      ),
                    //    ),
                    //  ),
                    Container(
                        height: 130,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 15, 13, 13),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Image.network(
                          widget.img,
                          fit: BoxFit.cover,
                        )),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 25),
                        child: Column(
                          children: [
                            Text(
                              widget.txt,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 231, 224, 224),
                                  fontFamily: 'Newly',
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 13.0, right: 5),
                          child: Container(
                              alignment: Alignment.centerRight,
                              height: 60,
                              child: Row(
                                children: [
                                  IconButton(
                                      style: ButtonStyle(
                                          fixedSize: MaterialStatePropertyAll(
                                            Size(40, 40),
                                          ),
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  const Color.fromARGB(
                                                      255, 31, 30, 30))),
                                      onPressed: () {},
                                      icon: Center(
                                          child: Icon(
                                        Icons.exposure_minus_1_sharp,
                                        color: Colors.white,
                                      ))),
                                  Text(
                                    '',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 231, 224, 224),
                                        fontFamily: 'Newly',
                                        fontSize: 25),
                                  ),
                                  IconButton(
                                      style: ButtonStyle(
                                          fixedSize: MaterialStatePropertyAll(
                                            Size(40, 40),
                                          ),
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  const Color.fromARGB(
                                                      255, 31, 30, 30))),
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.plus_one,
                                        color: Colors.white,
                                      )),
                                ],
                              )),
                        ),
                      ],
                    )
                  ]),
                ),
              ),
              Positioned(
                left: -10,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 35,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 234, 226, 226),
                        shape: BoxShape.circle),
                    child: Checkbox(
                        fillColor:
                            MaterialStateProperty.all(Colors.transparent),
                        checkColor: Colors.black,
                        value: widget.value,
                        onChanged: (value) {
                          value = value;
                        }),
                  ),
                ),
              ),
            ])
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 130,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(142, 100, 97, 97).withOpacity(0.1),
                          Color.fromARGB(255, 8, 1, 1).withOpacity(0.3)
                        ])),
                child: Row(children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                        height: 130,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 15, 13, 13),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Image.network(
                          widget.img,
                          fit: BoxFit.cover,
                        )),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 25),
                      child: Column(
                        children: [
                          Text(
                            widget.txt,
                            style: TextStyle(
                                color: Color.fromARGB(255, 231, 224, 224),
                                fontFamily: 'Newly',
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 13.0, right: 5),
                        child: Container(
                            alignment: Alignment.centerRight,
                            height: 60,
                            child: Row(
                              children: [
                                IconButton(
                                    style: ButtonStyle(
                                        fixedSize: MaterialStatePropertyAll(
                                          Size(40, 40),
                                        ),
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                const Color.fromARGB(
                                                    255, 31, 30, 30))),
                                    onPressed: () {},
                                    icon: Center(
                                        child: Icon(
                                      Icons.exposure_minus_1_sharp,
                                      color: Colors.white,
                                    ))),
                                Text(
                                  '${widget.quantity}',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 231, 224, 224),
                                      fontFamily: 'Newly',
                                      fontSize: 25),
                                ),
                                IconButton(
                                    style: ButtonStyle(
                                        fixedSize: MaterialStatePropertyAll(
                                          Size(40, 40),
                                        ),
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                const Color.fromARGB(
                                                    255, 31, 30, 30))),
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.plus_one,
                                      color: Colors.white,
                                    )),
                              ],
                            )),
                      ),
                    ],
                  )
                ]),
              ),
            ),
    );
  }
}
