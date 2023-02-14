import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mschool_ecommerce/models/content.dart';
import 'package:mschool_ecommerce/pages/content_page.dart';

final tutorialProvider =
    ChangeNotifierProvider<TutorialProvider>((ref) => TutorialProvider());

class TutorialProvider extends ChangeNotifier {
  // load data
  Future<void> loadData() async {
    String data = await rootBundle.loadString("assets/contents.json");
    final jsonResult = jsonDecode(data); //latest Dart

    var list = <Widget>[];
    for (var v in (jsonResult as List)) {
      list.add(ContentPage(
        Content.fromJson(v),
        isTour: true,
      ));
    }

    pages.addAll(list.reversed);
    notifyListeners();
  }

  // init
  void init() {
    loadData();

    _firstTime = true;
    _currentPage = 0;
    _pageController = PageController(initialPage: _currentPage);

    setCurrentPageToNextPage();
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  // first time app is opened
  bool _firstTime = true;
  bool get firstTime => _firstTime;

  // current page
  int _currentPage = 0;
  int get currentPage => _currentPage;

  // pages
  final List<Widget> _pages = [];
  List<Widget> get pages => _pages;

  // page controller
  late PageController _pageController;
  PageController get pageController => _pageController;

  // set first time
  void setFirstTime(bool value) {
    _firstTime = value;
    notifyListeners();
  }

  // set current page to next page every one second
  void setCurrentPageToNextPage() async {
    // setiap 1 detik
    await Future.delayed(const Duration(seconds: 1), () {
      // jika current page kurang dari jumlah page
      if (_currentPage < _pages.length - 1) {
        // maka current page ditambah 1
        _currentPage++;
        // dan page controller diarahkan ke current page
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOut,
        );
        notifyListeners();

        // dan setelah 1 detik, jalankan kembali fungsi ini
        setCurrentPageToNextPage();
      } else {
        _firstTime = false;
        notifyListeners();
      }
    });
  }

  // set current page
  void setCurrentPage(int value) {
    _currentPage = value;
    notifyListeners();
  }
}
