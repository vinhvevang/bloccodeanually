import 'package:bloc_crud/bloc/model.dart';

abstract class CrudEvent {

}
class addProduct extends CrudEvent{
  Product pro;
  addProduct(this.pro);
}

class deleteProduct extends CrudEvent{
  int id;
  deleteProduct(this.id);
}