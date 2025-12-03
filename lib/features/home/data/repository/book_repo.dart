import 'package:bookly_app/core/error/failures.dart';
import 'package:bookly_app/features/home/data/model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class BookRepo {
  Future<Either<Failure, List<BookModel>>> getAllBooks();

  Future<Either<Failure, List<BookModel>>> getSimilarBooks({
    required String category,
  });

  Future<Either<Failure, List<BookModel>>> getBestSellerBooks();
}
