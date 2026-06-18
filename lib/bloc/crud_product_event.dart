abstract class CrudProductEvent {
  const CrudProductEvent();
}

class ProductAdded extends CrudProductEvent {
  final String name;
  final int price;
  final int quanity;

  const ProductAdded({
    required this.name,
    required this.price,
    required this.quanity,
  });
}

class ProductDeleted extends CrudProductEvent {
  final int index;

  const ProductDeleted(this.index);
}

class ProductEdited extends CrudProductEvent {
  final int index;
  final String name;
  final int price;
  final int quanity;

  const ProductEdited({
    required this.index,
    required this.name,
    required this.price,
    required this.quanity,
  });
}

class ProductSearchChanged extends CrudProductEvent {
  final String keyWord;

  const ProductSearchChanged(this.keyWord);
}
