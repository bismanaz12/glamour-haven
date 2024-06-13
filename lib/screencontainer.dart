import 'dart:developer';

import 'package:beauty_app/cart.dart';
import 'package:beauty_app/cartmodel.dart';
import 'package:beauty_app/cartprovider.dart';
import 'package:beauty_app/productprovider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ScreenContainer extends StatefulWidget {
  ScreenContainer(
      {super.key,
      required this.img,
      required this.model,
      required this.txt,
      required this.price,
      required this.quantity,
      required this.dis});

  String txt;
  String img;
  String model;
  double price;
  double quantity;
  String dis;

  @override
  State<ScreenContainer> createState() => _ScreenContainerState();
}

class _ScreenContainerState extends State<ScreenContainer> {
  @override
  void initState() {
    // sharepref().getcart();
  }

  @override
  Widget build(BuildContext context) {
    // log('Prooduct detail ${sharepref().cartitems.first}');
    return Consumer<ProductProvider>(builder: (context, pro, _) {
      return Container(
        alignment: Alignment.center,
        width: 360,
        height: 395,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 8, 1, 1).withOpacity(0.1),
                Color.fromARGB(255, 33, 25, 25).withOpacity(0.5)
              ]),
        ),
        child: Expanded(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      widget.txt,
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'New', fontSize: 20),
                    )),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 20,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '${widget.price}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Newly',
                                  fontSize: 22),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Row(
                      children: [
                        Text(
                          '${widget.quantity}',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'New',
                              fontSize: 20),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.circle,
                          color: Colors.green,
                          size: 10,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'in Stock',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Newly',
                              fontWeight: FontWeight.w600,
                              fontSize: 17),
                        )
                      ],
                    ),
                  )),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'About Product:',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15),
                    child: Center(
                        child: Text(
                      widget.dis,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Newly',
                          fontSize: 20),
                    )),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      fixedSize: Size(350, 52),
                    ),
                    onPressed: () {
                      CartController().addToCart(CartItem(
                          id: widget.model,
                          name: widget.txt,
                          image: widget.img,
                          price: widget.price,
                          quantity: 1));
                      CartController().getCartItems();

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CartScreen()));
                    },
                    child: Text(
                      'Add to Cart',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Newly',
                          fontSize: 23),
                    )),
              )
            ],
          ),
        ),
      );
    });
  }
}
