import 'package:bloc/bloc.dart';
import 'package:bloc_crud/bloc/crud_event.dart';
import 'package:bloc_crud/bloc/crud_state.dart';
import 'package:bloc_crud/bloc/model.dart';

class CrudBloc extends Bloc<CrudEvent,CrudState> {

  CrudBloc(): super(CrudState([])){
      on<addProduct>(_addProduct);
      on<deleteProduct>(_deleteProduct);


  }

  void _addProduct(addProduct event ,Emitter <CrudState> emit){
      final newList =   List<Product>.from(state.listProduct);
      newList.add(event.pro);
      emit(CrudState(newList));

   }
  void _deleteProduct(deleteProduct event ,Emitter <CrudState> emit){
    final newList =   List<Product>.from(state.listProduct);
      newList.removeAt(event.id);
      emit(CrudState(newList));
  }
} 