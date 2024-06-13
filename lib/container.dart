

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:provider/provider.dart';

class MeContainer extends StatefulWidget {
 MeContainer({super.key,required this.txt,required this.value,required this. category});
String txt;
String category;
bool value;
 




  @override
  State<MeContainer> createState() => _MeContainerState();
}

class _MeContainerState extends State<MeContainer> {
   
  @override
  Widget build(BuildContext context) {
  
   
    
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container( 
          
        height: 35,
        width: 130,
        decoration: BoxDecoration(
          
          color:widget.value? Colors.black: Color.fromARGB(255, 1, 0, 0).withOpacity(0.2),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Expanded(child: Padding(
          padding: const EdgeInsets.only(left: 8.0,right: 8),
          child: Center(child: Text(widget.txt,style: TextStyle(color:Colors.white,fontFamily: 'New',fontSize: 19),)),
        )),
      
      
      ),
    );
  }
}
