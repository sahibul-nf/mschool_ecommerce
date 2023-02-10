import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mschool_ecommerce/models/content.dart';
import 'package:mschool_ecommerce/pages/content_page.dart';
import 'package:mschool_ecommerce/state_managment/dark_mode_state_manager.dart';
import 'package:mschool_ecommerce/themes/colors.dart';

import 'pages/welcome_page.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  // void startLesson() {
  //   pageController.nextPage(
  //     duration: const Duration(milliseconds: 3),
  //     curve: Curves.fastOutSlowIn,
  //   );
  // }

  int _currentPage = 0;
  List<Widget> pages = [];

  late PageController pageController;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    pages = [const WelcomePage()];
    pageController = PageController(initialPage: _currentPage);

    loadData();
  }

  Future<void> loadData() async {
    String data = await rootBundle.loadString("assets/contents.json");
    final jsonResult = jsonDecode(data); //latest Dart

    var list = <Widget>[];
    for (var v in (jsonResult as List)) {
      list.add(ContentPage(Content.fromJson(v)));
    }

    setState(() {
      pages.addAll(list);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ref.watch(darkModeStateManagerProvider);

    return Scaffold(
      backgroundColor:
          isDarkMode ? AppColors.black : Theme.of(context).cardColor,
      body: PageView.builder(
        onPageChanged: (int newpage) {
          setState(() {
            _currentPage = newpage;
          });
        },
        scrollDirection: Axis.horizontal,
        controller: pageController,
        itemCount: pages.length,
        itemBuilder: (context, index) => pages[index],
      ),
    );
  }
}
