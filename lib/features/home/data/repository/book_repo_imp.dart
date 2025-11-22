import 'package:bookly_app/core/error/failures.dart';
import 'package:bookly_app/core/services/api_service.dart';
import 'package:bookly_app/features/home/data/model/book_model.dart';
import 'package:bookly_app/features/home/data/repository/book_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BookRepo)
class BookRepoImp implements BookRepo {
  final ApiService data;

  BookRepoImp(this.data);

  @override
  Future<Either<Failure, List<BookModel>>> getAllBooks() async {
    try {
      final result = await data.get(
        endPoints:
            'volumes?Filtering=free-ebooks&Sorting=newest&q=subject:programming',
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

  @override
  Future<Either<Failure, List<BookModel>>> getBestSellerBooks() async {
    try {
      final result = await data.get(
        endPoints: '/volumes?Filtering=free-ebooks&q=subject:programming',
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
