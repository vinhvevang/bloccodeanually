import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_login_product_sds/bloc/home_bloc.dart';
import 'package:practice_login_product_sds/bloc/login_bloc.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.read<HomeBloc>().add(const ChangeTabEvent(0));
            context.read<LoginBloc>().add(const LoginLogoutRequested());
          },
          child: const Text('Dang xuat'),
        ),
      ),
    );
  }
}