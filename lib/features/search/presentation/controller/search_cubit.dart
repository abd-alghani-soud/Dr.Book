import 'package:bookly_app/core/utils/request_status.dart';
import 'package:bookly_app/features/home/data/model/book_model.dart';
import 'package:bookly_app/features/search/data/repository/search_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'search_state.dart';

@lazySingleton
class SearchCubit extends Cubit<SearchState> {
  final SearchRepo repo;

  SearchCubit(this.repo) : super(SearchState());

  Future<void> getResultFromSearch(String q) async {
    print('loadddd Search');
    emit(state.copyWith(searchState: RequestStatus.loading));
    final result = await repo.searchRepo(q);
    result.fold(
      (failure) {
        print('failureeeee Search $failure');
        emit(
          state.copyWith(
            searchState: RequestStatus.failed,
            errorMessage: failure.message,
          ),
        );
      },
      (book) {
        print('book Search $book');
        emit(
          state.copyWith(
            searchState: RequestStatus.success,
            getBookFromSearch: book,
          ),
        );
      },
    );
  }
}
