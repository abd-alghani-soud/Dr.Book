import 'package:bookly_app/core/error/failures.dart';
import 'package:bookly_app/features/home/data/model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookModel>>> searchRepo(String q);
}
