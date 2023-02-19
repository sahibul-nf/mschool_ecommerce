import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mschool_ecommerce/models/content.dart';
import 'package:mschool_ecommerce/pages/content_detail_page.dart';
import 'package:mschool_ecommerce/providers/dark_mode_provider.dart';
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
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: (isTour) ? 0 : 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const SizedBox(height: 20),
              Image.asset(
                isDarkMode ? content.imageDark! : content.image!,
                fit: BoxFit.scaleDown,
                height: MediaQuery.of(context).size.height *
                    (isPortrait ? 0.35 : 0.5),
              ),
              const SizedBox(height: 20),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: SelectableText.rich(
                  TextSpan(
                    text: content.title!,
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        fontFamily: "RobotoSerif",
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        height: 1.3,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              if (content.subtitle!.isNotEmpty)
                Row(
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: SelectableText.rich(
                        TextSpan(
                          text: content.subtitle!,
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                              fontFamily: "RobotoSerif",
                              fontWeight: FontWeight.bold,
                              height: 1.3,
                              color: Color(0xffc16464),
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              if (content.subtitle!.isNotEmpty) const SizedBox(height: 10),
              MyMarkdownWidget(content.shortDescription!),
            ],
          ),

          if (!isTour) const SizedBox(height: 10),
          // read more button
          if (!isTour)
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
            )
        ],
      ),
    );
  }
}
