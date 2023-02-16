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

    String text =
        """Er muss <red>genau abwägen</red>, welche Produkte bei den Kunden""";

    return Stack(
      children: [
        SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Center(
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
                Text(
                  content.title!,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontFamily: "RobotoSerif",
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
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
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: MarkdownGenerator(
                //     // generators: [customTextWithTag],
                //     config: markdownConfig(context),
                //     onNodeAccepted: (node, nodeIndex) {
                //       print('Node accepted: $node, $nodeIndex');
                //     },
                //     textGenerator: (node, config, visitor) =>
                //         customTextGenerator(node, config, visitor),
                //   ).buildWidgets(content.shortDescription!),
                // ),
              ],
            ),
          ),
        ),
        // read more button
        Align(
          alignment: const Alignment(0, .9),
          child: SizedBox(
            height: 55,
            width: MediaQuery.of(context).size.width * 0.9,
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
              ),
            ),
          ),
        )
      ],
    );
  }
}
