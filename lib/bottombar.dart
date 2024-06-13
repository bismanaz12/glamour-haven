
import 'package:beauty_app/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomBar extends StatefulWidget {

   const CustomBottomBar({super.key});

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int currentIndex=0;

  PageController controller=PageController();

  void onPageChnaged(int index){
    setState(() {
      currentIndex=index;
    });
  }
  void onTap(int index){
   controller.jumpToPage(index);
   
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xffC67416),
      body: PageView(controller:controller,onPageChanged: onPageChnaged ,children: [
  Product(),

      
    ],),bottomNavigationBar: Padding(
      padding: const EdgeInsets.only(left: 30,right: 30,bottom:15),
      child: Container(
   
        
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          child: BottomNavigationBar(
          showSelectedLabels:false,
          iconSize: 25,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
            
            backgroundColor: Color(0xffFEFCFF).withOpacity(0.6),
          
           
            currentIndex: currentIndex,onTap: onTap,items:  [
          BottomNavigationBarItem(
            label: '',
             activeIcon: Icon(Icons.home_max_outlined,color: Colors.black,size: 40,),
            icon:
                 Padding(
                   padding: const EdgeInsets.all(2),
                   child: Container(
                    height: 60,width: 70,
                     decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white),
                               
                     child: Icon(
                          Icons.home_max_outlined,color: Colors.black,
                          ),
                          
                   ),
                 ),
              
          
         
          ),
          BottomNavigationBarItem(
            label: '',
            activeIcon: 
              
               Icon(Icons.shopping_bag_outlined,color: Colors.white,size: 40,),
            icon: Padding(
              padding: const EdgeInsets.all(2),
              child: Container(
                height:60,
                width: 70,
                decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white),
              
                child: Icon(
                          Icons.shopping_bag_outlined,color: Colors.black,
                          ),
              ),
            ),
          ),


          BottomNavigationBarItem(
            label:'',
             activeIcon: Icon(Icons.favorite_outline,color: Colors.teal,size: 40,),
            icon: Padding(
              padding: const EdgeInsets.all(2),
              child: Container(
               height: 60,
                width: 60,
                 decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(60)),color:Colors.white),
              
                child: Icon(
                          Icons.favorite_outline,color: Colors.black,
                          ),
              ),
            ),
         
          ),
          ],),
        ),
      ),
    ),);
  }
}
