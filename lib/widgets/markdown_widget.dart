import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mschool_ecommerce/custom_tags.dart';
import 'package:url_launcher/url_launcher.dart';

class MyMarkdownWidget extends ConsumerWidget {
  const MyMarkdownWidget(this.data, {super.key});
  final String data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MarkdownBody(
      softLineBreak: true,
      fitContent: true,
      shrinkWrap: true,
      selectable: true,
      data: data,
      styleSheet: markdownStyleSheet(context),
      builders: markdownBuilders(context),
      inlineSyntaxes: customInlineSyntaxes,
      onTapLink: (text, href, title) {
        log('Link tapped: $text, $href, $title');
        launchUrl(Uri.parse(href!));
      },
    );
  }
}
