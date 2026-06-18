class CrudProductState {
  final List<String> name;
  final List<int> price;
  final List<int> quanity;
  final String searchKeyWord;
  CrudProductState({
    required this.name,
    required this.price,
    required this.quanity,
    this.searchKeyWord = '',
  });
  CrudProductState copyWith({
    List<String>? name,
    List<int>? price,
    List<int>? quanity,
    String? searchKeyWord,
  }) {
    return CrudProductState(
      name: name ?? this.name,
      price: price ?? this.price,
      quanity: quanity ?? this.quanity,
      searchKeyWord: searchKeyWord ?? this.searchKeyWord
    );
  }
}
