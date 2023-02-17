import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mschool_ecommerce/custom_tags.dart';
import 'package:mschool_ecommerce/models/content.dart';
import 'package:mschool_ecommerce/pages/content_detail_page.dart';
import 'package:mschool_ecommerce/providers/dark_mode_provider.dart';
import 'package:url_launcher/url_launcher.dart';

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

    return Stack(
      children: [
        SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Image.asset(
                isDarkMode ? content.imageDark! : content.image!,
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height *
                    (isPortrait ? 0.4 : 0.5),
              ),
              const SizedBox(height: 20),
              SelectableText.rich(
                TextSpan(
                  text: content.title!,
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontFamily: "RobotoSerif",
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                      height: 1.5,
                      fontSize: 20,
                    ),
                  ),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              if (content.subtitle!.isNotEmpty)
                Row(
                  children: [
                    SelectableText.rich(
                      TextSpan(
                        text: content.subtitle!,
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                            fontFamily: "RobotoSerif",
                            fontWeight: FontWeight.bold,
                            color: Color(0xffc16464),
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              if (content.subtitle!.isNotEmpty) const SizedBox(height: 10),
              Center(
                child: MarkdownBody(
                  softLineBreak: true,
                  selectable: true,
                  data: content.shortDescription!,
                  styleSheet: markdownStyleSheet(context),
                  builders: markdownBuilders(context),
                  inlineSyntaxes: customInlineSyntaxes,
                  onTapLink: (text, href, title) {
                    log('Link tapped: $text, $href, $title');
                    launchUrl(Uri.parse(href!));
                  },
                ),
              ),
            ],
          ),
        ),
        // read more button
        if (!isTour)
          Align(
            alignment: const Alignment(0, .95),
            child: SizedBox(
              height: 50,
              // width: MediaQuery.of(context).size.width * 0.9,
              child: ElevatedButton(
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
                child: Text(
                  "Read more",
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                      fontFamily: "RobotoSerif",
                      fontSize: 16,
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                ),
              ),
            ),
          )
      ],
    );
  }
}
