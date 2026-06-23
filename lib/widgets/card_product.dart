import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardProduct extends StatelessWidget {
  String name;
  int price;
  int quan;
  VoidCallback ondeleted;
  CardProduct({
    super.key,
    required this.name,
    required this.price,
    required this.quan,
    required this.ondeleted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: Column(
        children: [
          Text("Ten san pham : " + name),
          Text("gia : $price"),
          Text("So luong: $quan"),
          IconButton(onPressed: ondeleted, icon: Icon(Icons.delete))
        ],
      ),
    );
  }
}
