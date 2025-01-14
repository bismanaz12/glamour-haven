import 'dart:developer';

import 'package:beauty_app/bottombar.dart';
import 'package:beauty_app/cartprovider.dart';
import 'package:beauty_app/categoryprovider.dart';
import 'package:beauty_app/firebase_options.dart';
import 'package:beauty_app/first.dart';
import 'package:beauty_app/product.dart';
import 'package:beauty_app/productprovider.dart';
import 'package:beauty_app/signup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => CategoryProvider()),
    ChangeNotifierProvider(create: (context) => ProductProvider()),
    // ChangeNotifierProvider(create: (context) => CartProvider()),
  ], child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    Provider.of<ProductProvider>(context, listen: false).getAllProduct();
    getAllProduct();
    super.initState();
    // Provider.of<ProductProvider>(context,listen: false).getAllProduct();
  }

  getAllProduct() async {
    await FirebaseFirestore.instance.collection('Products').get().then((value) {
      log('Products are ${value.docs.first.data()}');
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // title: 'Flutter Demo',
        theme: ThemeData(
          //   // This is the theme of your application.
          //   //
          //   // TRY THIS: Try running your application with "flutter run". You'll see
          //   // the application has a purple toolbar. Then, without quitting the app,
          //   // try changing the seedColor in the colorScheme below to Colors.green
          //   // and then invoke "hot reload" (save your changes or press the "hot
          //   // reload" button in a Flutter-supported IDE, or press "r" if you used
          //   // the command line to start the app).
          //   //
          //   // Notice that the counter didn't reset back to zero; the application
          //   // state is not lost during the reload. To reset the state, use hot
          //   // restart instead.
          //   //
          //   // This works for code too, not just values: Most code changes can be
          //   // tested with just a hot reload.
          //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: First());
  }
}
