import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mschool_ecommerce/custom_tags.dart';
import 'package:mschool_ecommerce/models/content.dart';
import 'package:mschool_ecommerce/providers/dark_mode_provider.dart';
import 'package:mschool_ecommerce/themes/colors.dart';
import 'package:mschool_ecommerce/themes/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class ContentDetailPage extends ConsumerWidget {
  const ContentDetailPage(
    this.content, {
    Key? key,
  }) : super(key: key);
  final Content content;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(darkModeProvider);

    return Scaffold(
      backgroundColor: isDarkMode ? AppColors.black : Colors.white,
      appBar: AppBar(
        elevation: 1,
        iconTheme:
            IconThemeData(color: isDarkMode ? Colors.white : AppColors.black),
        backgroundColor: isDarkMode ? AppColors.black : Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          children: [
            Image.asset(
              isDarkMode ? content.imageDark! : content.image!,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.35,
            ),
            const SizedBox(height: 20),
            Text(
              content.title!,
              textAlign: TextAlign.center,
              style: GoogleFonts.oswald(
                textStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  height: 1.3,
                  fontSize: smallScreen(context) ? 20 : 26,
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (content.subtitle!.isNotEmpty)
              Row(
                children: [
                  Text(
                    content.subtitle!,
                    style: GoogleFonts.oswald(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xffc16464),
                        height: 1.3,
                        fontSize: smallScreen(context) ? 18 : 21,
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
                data: content.description!,
                styleSheet: markdownStyleSheet(context),
                builders: markdownBuilders(context),
                inlineSyntaxes: customInlineSyntaxes,
                onTapLink: (text, href, title) {
                  log('Link tapped: $text, $href, $title');
                  launchUrl(Uri.parse(href!));
                },
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
