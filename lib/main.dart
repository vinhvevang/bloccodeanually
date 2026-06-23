import 'package:bloc_crud/bloc/crud_bloc.dart';
import 'package:bloc_crud/page/home_product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(){
  runApp(BlocProvider(create: (_)=> CrudBloc(),
  child: MaterialApp(home: HomeProductPage()),),
      
  );
}