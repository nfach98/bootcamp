import 'dart:convert';

import 'package:bootcamp/models/post_model.dart';
import 'package:http/http.dart' as http;

class PostService {
  String baseUrl = "http://jsonplaceholder.typicode.com";

  Future<List<PostModel>> getPosts() async {
    final response = await http.get(
      Uri.parse('$baseUrl/posts'),
      headers:  {
        'Content-type': 'application/json'
      }
    );

    if (response.statusCode == 200) {
      List posts = json.decode(response.body);
      return posts.map((order) => PostModel.fromJson(order)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  Future<PostModel> getPost({required int id}) async {
    final response = await http.get(
      Uri.parse('$baseUrl/posts/$id'),
      headers:  {
        'Content-type': 'application/json'
      }
    );

    if (response.statusCode == 200) {
      return PostModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load posts');
    }
  }
}