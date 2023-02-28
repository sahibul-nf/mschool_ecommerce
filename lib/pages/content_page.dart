import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mschool_ecommerce/models/content.dart';
import 'package:mschool_ecommerce/pages/content_detail_page.dart';
import 'package:mschool_ecommerce/providers/dark_mode_provider.dart';
import 'package:mschool_ecommerce/themes/text.dart';
import 'package:mschool_ecommerce/themes/utils.dart';
import 'package:mschool_ecommerce/widgets/markdown_widget.dart';

class ContentPage extends ConsumerWidget {
  const ContentPage(
    this.content, {
    Key? key,
    this.isTour = false,
  }) : super(key: key);
  final Content content;
  final bool isTour;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final isDarkMode = ref.watch(darkModeProvider);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Image.asset(
                  isDarkMode ? content.imageDark! : content.image!,
                  fit: BoxFit.scaleDown,
                  height: MediaQuery.of(context).size.height *
                      (isPortrait
                          ? isTour
                              ? 0.4
                              : 0.35
                          : 0.5),
                ),
                const SizedBox(height: 20),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: AutoSizeText.rich(
                    TextSpan(
                      text: content.title!,
                      style: pStyle(
                        context,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        height: 1.3,
                        fontSize: smallScreen(context) ? 20 : 22,
                      ),
                      // style: GoogleFonts.roboto(
                      //   textStyle: TextStyle(
                      //     fontFamily: "RobotoSerif",
                      //     fontWeight: FontWeight.bold,
                      //     color: Theme.of(context).primaryColor,
                      //     height: 1.3,
                      //     fontSize: 22,
                      //   ),
                      // ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 10),
                if (content.subtitle!.isNotEmpty)
                  Row(
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: AutoSizeText.rich(
                          TextSpan(
                            text: content.subtitle!,
                            style: pStyle(
                              context,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xffc16464),
                              height: 1.3,
                              fontSize: smallScreen(context) ? 18 : 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                if (content.subtitle!.isNotEmpty) const SizedBox(height: 8),
                MyMarkdownWidget(content.shortDescription!),
              ],
            ),
          ),
          // if (!isTour) const Spacer(),
          // read more button
          if (!isTour)
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (!isTour) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ContentDetailPage(content),
                        ),
                      );
                    }
                  },
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "Read more",
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                          fontFamily: "RobotoSerif",
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                  ),
                ),
              ],
            ),

          if (!isTour) const SizedBox(height: 20),
        ],
      ),
    );
  }
}
