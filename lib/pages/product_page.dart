import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_login_product_sds/bloc/crud_product_bloc.dart';
import 'package:practice_login_product_sds/bloc/crud_product_event.dart';
import 'package:practice_login_product_sds/bloc/crud_product_state.dart';
import 'package:practice_login_product_sds/pages/card_product.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  TextEditingController nameProduct = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController quanity = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Tìm sản phẩm",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                context.read<CrudProductBloc>().add(SearchProduct(value));
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<CrudProductBloc, CrudProductState>(
              builder: (context, state) {
                final filteredIndexes =
                    List.generate(state.name.length, (index) => index)
                        .where(
                          (index) => state.name[index].toLowerCase().contains(
                            state.searchKeyWord.toLowerCase(),
                          ),
                        )
                        .toList();

                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: filteredIndexes.length,
                  itemBuilder: (context, i) {
                    final index = filteredIndexes[i];

                    return CardProduct(
                      name: state.name[index],
                      price: state.price[index].toString(),
                      quanity: state.quanity[index].toString(),

                      onDeleted: () {
                        context.read<CrudProductBloc>().add(
                          deleteProduct(
                            int.parse(price.text),
                            nameProduct.text,
                            int.parse(quanity.text),
                          ),
                        );
                      },
                      onEdited: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Sua du lieu"),
                              actions: [
                                Text("ten san pham"),
                                TextFormField(controller: nameProduct),
                                Text("gia"),
                                TextFormField(controller: price),
                                Text("so luong"),
                                TextFormField(controller: quanity),
                                TextButton(
                                  onPressed: () {
                                    context.read<CrudProductBloc>().add(
                                      onEdited(
                                        int.parse(price.text),
                                        nameProduct.text,
                                        int.parse(quanity.text),
                                        i,
                                      ),
                                    );
                                  },
                                  child: Text("them"),
                                ),
                              ],
                            );
                          },
                        );
                      },
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
            builder: (context) {
              return AlertDialog(
                title: Text("nhap du lieu"),
                actions: [
                  Text("ten san pham"),
                  TextFormField(controller: nameProduct),
                  Text("gia"),
                  TextFormField(controller: price),
                  Text("so luong"),
                  TextFormField(controller: quanity),
                  TextButton(
                    onPressed: () {
                      context.read<CrudProductBloc>().add(
                        AddProduct(
                          int.parse(price.text),
                          nameProduct.text,
                          int.parse(quanity.text),
                        ),
                      );
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
