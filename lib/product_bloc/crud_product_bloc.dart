import 'package:bloc/bloc.dart';
import 'package:practice_login_product_sds/bloc/crud_product_event.dart';
import 'package:practice_login_product_sds/bloc/crud_product_state.dart';

class CrudProductBloc extends Bloc<CrudProductEvent, CrudProductState>{
  CrudProductBloc() :super(CrudProductState(name: [],price: [],quanity: [])){
    on<AddProduct>(_addProduct);
    on<deleteProduct>(_deleteProduct);
    on<onEdited>(_editProduct);
    on<SearchProduct>(_searchProduct);
  }
  void _addProduct(AddProduct event, Emitter<CrudProductState> emit){
        final newNameProducts = List<String>.from(state.name);
        final newPrice = List<int>.from(state.price);
        final newQuanity = List<int>.from(state.quanity);
        newNameProducts.add(event.name);
        newPrice.add(event.price);
        newQuanity.add(event.quanity);


        emit(CrudProductState(name: newNameProducts,price:  newPrice, quanity: newQuanity));


  }
   void _deleteProduct(deleteProduct event, Emitter<CrudProductState> emit){
        final newNameProducts = List<String>.from(state.name);
        final newPrice = List<int>.from(state.price);
        final newQuanity = List<int>.from(state.quanity);
        newNameProducts.remove(event.name);
        newPrice.remove(event.price);
        newQuanity.remove(event.quanity);


        emit(CrudProductState(name: newNameProducts,price:  newPrice, quanity: newQuanity));
  }
  void _editProduct(onEdited event, Emitter<CrudProductState> emit){
        final newNameProducts = List<String>.from(state.name);
        final newPrice = List<int>.from(state.price);
        final newQuanity = List<int>.from(state.quanity);
        newNameProducts[event.index] = event.name;
        newPrice[event.index] = event.price;
       newQuanity[event.index] = event.quanity;


        emit(CrudProductState(name: newNameProducts,price:  newPrice, quanity: newQuanity));
  }
  void _searchProduct(SearchProduct event, Emitter<CrudProductState> emit){
   
    emit( state.copyWith(searchKeyWord: event.keyWord));
  }
}
