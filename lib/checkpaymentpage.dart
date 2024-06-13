import 'package:beauty_app/cart.dart';
import 'package:beauty_app/cartprovider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// class Checkpayment extends StatelessWidget {
//    Checkpayment({super.key,required this.value});
// bool value;
 
//   @override
//   Widget build(BuildContext context) {
//     var cartpro = Provider.of<CartProvider>(context);
//       return Scaffold(
//     backgroundColor: Colors.transparent,
//       body: Container(
           
//           decoration: BoxDecoration(
                   
//                    // image: DecorationImage(image:AssetImage('assets/images/wood.jpg',),fit: BoxFit.cover),
                   
             
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 colors:[Color(0xffD49246),Color(0xffC67416)] ),
//                 // color: Color(0xffC67416)
//             ),
           
//         child: Column(children: [
        
//           SizedBox(height: 60,),
//           Padding(
//                   padding: const EdgeInsets.only(left: 15.0,right: 15),
//                   child: Row(
                   
//                     children: [
//                     Container(
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Color.fromARGB(255, 223, 223, 177).withOpacity(0.6),
                        
//                       ),
//                       child: InkWell(
//                         onTap: (){
//                           Navigator.pop(context);
//                         },
//                         child: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.white,size: 28,)),
//                       height: 65,
//                       width: 65,
//                     ),
//                     SizedBox(width: 100,),
//                     Text('My Cart',style: TextStyle(fontFamily: 'Newly',color:Color.fromARGB(255, 239, 239, 211),fontSize: 18),),
                  
                      
//                   ],),
//                 ),
                  
                 
//           Expanded(
//             child: ListView.builder(
//              scrollDirection: Axis.vertical,
//               shrinkWrap: true,
//               itemCount:cartpro.CartItem.length ,
//               itemBuilder: (context,index){
//                 return CartContainer(,value:value,img: cartpro.CartItem.values.toList()[index].img,quantity: cartpro.CartItem.values.toList()[index].quantity,txt: cartpro.CartItem.values.toList()[index].title);
                    
//             }),
//           ),
       
//         ],),
//       ),
//     );
//   }
//   }
