import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:practice_login_product_sds/pages/account.dart';
import 'package:practice_login_product_sds/pages/product_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  void changeScreen(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
  List<Widget> listProduct = [ProductPage(), Account()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  listProduct[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: changeScreen,
        currentIndex: selectedIndex,
     
        selectedItemColor: Colors.deepOrangeAccent,

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "trang chu"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "tai khoan"),
        ],
      ),
    );
  }
}
