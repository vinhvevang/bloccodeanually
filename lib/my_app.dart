import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_login_product_sds/bloc/login_bloc.dart';
import 'package:practice_login_product_sds/pages/home.dart';
import 'package:practice_login_product_sds/pages/login.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return state.isAuthenticated ? const Home() : const Login();
        },
      ),
    );
  }
}