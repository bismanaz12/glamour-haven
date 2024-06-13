
import 'package:beauty_app/productmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class ProductProvider with ChangeNotifier{
// List<productmodel> cate = [];
String selectedCategory='';
bool isSearching=false;
List<productmodel> searchedProducts=[];
setSelectedcategory(String value){
  selectedCategory=value;
  notifyListeners();
}


setIsSearching(bool value){
   isSearching=value;
   notifyListeners();
}


addSearchedProducts(productmodel product){
  searchedProducts.add(product);
  notifyListeners();
}




// getProduct(String category)async{
 
 
//   QuerySnapshot<Map<String, dynamic>> snapshot = await  FirebaseFirestore.instance.collection('Products').where('CategoryName',isEqualTo:category ).get();
//     cate = snapshot.docs.map((e) {
//   return productmodel.frommap(e.data());

//   }).toList();
//   notifyListeners();
 
// }

List<productmodel> allproduct = [];
getAllProduct()async{
  allproduct.clear();
 
 
  QuerySnapshot<Map<String, dynamic>> snapshot = await  FirebaseFirestore.instance.collection('Products').get();
    allproduct = snapshot.docs.map((e) {
  return productmodel.fromMap(e.data());

  }).toList();
  notifyListeners();
}



}