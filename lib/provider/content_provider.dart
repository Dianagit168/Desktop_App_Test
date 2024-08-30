import 'package:flutter/material.dart';

class ContentProvider extends ChangeNotifier {
  String? content = '';
  String? exContent = '';

  void changeContent(String newContent) {
    content = newContent;
    notifyListeners();
  }

  void changeContentEx(String newContentEx) {
    exContent = newContentEx;
    notifyListeners();
  }
}
