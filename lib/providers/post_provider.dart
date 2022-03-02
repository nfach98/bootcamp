import 'package:bootcamp/models/post_model.dart';
import 'package:bootcamp/services/post_service.dart';
import 'package:flutter/material.dart';

class PostProvider with ChangeNotifier {
  PostService service = PostService();

  List<PostModel> posts = [];
  PostModel? post;

  void getPosts() async {
    await service.getPosts().then((value) {
      posts = value;
    });
    notifyListeners();
  }

  void getPost({required int id}) async {
    await service.getPost(id: id).then((value) {
      if (value != null) {
        posts = [value];
      } else {
        posts = [];
      }
    });
    notifyListeners();
  }
}