// import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class PageProvider extends ChangeNotifier {
  PageController scrollController = new PageController();
  List<String> _pages = ['home', 'about', 'pricing', 'contact', 'location'];
  int _currentIndex = 0;

  createScrollController(String routeName) {
    this.scrollController =
        new PageController(initialPage: getPageIndex(routeName));

    html.document.title = capitalize(_pages[getPageIndex(routeName)]);

    this.scrollController.addListener(() {
      final index = (this.scrollController.page ?? 0).round();
      if (index != _currentIndex) {
        html.window.history.pushState(null, 'none', '#/${_pages[index]}');
        html.document.title = capitalize(_pages[index]);
        _currentIndex = index;
      }
    });
  }

  int getPageIndex(String routeName) {
    return _pages.indexOf(routeName) != -1 ? _pages.indexOf(routeName) : 0;
  }

  goTo(int index) {
    // final routeName = _pages[index];

    scrollController.animateToPage(index,
        duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }
}
