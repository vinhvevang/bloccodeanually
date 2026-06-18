import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardProduct extends StatefulWidget {
  String name;
  String price;
  String quanity;
  VoidCallback onDeleted;
  VoidCallback onEdited;
  CardProduct({
    super.key,
    required this.name,
    required this.price,
    required this.quanity,
    required this.onDeleted,
    required this.onEdited
  });

  @override
  State<CardProduct> createState() => _CardProductState();
}

class _CardProductState extends State<CardProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 118,
      decoration: BoxDecoration(border: Border.all(color: Colors.grey[400]!)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          Text(widget.name),
         Text(widget.price.toString()), 
         Text(widget.quanity.toString()), 
        IconButton(onPressed: widget.onDeleted, icon: Icon(Icons.delete)),
        IconButton(onPressed: widget.onEdited, icon: Icon(Icons.edit))
        
        ],
      ),
    );
  }
}
