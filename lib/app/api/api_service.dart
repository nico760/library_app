import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:library_app_test/app/api/list_book_safe.dart';


class ApiService {
  static const String _key= 'AIzaSyC-VmA4qFSz5SD2tdaPSi4pZcUo0m6So_s';
  String _baseUrl(String keyword) => 'https://www.googleapis.com/books/v1/volumes?q=$keyword+insubject&';
  // var url = '$_baseUrl + $_key';

  Future <GoogleBooksNullSafe> fetchPosts(String keyword) async {
    final response = await http.get(Uri.parse('${_baseUrl(keyword)} + $_key')); //{quiere decir que no se trata de una variable sino que llamo un método}

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body); 
      return GoogleBooksNullSafe.fromJson(responseBody);
    } else {
      throw Exception('Error al cargar los datos');
    }
  }
}