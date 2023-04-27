import 'package:flutter/material.dart';

import '../model/post.dart';
import '../services/api_service.dart';

class CreatePageViewModel extends ChangeNotifier {
  final TextEditingController bodyC = TextEditingController();
  final TextEditingController titleC = TextEditingController();
  bool isLoading = false;

  createPost(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    Post post = Post(userId: 11, id: 11, title: bodyC.text, body: titleC.text);
    ApiService.createPost(post).then((value) {
      isLoading = false;
      notifyListeners();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(value.title!)));
    });
  }

  updatePost(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    Post post = Post(userId: 11, id: 11, title: bodyC.text, body: titleC.text);
    ApiService.putPost(post).then((value) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Yangilandi ${value.title!}")));

      isLoading = false;
      notifyListeners();
      Navigator.pop(context);
    });
  }
}
