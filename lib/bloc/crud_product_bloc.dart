import 'package:bloc/bloc.dart';
import 'package:practice_login_product_sds/bloc/crud_product_event.dart';
import 'package:practice_login_product_sds/bloc/crud_product_state.dart';

class CrudProductBloc extends Bloc<CrudProductEvent, CrudProductState> {
  CrudProductBloc()
      : super(
          const CrudProductState(
            names: [],
            prices: [],
            quanities: [],
          ),
        ) {
    on<ProductAdded>(_addProduct);
    on<ProductDeleted>(_deleteProduct);
    on<ProductEdited>(_editProduct);
    on<ProductSearchChanged>(_searchProduct);
  }

  void _addProduct(ProductAdded event, Emitter<CrudProductState> emit) {
    final newNames = List<String>.from(state.names);
    final newPrices = List<int>.from(state.prices);
    final newQuanities = List<int>.from(state.quanities);

    newNames.add(event.name);
    newPrices.add(event.price);
    newQuanities.add(event.quanity);

    emit(
      state.copyWith(
        names: newNames,
        prices: newPrices,
        quanities: newQuanities,
      ),
    );
  }

  void _deleteProduct(ProductDeleted event, Emitter<CrudProductState> emit) {
    if (event.index < 0 || event.index >= state.names.length) return;

    final newNames = List<String>.from(state.names)..removeAt(event.index);
    final newPrices = List<int>.from(state.prices)..removeAt(event.index);
    final newQuanities = List<int>.from(state.quanities)..removeAt(event.index);

    emit(
      state.copyWith(
        names: newNames,
        prices: newPrices,
        quanities: newQuanities,
      ),
    );
  }

  void _editProduct(ProductEdited event, Emitter<CrudProductState> emit) {
    if (event.index < 0 || event.index >= state.names.length) return;

    final newNames = List<String>.from(state.names);
    final newPrices = List<int>.from(state.prices);
    final newQuanities = List<int>.from(state.quanities);

    newNames[event.index] = event.name;
    newPrices[event.index] = event.price;
    newQuanities[event.index] = event.quanity;

    emit(
      state.copyWith(
        names: newNames,
        prices: newPrices,
        quanities: newQuanities,
      ),
    );
  }

  void _searchProduct(
    ProductSearchChanged event,
    Emitter<CrudProductState> emit,
  ) {
    emit(state.copyWith(searchKeyword: event.keyWord));
  }
}
