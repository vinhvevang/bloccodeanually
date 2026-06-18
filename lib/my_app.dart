import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:practice_login_product_sds/pages/home.dart';
import 'package:practice_login_product_sds/pages/login.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:Login(),) ;
  }
}