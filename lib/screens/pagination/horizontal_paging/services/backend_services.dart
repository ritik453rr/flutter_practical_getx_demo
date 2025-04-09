import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:getx_demo/screens/pagination/horizontal_paging/model/post_model.dart';

class BackendService {
  static Future<List<PostModel>> getPosts(int offset, int limit) async {
    final response = await http.get(
      Uri.parse(
          'https://jsonplaceholder.typicode.com/posts?_start=$offset&_limit=$limit'),
    );

    if (response.statusCode == 200) {
      return PostModel.fromJsonList(json.decode(response.body));
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
