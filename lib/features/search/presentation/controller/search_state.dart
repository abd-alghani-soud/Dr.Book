part of 'search_cubit.dart';

class SearchState extends Equatable {
  const SearchState({
    this.searchState = RequestStatus.init,
    this.getBookFromSearch = const [],
    this.errorMessage = '',
  });

  final RequestStatus searchState;
  final List<BookModel> getBookFromSearch;
  final String errorMessage;

  @override
  List<Object> get props => [searchState, getBookFromSearch, errorMessage];

  SearchState copyWith({
    RequestStatus? searchState,
    List<BookModel>? getBookFromSearch,
    String? errorMessage,
  }) {
    return SearchState(
      searchState: searchState ?? this.searchState,
      getBookFromSearch: getBookFromSearch ?? this.getBookFromSearch,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
