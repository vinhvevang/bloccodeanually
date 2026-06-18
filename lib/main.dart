import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:practice_login_product_sds/bloc/crud_product_bloc.dart';
import 'package:practice_login_product_sds/my_app.dart';

void main() async{
      WidgetsFlutterBinding.ensureInitialized();
     await Hive.initFlutter();

   await   Hive.openBox("loginBox");
      
    
      runApp( BlocProvider(
        create: (_)=> CrudProductBloc(),
        child: MyApp(),),
        
        );
}