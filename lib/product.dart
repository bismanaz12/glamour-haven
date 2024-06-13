import 'dart:developer';

import 'package:beauty_app/categoryprovider.dart';
import 'package:beauty_app/container.dart';
import 'package:beauty_app/favourite.dart';
import 'package:beauty_app/login.dart';
import 'package:beauty_app/productcontainer.dart';
import 'package:beauty_app/productmodel.dart';
import 'package:beauty_app/productprovider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class Product extends StatefulWidget {
  Product({super.key});
  bool color = false;

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    var pro =
        Provider.of<CategoryProvider>(context, listen: false).getallcategory();
    var prodi = Provider.of<ProductProvider>(context, listen: false);

    //  log('Products are ${prodi.allproduct.first}');

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(children: [
        Container(
          height: double.infinity,

          decoration: BoxDecoration(
            // image: DecorationImage(image:AssetImage('assets/images/wood.jpg',),fit: BoxFit.cover),

            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [Color(0xffD49246), Color(0xffC67416)]),
            // color: Color(0xffC67416)
          ),

          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 223, 223, 177)
                              .withOpacity(0.6),
                        ),
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FavouriteScreen()));
                            },
                            child: Icon(
                              Icons.dashboard,
                              color: Colors.white,
                              size: 28,
                            )),
                        height: 65,
                        width: 65,
                      ),
                      Text(
                        'Hi,Melanie',
                        style: TextStyle(
                            fontFamily: 'Newly',
                            color: Color.fromARGB(255, 239, 239, 211),
                            fontSize: 18),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 223, 223, 177)
                              .withOpacity(0.6),
                        ),
                        child: InkWell(
                            onTap: () async {
                              FirebaseAuth auth = FirebaseAuth.instance;
                              await auth.signOut();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()));
                            },
                            child: Icon(
                              Icons.shopping_bag,
                              color: Colors.white,
                              size: 28,
                            )),
                        height: 65,
                        width: 65,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                Container(
                    height: 230,
                    width: 230,
                    child: Image.asset(
                      'assets/images/firstcream.png',
                      fit: BoxFit.cover,
                    )),
                SizedBox(
                  height: 120,
                ),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          height: 40,
                          width: 40,
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 27,
                          ),
                          decoration: BoxDecoration(
                            color:
                                Color.fromARGB(255, 1, 0, 0).withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Consumer<CategoryProvider>(builder: (index, pro, _) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: InkWell(
                            onTap: () {
                              prodi.setIsSearching(false);
                            },
                            child: Container(
                              height: 40,
                              width: 80,
                              child: Center(
                                  child: Text('All',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'New',
                                          fontSize: 19))),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 1, 0, 0)
                                    .withOpacity(0.2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                          ),
                        );
                      }),
                      Consumer<CategoryProvider>(builder: (context, pro, _) {
                        return SizedBox(
                          height: 50,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: pro.getcategories.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                    onTap: () {
                                      if (pro.getcategories.isNotEmpty) {
                                        prodi.searchedProducts.clear();

                                        prodi.setSelectedcategory(
                                            pro.getcategories[index]);
                                        prodi.setIsSearching(true);

                                        for (int i = 0;
                                            i < prodi.allproduct.length;
                                            i++) {
                                          if (prodi.allproduct[i].categoryName
                                              .toLowerCase()
                                              .contains(prodi.selectedCategory
                                                  .toLowerCase())) {
                                            prodi.addSearchedProducts(
                                                prodi.allproduct[i]);
                                          }
                                        }
                                      } else {
                                        prodi.setIsSearching(false);
                                        prodi.searchedProducts.clear();
                                      }
                                    },
                                    child: MeContainer(
                                      txt: pro.getcategories[index],
                                      value: widget.color,
                                      category: pro.getcategories[index],
                                    ));
                              }),
                        );
                      })
                      //  InkWell(
                      //   onTap: (){
                      //     setState(() {
                      //        color1 = true;
                      //        color2 = false;
                      //        color3 = false;
                      //        color4 = false;
                      //     });

                      //   },
                      //   child: MeContainer(txt: 'All',value:color1)),
                      //  InkWell(
                      //   onTap: (){
                      //     setState(() {
                      //        color2 = true;
                      //        color1 = false;
                      //        color3 = false;
                      //        color4 = false;
                      //     });
                      //       var product = Provider.of<ProductProvider>(context,listen: false).getAllProduct();
                      //   },
                      //   child: MeContainer(txt:'skincare',value:color2)),
                      //   InkWell
                      //   (
                      //     onTap: (){
                      //       setState(() {
                      //        color3 = true;
                      //        color4 = false;
                      //        color2 = false;
                      //        color1 = false;
                      //     });
                      //     },
                      //     child: MeContainer(txt:'facewash',value:color3)),
                      //    InkWell
                      //    (
                      //     onTap: (){
                      //       setState(() {
                      //        color4 = true;
                      //        color1 = false;
                      //        color2 = false;
                      //        color3 = false;
                      //     });
                      //     },
                      //     child: MeContainer(txt: 'Serum',value: color4,category: )),
                    ],
                  ),
                ),

                SizedBox(
                  height: 230,
                  child: Consumer<ProductProvider>(builder: (context, prod, _) {
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: prod.isSearching
                            ? prod.searchedProducts.length
                            : prod.allproduct.length,
                        itemBuilder: (context, index) {
                          return ProductContainer(
                              model: prod.isSearching
                                  ? prod.searchedProducts[index].id
                                  : prod.allproduct[index].id,
                              proId: prod.isSearching
                                  ? prod.searchedProducts[index].id
                                  : prod.allproduct[index].id,
                              img: prod.isSearching
                                  ? prod.searchedProducts[index].url
                                  : prod.allproduct[index].url,
                              txt: prod.isSearching
                                  ? prod.searchedProducts[index].title
                                  : prod.allproduct[index].title,
                              category: prod.isSearching
                                  ? prod.searchedProducts[index].id
                                  : prod.allproduct[index].id,
                              dis: prod.isSearching
                                  ? prod.searchedProducts[index].description
                                  : prod.allproduct[index].description,
                              txt1: prod.isSearching
                                  ? prod.searchedProducts[index].title
                                  : prod.allproduct[index].title,
                              quantity: prod.isSearching
                                  ? prod.searchedProducts[index].quantity
                                  : prod.allproduct[index].quantity,
                              price: prod.isSearching
                                  ? prod.searchedProducts[index].price
                                  : prod.allproduct[index].price,
                              categoryName: prod.isSearching
                                  ? prod.searchedProducts[index].categoryName
                                  : prod.allproduct[index].categoryName);
                        });
                  }),
                ),
                // ProductContainer(img:'assets/images/wood.jpg',txt:'hihi'),
              ],
            ),
          ),

          // Consumer<CategoryProvider>(
          //   builder: (context,pro,_) {
          //     return ListView.builder(
          //       shrinkWrap: true,
          //       itemCount:pro.getcategories.length,
          //       itemBuilder: (context,index){
          //         return
          //         MYContainer(txt: pro.getcategories[index],category: pro.getcategories[index],);
          //       // CategoryContainer(txt: pro.getcategories[index],id: pro.Id[index],);

          //     });
          //   }
          // ),
        ),
        Positioned(
          top: 315,
          left: 40,
          child: Container(
            height: 160,
            width: 330,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(142, 131, 129, 129).withOpacity(0.1),
                    Color.fromARGB(255, 8, 1, 1).withOpacity(0.3)
                  ]),
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Night Cream',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Newly',
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ),
                      Container(
                          child: Row(
                        children: [
                          SizedBox(
                            width: 80,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 25,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '4.9',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Newly',
                              fontSize: 22,
                            ),
                          ),
                        ],
                      ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      fixedSize: Size(300, 48),
                    ),
                    onPressed: () {},
                    child: Text(
                      'See More',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Newly',
                          fontSize: 23),
                    ))
              ],
            ),
          ),
        ),
        Positioned(
          top: 250,
          left: 320,
          child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Color.fromARGB(142, 124, 120, 120).withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: Image.asset(
                    'assets/images/heart.png',
                    fit: BoxFit.cover,
                  ))),
        ),
        Positioned(
          top: 300,
          left: 40,
          child: Container(
            height: 30,
            width: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Color.fromARGB(255, 8, 1, 1).withOpacity(0.4)),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Icon(
                    Icons.workspace_premium,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Featured',
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'New', fontSize: 17),
                ),
                SizedBox(
                  width: 5,
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

// class MYContainer extends StatelessWidget {
//    MYContainer({super.key,required this.txt,required this.category});
// String txt;
// String category;
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: (){
//         Navigator.push(context, MaterialPageRoute(builder: (context)=>Screen(category: category)));

//       },
//       child: Container(
//         child: Column(
//           children: [
//             Text(txt)
//           ],
//         ),
//       ),
//     );
//   }
// }
