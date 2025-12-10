import 'package:bookly_app/core/error/failures.dart';
import 'package:bookly_app/core/services/api_service.dart';
import 'package:bookly_app/features/home/data/model/book_model.dart';
import 'package:bookly_app/features/search/data/repository/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SearchRepo)
class SearchRepoImp implements SearchRepo {
  final ApiService data;

  SearchRepoImp(this.data);

  @override
  Future<Either<Failure, List<BookModel>>> searchRepo(String q) async {
    try {
      final result = await data.get(
        endPoints: 'volumes?Filtering=free-ebooks&q=$q',
      );
      final List<BookModel> book = [];
      for (var e in result['items']) {
        book.add(BookModel.fromJson(e));
      }
      return right(book);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
