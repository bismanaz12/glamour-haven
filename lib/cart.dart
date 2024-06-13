import 'dart:convert';
import 'dart:developer';

import 'package:beauty_app/cartcontainer.dart';
import 'package:beauty_app/cartmodel.dart';
import 'package:beauty_app/cartprovider.dart';
import 'package:beauty_app/checkout.dart';
import 'package:beauty_app/checkpaymentpage.dart';
import 'package:beauty_app/order.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartItem>? cartData;
  @override
  void initState() {
    getCartData();
    super.initState();
  }

  getCartData() async {
    CartController cartCont = CartController();
    cartData = await cartCont.getCartItems();
    setState(() {});
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // final cartdata1 = prefs.getStringList('cartitems');
    // setState(() {
    //   cartData = cartdata1;
    // });
  }

  bool value = false;
  double? price;
  @override
  Widget build(BuildContext context) {
    // getCartData();

    // List<dynamic> allItems = cartData!.map((item) => jsonDecode(item)).toList();
    // allItems.map((item) {
    //   return price = item['price'] * item['quantity'];
    // }).toList();
    // sharepref().getcart();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          // image: DecorationImage(image:AssetImage('assets/images/wood.jpg',),fit: BoxFit.cover),

          gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [Color(0xffD49246), Color(0xffC67416)]),
          // color: Color(0xffC67416)
        ),
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          Color.fromARGB(255, 223, 223, 177).withOpacity(0.6),
                    ),
                    child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Colors.white,
                          size: 28,
                        )),
                    height: 65,
                    width: 65,
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  Text(
                    'My Cart',
                    style: TextStyle(
                        fontFamily: 'Newly',
                        color: Color.fromARGB(255, 239, 239, 211),
                        fontSize: 18),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: cartData!.length,
                  itemBuilder: (context, index) {
                    // Map<String, dynamic> itemData =
                    //     jsonDecode(cartData![index]);
                    return CartContainer(
                      // data: cartData[index],
                      value: value,
                      price: cartData![index].price,
                      img: cartData![index].image,
                      quantity: cartData![index].quantity,
                      txt: cartData![index].name,
                    );
                  }),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    fixedSize: Size(280, 43)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Checkout()));
                },
                child: Text('OrderNow',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Newly')))
          ],
        ),
      ),
    );
  }
}
