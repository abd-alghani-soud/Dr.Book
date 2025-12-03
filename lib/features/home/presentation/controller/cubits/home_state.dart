part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.getAllBooksState = RequestStatus.init,
    this.getSimilarBooks = const [],
    this.getBestSellerState = RequestStatus.init,
    this.getAllBooks = const [],
    this.getBestSellerBooks = const [],
    this.errorMessage = '',
    this.getSimilarBooksState = RequestStatus.init,
  });

  final RequestStatus getBestSellerState;
  final RequestStatus getAllBooksState;
  final List<BookModel> getBestSellerBooks;
  final List<BookModel> getAllBooks;
  final String errorMessage;
  final RequestStatus getSimilarBooksState;
  final List<BookModel> getSimilarBooks;

  @override
  List<Object> get props => [
    getAllBooks,
    getAllBooksState,
    errorMessage,
    getBestSellerState,
    getBestSellerBooks,
    getSimilarBooks,
    getSimilarBooksState,
  ];

  HomeState copyWith({
    RequestStatus? getBestSellerState,
    RequestStatus? getAllBooksState,
    List<BookModel>? getBestSellerBooks,
    List<BookModel>? getAllBooks,
    String? errorMessage,
    RequestStatus? getSimilarBooksState,
    List<BookModel>? getSimilarBooks,
  }) {
    return HomeState(
      getBestSellerState: getBestSellerState ?? this.getBestSellerState,
      getAllBooksState: getAllBooksState ?? this.getAllBooksState,
      getBestSellerBooks: getBestSellerBooks ?? this.getBestSellerBooks,
      getAllBooks: getAllBooks ?? this.getAllBooks,
      errorMessage: errorMessage ?? this.errorMessage,
      getSimilarBooksState: getSimilarBooksState ?? this.getSimilarBooksState,
      getSimilarBooks: getSimilarBooks ?? this.getSimilarBooks,
    );
  }
}
