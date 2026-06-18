

abstract class CrudProductEvent {
}

class AddProduct extends CrudProductEvent{
  String name ;
  int quanity;
  int price;
  AddProduct(this.price,this.name,this.quanity);
}
class deleteProduct extends CrudProductEvent{

  String name ;
  int quanity;
  int price;
 deleteProduct(this.price,this.name,this.quanity);
}
class onEdited extends CrudProductEvent{
  int index;
  String name ;
  int quanity;
  int price;
 onEdited(this.price,this.name,this.quanity,this.index);
}

class SearchProduct extends CrudProductEvent{
  String keyWord;
  SearchProduct(this.keyWord);
}
