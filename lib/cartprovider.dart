

// import 'package:beauty_app/cartmodel.dart';

// import 'package:flutter/cupertino.dart';

// class CartProvider with ChangeNotifier{
//   Map<String,CartModel> CartItem = {};


//   addcart(String Id,String title,double price,String img){
//     if(!CartItem.containsKey(Id)){
//       CartItem.putIfAbsent(Id, () =>CartModel(Id: Id, title: title, img: img, price: price, quantity:1));
//     }
//     else{
//       CartItem.update(Id, (value) => CartModel(Id: value.Id, title:value.title, img:value. img, price: value.price, quantity: value.quantity + 1));
//     }
//     notifyListeners();

//   }

//   double Sum(){
//    double total = 0;
//    CartItem.forEach((key, CartModel) 
//       {
//         total = CartModel.quantity*CartModel.price;

//     });
//     return total;


//   }
 
// }