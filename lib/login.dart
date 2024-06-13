
import 'package:beauty_app/product.dart';
import 'package:beauty_app/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Login extends StatefulWidget {
   Login({super.key});
  bool value1 = true;
  bool value2 = false;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
 TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children:[ Container(
          width: double.infinity,
          decoration: BoxDecoration(  gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  colors:[Color(0xffD49246),Color(0xffC67416)] ),),
          
          
          child: Column(
            children: [
            
              SizedBox(
                height: 230,
              ),
              Text('Login',style: TextStyle(color: Colors.white,fontFamily: 'Style',fontSize: 30,),),
              SizedBox(height: 70,),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: 150,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(90),bottomRight: Radius.circular(90))
                
                  ),
                  child: Column(
                    children: [
                    
                        Padding(
                        padding: const EdgeInsets.only(top: 25.0,left: 10,right: 15),
                        child: TextFormField(
                          style:TextStyle(color: Color(0xffD49246),fontFamily: 'Newly',),
                          controller: email,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email,color: Color(0xffD49246),size: 20,),
                            hintText: 'Email..',
                            hintStyle: TextStyle(color: Color(0xffD49246),fontFamily: 'Newly',),
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffD49246).withOpacity(0.4),width: 1.5)),
                             focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffD49246),width: 1))
                          ),
                        ),
                      ),
                         Padding(
                        padding: const EdgeInsets.only(top: 20,left: 10,right: 23),
                        child: TextFormField(
                        style: TextStyle(color: Color(0xffD49246),fontFamily: 'Newly',),       
                          controller: pass,
                          decoration: InputDecoration(
                            border:InputBorder.none,
                            prefixIcon: Icon(Icons.password_outlined,color: Color(0xffD49246),size: 20,),
                            hintText: 'Password..',
                            hintStyle: TextStyle(color: Color(0xffD49246),fontFamily: 'Newly',),
                             
                           
                          ),
                        ),
                      ),
                    ],
                
                  ),
                ),
              ),
              SizedBox(height: 50,),
              Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: (){
                    Get.to(()=>Signup(),transition: Transition.cupertinoDialog,duration: Duration(seconds: 5));
                  },
                  child: Container(
                    height: 50,width:150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(30),bottomRight: Radius.circular(30)),
                      color:Colors.black,
                    ),
                    child: Center(child: Text('Register',style: TextStyle(color:Colors.white,fontFamily: 'Newly',fontSize: 20),)),
                  ),
                ),
              )


             
            
              
                  
          
              
                  
                  
                  
                  
                  
                    
               
                   
                  
                  
                  
                  
                 
           
                  
                  
                  
                    
                  
           
              // Card(
              //   elevation: 20,
              //   shadowColor:Color(0xffeb658f) ,
              //   color: Color(0xffeb658f),
              //   child: InkWell(
              //     onTap: ()async{
              //       if(email.text.isNotEmpty && name.text.isNotEmpty && pass.text.isNotEmpty && confirm.text.isNotEmpty){
              //         FirebaseAuth auth = FirebaseAuth.instance;
              //         FirebaseFirestore fire = FirebaseFirestore.instance;
              //         UserCredential user = await auth.createUserWithEmailAndPassword(email: email.text, password: pass.text);
              //      await   fire.collection('users').doc(user.user!.uid).set({
              //           'uid':user.user!.uid,
              //           'name':name.text,
        
              //           'email':email.text,
              //           'password':pass.text,
              //           'confirmpassword':confirm.text,
        
              //         });
              //         // Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
              //         Get.to(()=>Login(),transition: Transition.native,duration: Duration(seconds: 3));
              //       }
              //     },
              //     child: Container(
              //       height: 50,width: 340,
              //       decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.all(Radius.circular(20)),
                  
              //         color: Colors.pink),
              //         child: Center(child: Text('Sign up',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),)),
                  
                  
              //         ),
              //   ),
              // ),
                 
              //     SizedBox(height: 30,),
              //     Padding(
              //       padding: const EdgeInsets.only(left: 90.0),
              //       child: Row(children: [
              //         CircleAvatar(
              //           maxRadius: 30,
        
              //           backgroundImage: AssetImage('assets/images/google.png'),),
              //          SizedBox(width: 20,),
              //           CircleAvatar(
              //           maxRadius: 30,
        
              //           backgroundImage: AssetImage('assets/images/facebook.png'),),
                      
              //           SizedBox(width: 20,),
        
              //          CircleAvatar(
              //           maxRadius: 30,
        
        
              //           backgroundImage: AssetImage('assets/images/twitter.png',),)
              //       ],),
              //     )
            ],
          ),
        ),
        Positioned(
          top: 370,
          left: 300,
          child: InkWell(

            onTap: ()async{
              if(email.text.isEmpty && pass.text.isEmpty){
             await    showDialog(context: context, builder: (context)=>CustomDialogue());
              }
              
             try{
               if(email.text.isNotEmpty  && pass.text.isNotEmpty){
                FirebaseAuth auth = FirebaseAuth.instance;
              
             UserCredential user = await auth.signInWithEmailAndPassword(email: email.text, password: pass.text);
           if(user.user != null){
                    
             
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                Get.to(()=>Product(),transition: Transition.native,duration: Duration(seconds: 3));
           }
              }

             }
             catch(e){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString(),style: TextStyle(color: Colors.white),)));
             }
            },
            child: Container(
              height: 90,width: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(60)),
                     
            
                color: Colors.black),
                child: Center(child: Icon(Icons.arrow_forward_sharp,color: Colors.white,size: 50,),
            
                ),
          ),
                           ),
        ),
                 
              
        


Positioned(
  left: -100,
  top: -60,
  child: Container(height: 250,width: 250,
      decoration: BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle
      
      ),
      ),
),
Positioned(
  left: -70,
  top: -150,
  child: Container(height: 250,width: 250,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 239, 227, 227),
        shape: BoxShape.circle
      
      ),
      ),
),

Positioned(
  left: 250,
  top: 700,
  child: Container(height: 250,width: 250,
      decoration: BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle
      
      ),
      ),
),
Positioned(
  left: 210,
  top: 795,
  child: Container(height: 250,width: 250,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 239, 227, 227),
        shape: BoxShape.circle
      
      ),
      ),
),
        ]
      ),
    );
  }
}


