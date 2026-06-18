class CrudProductState {
  final List<String> names;
  final List<int> prices;
  final List<int> quanities;
  final String searchKeyword;

  const CrudProductState({
    required this.names,
    required this.prices,
    required this.quanities,
    this.searchKeyword = '',
  });

  CrudProductState copyWith({
    List<String>? names,
    List<int>? prices,
    List<int>? quanities,
    String? searchKeyword,
  }) {
    return CrudProductState(
      names: names ?? this.names,
      prices: prices ?? this.prices,
      quanities: quanities ?? this.quanities,
      searchKeyword: searchKeyword ?? this.searchKeyword,
    );
  }
}
