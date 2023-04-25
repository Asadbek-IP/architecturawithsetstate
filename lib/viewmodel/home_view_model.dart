import 'package:flutter/cupertino.dart';

import '../model/post.dart';
import '../services/api_service.dart';

class HomePageViewModel extends ChangeNotifier{
  List<Post> posts = [];
  bool isLoading = false;

  getApi() {
    isLoading = true;
    notifyListeners();
    ApiService.getAllPost().then((value) {
      posts = value;
      isLoading = false;
      notifyListeners();
    });
  }
}
