import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mschool_ecommerce/providers/dark_mode_provider.dart';
import 'package:mschool_ecommerce/themes/colors.dart';

class WelcomePage extends ConsumerWidget {
  // final void Function() startLesson;
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    final isDarkMode = ref.watch(darkModeProvider);
    return Scaffold(
      appBar: AppBar(
        shape: const Border(top: BorderSide(color: Colors.green, width: 3)),
        backgroundColor: isDarkMode ? AppColors.black : Colors.white,
        centerTitle: false,
        titleSpacing: 0,
        shadowColor: Theme.of(context).shadowColor,
        elevation: 1,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                      child: Image.asset('assets/images/logo-master.png'),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: AutoSizeText(
                    "Accelerated Learning",
                    maxLines: 1,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontFamily: "RobotoSerif",
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    PopupMenuButton<String>(
                      icon: Icon(
                        Icons.more_vert,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.black
                            : Colors.white,
                      ),
                      onSelected: (String value) =>
                          ref.read(darkModeProvider.notifier).switchDarkMode(),
                      itemBuilder: (BuildContext context) {
                        return {
                          Theme.of(context).brightness == Brightness.light
                              ? 'Dark Mode'
                              : 'Light Mode'
                        }.map((String choice) {
                          return PopupMenuItem<String>(
                            value: choice,
                            child: Text(choice),
                          );
                        }).toList();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Theme.of(context).backgroundColor.withOpacity(0.9),
              BlendMode.darken,
            ),
            image: AssetImage(
              isPortrait
                  ? "assets/images/backPortrait.png"
                  : "assets/images/backLandscape.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              isPortrait
                  ? Column(
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          width: 60,
                          height: 60,
                        ),
                        const SizedBox(height: 15),
                        AutoSizeText(
                          'Welcome',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 24,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          width: 60,
                          height: 60,
                        ),
                        const SizedBox(width: 15),
                        AutoSizeText(
                          'Welcome',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 24,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
                    ),
              AutoSizeText(
                "General Data Protection Regulation (GDPR) FlashCards",
                maxLines: 4,
                textAlign: TextAlign.center,
                style: GoogleFonts.oswald(
                  textStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 30,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: AutoSizeText(
                  "Use this flashcards to learn and understand vocabulary, terms and data protection regulations.",
                  maxLines: 5,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.oswald(
                      textStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 18,
                  )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.arrow_forward_sharp,
                    size: 40,
                    color: Color(0xffF16623),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(
          left: 20,
        ),
        color: Colors.blue,
        width: double.infinity,
        height: 50,
        child: Align(
          alignment: Alignment.centerLeft,
          child: AutoSizeText(
            "General Data Protection Regulation (GDPR)",
            maxLines: 1,
            style: GoogleFonts.robotoSlab(
              textStyle: GoogleFonts.robotoSlab(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
