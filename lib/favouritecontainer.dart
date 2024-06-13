
import 'package:beauty_app/screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouriteContainer extends StatelessWidget {
   FavouriteContainer({super.key,required this.model,required this.category,required this.price,required this.categoryName,required this.dis,required this.img,required this.quantity,required this.txt});
String txt;
String model;
String img;
String categoryName;
String dis;
double quantity;
String category;
double price;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0,right: 8),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Screen(model: model,category:category, img: img,dis:dis ,txt: txt,price: price,quantity: quantity,)));
        },
        child: Container(
          height: 230,width: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(27)),
           gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(142, 100, 97, 97).withOpacity(0.1),Color.fromARGB(255, 8, 1, 1).withOpacity(0.3)])
          ),
          child:Column(
            children:[
              Padding(
                padding: const EdgeInsets.only(left: 5.0,right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$ 24',style: TextStyle(fontFamily: 'New',color: Colors.white,fontSize: 20),),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(142, 114, 109, 109).withOpacity(0.3),
                      ),
                      child:InkWell(
                       
                        
                       
                        child: Icon(Icons.favorite_rounded,color: Colors.white,),
                      )
          
                      
                
                
                    ),
                
                  ],
                ),
              ),
              Container(
                height: 100,width: 130,
                child: Image.network(img,fit: BoxFit.cover,),),
                
              Padding(
                padding: const EdgeInsets.only(top: 8.0,bottom: 5),
                child: Text(txt,style: TextStyle(color: Colors.white,fontFamily: 'New',fontSize: 18),),
              ),
            Row(children: [
              SizedBox(width: 28,),
                Icon(Icons.star,color: Colors.amber,),
              Icon(Icons.star,color: Colors.amber,),
              Icon(Icons.star,color: Colors.amber,),
              Icon(Icons.star,color: Colors.amber,),
              Icon(Icons.star,color: Colors.amber,),
            ],)
            ]
                  
          )
        ),
      ),
    );
  }
}