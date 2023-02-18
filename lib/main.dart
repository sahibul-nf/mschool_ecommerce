import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'main_screen.dart';
import 'providers/dark_mode_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool darkMode = ref.watch(darkModeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Web for Slides',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.black,
        backgroundColor: Colors.white,
        /* light theme settings */
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        backgroundColor: Colors.black,
        primaryColor: Colors.white,
        /* dark theme settings */
      ),
      themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
      home: const MainScreen(),
    );
  }
}
