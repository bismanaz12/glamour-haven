

import 'package:beauty_app/favouritecontainer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatefulWidget {
  FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  
TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:Container(
        height: double.infinity,
        decoration:const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors:[Color(0xffD49246),Color(0xffC67416)] ),
        ),
        child:SingleChildScrollView(
          child: Column(
            children: [
                const SizedBox(height: 30,),
           
             Padding(
                      padding: const EdgeInsets.only(left: 15.0,right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color.fromARGB(255, 223, 223, 177).withOpacity(0.6),
                            
                          ),
                          child: InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: const Icon(Icons.dashboard,color: Colors.white,size: 28,)),
                          height: 65,
                          width: 65,
                        ),
                        const Text('Favourites',style: TextStyle(fontFamily: 'Newly',color:Color.fromARGB(255, 239, 239, 211),fontSize: 18),),
                      
                           Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color.fromARGB(255, 223, 223, 177).withOpacity(0.6),
                            
                          ),
                          child: const Icon(Icons.shopping_bag,color: Colors.white,size: 28,),
                          height: 65,
                          width: 65,
                        ),
                      ],),
                    ),
                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0,right: 20),
                      child: SearchBar(
                      textStyle: const MaterialStatePropertyAll(TextStyle(color: Colors.white,fontFamily: 'New')),
                        
                        hintText: 'Search for....',
                        hintStyle: const MaterialStatePropertyAll(TextStyle(color: Colors.white,fontFamily: 'New')),
                     
                        shape: const MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30)))),
                        surfaceTintColor:MaterialStatePropertyAll(const Color.fromARGB(255, 223, 223, 177).withOpacity(0.6)) ,
                        shadowColor: MaterialStatePropertyAll(const Color.fromARGB(255, 223, 223, 177).withOpacity(0.6),),
                        backgroundColor: MaterialStatePropertyAll(const Color.fromARGB(255, 223, 223, 177).withOpacity(0.6),),
                        elevation: const MaterialStatePropertyAll(10),
                        leading: const Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Icon(Icons.search_outlined,color: Colors.white,size: 30,),
                        ),
                        controller: search,
                        onChanged: (value){
                          setState(() {
                            search.text = value;
                          });
                        },
                      ),
                    ),
                    StreamBuilder(stream: FirebaseFirestore.instance.collection('favourites').where('user',isEqualTo: FirebaseAuth.instance.currentUser!.uid).snapshots(), 
                    builder: (context,snapshot){
                      if(snapshot.hasData){
                        
                         return GridView.builder(
                        
                       
                       
                        shrinkWrap: true,
                        
                        itemCount: snapshot.data!.docs.length,
                        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 20,
                          mainAxisExtent: 230,
                                             
                                         
                        
                                     
                       
                          crossAxisCount: 2), itemBuilder:(context,index){
                             String name = snapshot.data!.docs[index].data().toString();
                              var data = snapshot.data!.docs[index].data();
                       if(data['user'] == FirebaseAuth.instance.currentUser!.uid){
                        
                       
                         if(search.text.isEmpty){
                         
                          return  FavouriteContainer(model: data['proId'],category:data['category'] , price: data['price'], categoryName: data['categoryName'], dis: data['dis'], img: data['image'], quantity: data['quantity'], txt:data['title']);
                        
                          }
                       
                        else if(name.toLowerCase().contains(search.text.toLowerCase())){
                          return FavouriteContainer(model: data['proId'],category:data['category'] , price: data['price'], categoryName: data['categoryName'], dis: data['dis'], img: data['image'], quantity: data['quantity'], txt:data['title']);
                        }
                        else{
                          Container();
                        }
                       } 
                       
                  
                     
                                           }
                
                                           );
                      }
                      
                                          
                       return const CircularProgressIndicator();
                       
                    }
                    
                
                    )
            ]
          
                ),
        )
      
      )
    );
  }
}