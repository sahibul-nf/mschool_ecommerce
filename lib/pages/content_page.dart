import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mschool_ecommerce/models/content.dart';
import 'package:mschool_ecommerce/pages/content_detail_page.dart';
import 'package:mschool_ecommerce/providers/dark_mode_provider.dart';
import 'package:mschool_ecommerce/themes/utils.dart';
import 'package:mschool_ecommerce/widgets/markdown_widget.dart';

class ContentPage extends ConsumerWidget {
  const ContentPage(
    this.content, {
    Key? key,
    this.isTour = false,
    this.pageIndex,
  }) : super(key: key);
  final Content content;
  final bool isTour;
  final int? pageIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(darkModeProvider);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Column(
            children: [
              const SizedBox(height: 40),
              Image.asset(
                isDarkMode ? content.imageDark! : content.image!,
                fit: BoxFit.scaleDown,
                height:
                    MediaQuery.of(context).size.height * (isTour ? 0.35 : 0.3),
              ),
              const SizedBox(height: 20),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: SelectableText.rich(
                  TextSpan(
                    text: content.title!,
                    style: GoogleFonts.oswald(
                      textStyle: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        height: 1.3,
                        fontSize: smallScreen(context) ? 20 : 26,
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
                          style: GoogleFonts.oswald(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: const Color(0xffc16464),
                              height: 1.3,
                              fontSize: smallScreen(context) ? 18 : 21,
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
          const Spacer(),
          // read more button
          if (!isTour && pageIndex != 0)
            Flexible(
              child: Column(
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
                  const Flexible(child: SizedBox(height: 20)),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
