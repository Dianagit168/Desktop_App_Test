import 'package:flutter/material.dart';

class ContentProvider extends ChangeNotifier {
  String? content = '';

  void changeContent(String newContent) {
    content = newContent;
    notifyListeners();
  }
}
