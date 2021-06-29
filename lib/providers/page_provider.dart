import 'package:flutter/material.dart';

class PageProvider extends ChangeNotifier {
  PageController scrollController = new PageController();

  goTo(int index) {
    scrollController.animateToPage(index,
        duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }
}
