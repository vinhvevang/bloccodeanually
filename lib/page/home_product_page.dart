import 'package:bloc_crud/bloc/crud_bloc.dart';
import 'package:bloc_crud/bloc/crud_event.dart';
import 'package:bloc_crud/bloc/crud_state.dart';
import 'package:bloc_crud/bloc/model.dart';
import 'package:bloc_crud/widgets/card_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeProductPage extends StatelessWidget {
  HomeProductPage({super.key});
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController quan = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextFormField(),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextFormField(),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextFormField(),
          ),
          Expanded(
            child: BlocBuilder<CrudBloc, CrudState>(
              builder: (context, state) {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: state.listProduct.length,
                  itemBuilder: (context, i) {
                    int takePrice = int.tryParse(price.text) ?? 0;
                    int takeQuan = int.tryParse(quan.text) ?? 0;
                    return CardProduct(
                      name: name.text,
                      price: takePrice,
                      quan: takeQuan,
                      ondeleted:
                          () => context.read<CrudBloc>().add(deleteProduct(i)),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) {
              int takePrice = int.tryParse(price.text) ?? 0;
              int takeQuan = int.tryParse(quan.text) ?? 0;
              Product res = Product(name.text, takePrice, takeQuan);
              return AlertDialog(
                title: Text("Nhap thong tin"),
                actions: [
                  TextFormField(
                    controller: name,
                    decoration: InputDecoration(label: Text("ten san pham : ")),
                  ),
                  TextFormField(
                    controller: price,
                    decoration: InputDecoration(label: Text("gia : ")),
                  ),
                  TextFormField(
                    controller: quan,
                    decoration: InputDecoration(label: Text("so luong : ")),
                  ),
                  TextButton(
                    onPressed: () {
                      context.read<CrudBloc>().add(addProduct(res));
                    },
                    child: Text("them"),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
