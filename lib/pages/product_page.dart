import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_login_product_sds/bloc/crud_product_bloc.dart';
import 'package:practice_login_product_sds/bloc/crud_product_event.dart';
import 'package:practice_login_product_sds/bloc/crud_product_state.dart';
import 'package:practice_login_product_sds/pages/card_product.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  void _showAddDialog(BuildContext context) {
    String name = '';
    String price = '';
    String quanity = '';

    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('nhap du lieu'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('ten san pham'),
              TextField(
                onChanged: (value) => name = value,
              ),
              const SizedBox(height: 12),
              const Text('gia'),
              TextField(
                onChanged: (value) => price = value,
              ),
              const SizedBox(height: 12),
              const Text('so luong'),
              TextField(
                onChanged: (value) => quanity = value,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('huy'),
            ),
            TextButton(
              onPressed: () {
                final parsedPrice = int.tryParse(price);
                final parsedQuanity = int.tryParse(quanity);

                if (name.trim().isEmpty ||
                    parsedPrice == null ||
                    parsedQuanity == null) {
                  return;
                }

                context.read<CrudProductBloc>().add(
                      ProductAdded(
                        name: name,
                        price: parsedPrice,
                        quanity: parsedQuanity,
                      ),
                    );
                Navigator.pop(dialogContext);
              },
              child: const Text('them'),
            ),
          ],
        );
      },
    );
  }

  void _showEditDialog(
    BuildContext context,
    CrudProductState state,
    int index,
  ) {
    String name = state.names[index];
    String price = state.prices[index].toString();
    String quanity = state.quanities[index].toString();

    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Sua du lieu'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('ten san pham'),
              TextFormField(
                initialValue: name,
                onChanged: (value) => name = value,
              ),
              const SizedBox(height: 12),
              const Text('gia'),
              TextFormField(
                initialValue: price,
                onChanged: (value) => price = value,
              ),
              const SizedBox(height: 12),
              const Text('so luong'),
              TextFormField(
                initialValue: quanity,
                onChanged: (value) => quanity = value,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('huy'),
            ),
            TextButton(
              onPressed: () {
                final parsedPrice = int.tryParse(price);
                final parsedQuanity = int.tryParse(quanity);

                if (name.trim().isEmpty ||
                    parsedPrice == null ||
                    parsedQuanity == null) {
                  return;
                }

                context.read<CrudProductBloc>().add(
                      ProductEdited(
                        index: index,
                        name: name,
                        price: parsedPrice,
                        quanity: parsedQuanity,
                      ),
                    );
                Navigator.pop(dialogContext);
              },
              child: const Text('them'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Tìm sản phẩm',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                context.read<CrudProductBloc>().add(ProductSearchChanged(value));
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<CrudProductBloc, CrudProductState>(
              builder: (context, state) {
                final filteredIndexes = List.generate(
                  state.names.length,
                  (index) => index,
                ).where((index) {
                  return state.names[index]
                      .toLowerCase()
                      .contains(state.searchKeyword.toLowerCase());
                }).toList();

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
                      name: state.names[index],
                      price: state.prices[index].toString(),
                      quanity: state.quanities[index].toString(),
                      onDeleted: () {
                        context.read<CrudProductBloc>().add(
                              ProductDeleted(index),
                            );
                      },
                      onEdited: () {
                        _showEditDialog(context, state, index);
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
        onPressed: () => _showAddDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
