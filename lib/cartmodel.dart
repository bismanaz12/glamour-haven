import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class CartController {
  static const _key = 'cartItems';

  Future<List<CartItem>> getCartItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(_key)) {
      List<dynamic> jsonList = jsonDecode(prefs.getString(_key)!);
      return jsonList.map((json) => CartItem.fromJson(json)).toList();
    } else {
      return [];
    }
  }

  Future<void> addToCart(CartItem item) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<CartItem> cartItems = await getCartItems();
    int index = cartItems.indexWhere((element) => element.id == item.id);     
    if (index != -1) {
      cartItems[index].quantity += item.quantity;
    } else {
      // cartItems.removeWhere((element) => element.id == item.id);

      cartItems.add(item);
    }
    await prefs.setString(
        _key, jsonEncode(cartItems.map((e) => e.toJson()).toList()));
  }

  Future<void> removeFromCart(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<CartItem> cartItems = await getCartItems();
    cartItems.removeWhere((element) => element.id == id);
    await prefs.setString(
        _key, jsonEncode(cartItems.map((e) => e.toJson()).toList()));
  }

   Future<void> increaseQuan(CartItem item) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<CartItem> cartItems = await getCartItems();
    int index = cartItems.indexWhere((element) => element.id == item.id);     
 
      cartItems[index].quantity += item.quantity;
    // } else {
    //   // cartItems.removeWhere((element) => element.id == item.id);

    //   cartItems.add(item);
    // }
    await prefs.setString(
        _key, jsonEncode(cartItems.map((e) => e.toJson()).toList()));
  }
   Future<void> removeQuan(CartItem item) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<CartItem> cartItems = await getCartItems();
    int index = cartItems.indexWhere((element) => element.id == item.id);     
    if (item.quantity>1) {
      cartItems[index].quantity -= item.quantity;
    } else {
      // cartItems.removeWhere((element) => element.id == item.id);

      cartItems.remove(item);
    }
    await prefs.setString(
        _key, jsonEncode(cartItems.map((e) => e.toJson()).toList()));
  }



 
  Future<void> clearCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}

class CartItem {
  final String id;
  final String name;
  double quantity;
  String image;
  double price;

  CartItem(
      {required this.id,
      required this.name,
      required this.image,
      required this.quantity,
      required this.price});

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
        id: json['id'],
        name: json['name'],
        quantity: json['quantity'],
        image: json['image'],
        price: json['price']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'quantity': quantity,
      'image': image,
      'price': price
    };
  }
}
