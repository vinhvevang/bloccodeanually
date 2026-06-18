import 'package:flutter/material.dart';

class CardProduct extends StatelessWidget {
  final String name;
  final String price;
  final String quanity;
  final VoidCallback onDeleted;
  final VoidCallback onEdited;

  const CardProduct({
    super.key,
    required this.name,
    required this.price,
    required this.quanity,
    required this.onDeleted,
    required this.onEdited,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 118,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(name),
          Text(price),
          Text(quanity),
          IconButton(
            onPressed: onDeleted,
            icon: const Icon(Icons.delete),
          ),
          IconButton(
            onPressed: onEdited,
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
    );
  }
}
