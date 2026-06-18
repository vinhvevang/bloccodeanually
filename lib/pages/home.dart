import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_login_product_sds/bloc/home_bloc.dart';
import 'package:practice_login_product_sds/pages/account.dart';
import 'package:practice_login_product_sds/pages/product_page.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  static const _pages = <Widget>[
    ProductPage(),
    Account(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, int>(
      builder: (context, selectedIndex) {
        return Scaffold(
          body: _pages[selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) => context.read<HomeBloc>().add(ChangeTabEvent(index)),
            currentIndex: selectedIndex,
            selectedItemColor: Colors.deepOrangeAccent,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'trang chu',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'tai khoan',
              ),
            ],
          ),
        );
      },
    );
  }
}