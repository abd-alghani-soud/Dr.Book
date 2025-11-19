part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.getAllBooksState = RequestStatus.init,
    this.getBestSellerState = RequestStatus.init,
    this.getAllBooks = const [],
    this.getBestSellerBooks = const [],
    this.errorMessage = '',
  });

  final RequestStatus getBestSellerState;
  final RequestStatus getAllBooksState;
  final List<BookModel> getBestSellerBooks;
  final List<BookModel> getAllBooks;
  final String errorMessage;

  HomeState copyWith({
    RequestStatus? getBestSellerState,
    RequestStatus? getAllBooksState,
    List<BookModel>? getBestSellerBooks,
    List<BookModel>? getAllBooks,
    String? errorMessage,
  }) {
    return HomeState(
      errorMessage: errorMessage ?? this.errorMessage,
      getBestSellerState: getBestSellerState ?? this.getBestSellerState,
      getAllBooksState: getAllBooksState ?? this.getAllBooksState,
      getBestSellerBooks: getBestSellerBooks ?? this.getBestSellerBooks,
      getAllBooks: getAllBooks ?? this.getAllBooks,
    );
  }

  @override
  List<Object> get props => [
    getAllBooks,
    getAllBooksState,
    errorMessage,
    getBestSellerState,
    getBestSellerBooks,
  ];
}
