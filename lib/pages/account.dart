import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_login_product_sds/bloc/home_cubit.dart';
import 'package:practice_login_product_sds/bloc/login_cubit.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.read<HomeCubit>().changeTab(0);
            context.read<LoginCubit>().logout();
          },
          child: const Text('Dang xuat'),
        ),
      ),
    );
  }
}
