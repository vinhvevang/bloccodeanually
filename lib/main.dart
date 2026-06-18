import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:practice_login_product_sds/bloc/crud_product_bloc.dart';
import 'package:practice_login_product_sds/bloc/home_bloc.dart';
import 'package:practice_login_product_sds/bloc/login_bloc.dart';
import 'package:practice_login_product_sds/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('loginBox');

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => LoginBloc(Hive.box('loginBox')),
        ),
        BlocProvider(
          create: (_) => HomeBloc(),
        ),
        BlocProvider(
          create: (_) => CrudProductBloc(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}