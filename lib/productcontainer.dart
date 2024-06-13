
import 'package:beauty_app/screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ProductContainer extends StatefulWidget {
   ProductContainer({super.key,required this.model,required this.img,required this.proId,required  this.txt,required this.category,required this.dis,required this.categoryName,required this.price,required this.quantity,required this.txt1});
String img ;
String  model;
String txt;
String category;
String categoryName;
String txt1;
double price;
double quantity;
String dis;
String proId;


  @override
  State<ProductContainer> createState() => _ProductContainerState();
}

class _ProductContainerState extends State<ProductContainer> {
bool like = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0,right: 8),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Screen(model: widget.model,category: widget.category, img: widget.img,dis:widget.dis ,txt: widget.txt1,price: widget.price,quantity: widget.quantity,)));
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
                    InkWell(
                       onTap:()async{
   QuerySnapshot<Map<String, dynamic>> snapshot=await FirebaseFirestore.instance.collection('favourites').where('user',isEqualTo: FirebaseAuth.instance.currentUser!.uid).get();

   bool isMila=false;
   String favId='';
   for(int i=0;i<snapshot.docs.length;i++){
    if(snapshot.docs[i].data()['proId']==widget.proId){


  isMila=true;

favId=snapshot.docs[i].data()['favId'];
    }
   }
   if(isMila){
   await  FirebaseFirestore.instance.collection('favourites').doc(favId).delete();

   }
   else{

   

                          String FavouriteId = Uuid().v4();
                      await  FirebaseFirestore.instance.collection('favourites').doc(FavouriteId).set({
                          'favId':FavouriteId,
                          'proId':widget.proId,
                        'title':widget.txt,
                      'image':widget.img,
                      'dis':widget.dis,
                      'quantity':widget.quantity,
                      'categoryName':widget.categoryName,
                      'category':widget.category,
                      'user':FirebaseAuth.instance.currentUser!.uid,
                      'price':widget.price
                    



                        

                        
                        });
   }
                       
                        
                          
                        },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(142, 114, 109, 109).withOpacity(0.3),
                        ),
                      
                          
                         
                          child : StreamBuilder(

                            stream: FirebaseFirestore.instance.collection('favourites').where('user',isEqualTo: FirebaseAuth.instance.currentUser!.uid).snapshots(),
                            builder: (context,snapshot){
                            if(snapshot.hasData){
                              bool Ismila = false;
                              for(int i = 0; i < snapshot.data!.docs.length;i++){
                                if(snapshot.data!.docs[i].data()['proId'] == widget.proId){
                                  Ismila = true;
                                  break;

                                }
                               
                              }
                               if(Ismila){
                               return  Icon(Icons.favorite,color: Colors.white,);
                                }else{
                                   return Icon(Icons.favorite_outline,color: Colors.white,);
                                }
                            }else{
                              return Container();
                            }
                          
                
                 
                              
                            
                            
                            
                            }
                            ),
                            
                        
                      
                        
                                      
                                      
                      ),
                    ),
                
                  ],
                ),
              ),
              Container(
                height: 100,width: 130,
                child: Image.network(widget.img,fit: BoxFit.cover,),),
                
              Padding(
                padding: const EdgeInsets.only(top: 8.0,bottom: 5),
                child: Text(widget.txt,style: TextStyle(color: Colors.white,fontFamily: 'New',fontSize: 18),),
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