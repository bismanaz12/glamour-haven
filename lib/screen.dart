



import 'dart:developer';



import 'package:beauty_app/screencontainer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

class Screen extends StatefulWidget {
   Screen({super.key,required this.model,required this.category,required this.img,required this.dis,required this.price,required this.quantity,required this.txt});
  String category;
 String  model;
String img;
String txt;
double quantity;
double price;
String dis;

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  void initState() {
  log(widget.category);
    super.initState();
  }
  @override
 
  @override
  Widget build(BuildContext context) {
return Scaffold(
  body: Stack(
    children:[ Container(
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  colors:[Color(0xffD49246),Color(0xffC67416)] ),
                  // color: Color(0xffC67416)
      ),
      child: Column(children: [
        SizedBox(height: 60,),
        Padding(
                    padding: const EdgeInsets.only(left: 15.0,right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 223, 223, 177).withOpacity(0.6),
                          
                        ),
                        child: InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.white,size: 28,)),
                        height: 65,
                        width: 65,
                      ),
                      Text('skin care',style: TextStyle(fontFamily: 'Newly',color:Color.fromARGB(255, 239, 239, 211),fontSize: 18),),
                    
                         Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 223, 223, 177).withOpacity(0.6),
                          
                        ),
                        child: Icon(Icons.shopping_bag,color: Colors.white,size: 28,),
                        height: 65,
                        width: 65,
                      ),
                    ],),
                  ),
                  SizedBox(height: 130,),
                 
        Container(
          height: 200,
          width:350,
          child: Image.asset('assets/images/pic.png',fit: BoxFit.cover,),
        ),
         ScreenContainer(img: widget.img,model:widget.model,txt: widget.txt, price: widget.price, quantity: widget.quantity, dis:widget.dis),
       
    
      ]),
    ),
     Positioned(
        top:140,
      left: 100,
        child: Card(
          color: Colors.transparent,
        surfaceTintColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 50,
          child: Container(
            height: 200,
            width:200,
            child: Image.network(widget.img,fit: BoxFit.cover,),
          ),
        ),
      ),


      
        Positioned(
          top:390,
          left: 350,
          child: Container(
                        height: 60,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 8, 1, 1).withOpacity(0.1) ,
                        ),
                        child: Icon(Icons.favorite_outline,color: Colors.white,),
                  
                  
                      ),
        ),
      
    ]
    
      
  ),

);
















    //  Provider.of<ProductProvider>(context,listen: false).getProduct(widget.category);
  
    

  //   return Scaffold(
  //     appBar:AppBar(leading: IconButton(onPressed: (){
  //       Navigator.pop(context);
  //     },icon:const Icon(Icons.arrow_back,color: Colors.black,) ,)),
  //     body: Container(
  //      child: Column(
  //        children: [
  //         const SizedBox(height: 90,),
  //          Consumer<ProductProvider>(
  //           builder: (context,provid,_){
  //               {
  //           return   ListView.builder(
  //             shrinkWrap: true,
  //             itemCount: provid.cate.length,
  //             itemBuilder: (context,index){
  //               return  Text(provid.cate[index].CategoryName,style: const TextStyle(color: Colors.black),);
  //             }
                
                
  //               );
                
                
              

  //           }

        
          
  //           }
            
            
          
  //          ),
         
           
           
  //        ],
  //      )
      
        

  //     ),
  //   );
   }
}