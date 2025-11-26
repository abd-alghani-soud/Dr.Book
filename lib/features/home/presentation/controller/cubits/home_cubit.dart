import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly_app/core/utils/request_status.dart';
import 'package:bookly_app/features/home/data/model/book_model.dart';
import 'package:bookly_app/features/home/data/repository/book_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'home_state.dart';

@lazySingleton
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.repo) : super(HomeState());

  final BookRepo repo;

  Future<void> getAllBooks() async {
    print('load');
    emit(state.copyWith(getAllBooksState: RequestStatus.loading));
    final result = await repo.getAllBooks();
    result.fold(
      (failure) {
        print('faileddddddd$failure');
        emit(
          state.copyWith(
            getAllBooksState: RequestStatus.failed,
            errorMessage: failure.message,
          ),
        );
      },
      (books) {
        print('succcccccccccccccc$books');
        emit(
          state.copyWith(
            getAllBooksState: RequestStatus.success,
            getAllBooks: books,
          ),
        );
      },
    );
  }

  Future<void> getBestSellerBooks() async {
    print('load best');
    emit(state.copyWith(getBestSellerState: RequestStatus.loading));
    final result = await repo.getBestSellerBooks();
    result.fold(
      (failure) {
        print('faiiiiiiiiiiiiiiiiiiiiil$failure');
        emit(
          state.copyWith(
            getBestSellerState: RequestStatus.failed,
            errorMessage: failure.message,
          ),
        );
      },
      (books) {
        print('succ$books 12');
        emit(
          state.copyWith(
            getBestSellerState: RequestStatus.success,
            getBestSellerBooks: books,
          ),
        );
      },
    );
  }
}
