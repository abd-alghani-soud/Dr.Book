import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

@injectable
class ApiService {
  final _baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoints}) async {
    try {
      final response = await _dio.get(
        '$_baseUrl$endPoints',

        queryParameters: {'key': dotenv.env['BOOK_API_KEY'] ?? '',},
      );
      print('GET $_baseUrl -> ${response.statusCode}');
      return response.data;
    } catch (e) {
      print('Dio error: $e');
      rethrow;
    }
  }
}
