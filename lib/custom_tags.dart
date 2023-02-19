import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:mschool_ecommerce/widgets/modal.dart';

class CustomElementBuilder extends MarkdownElementBuilder {
  CustomElementBuilder(this.context);
  final BuildContext context;

  @override
  Widget? visitElementAfter(md.Element element, TextStyle? preferredStyle) {
    String text = element.textContent;

    if (element.tag == 'red') {
      return SelectableText.rich(
        TextSpan(
          text: text,
          style: pStyle(
            context,
            color: const Color(0xffc16464),
          ),
        ),
      );
    }

    if (element.tag == 'orange') {
      return SelectableText.rich(
        TextSpan(
          text: text,
          style: pStyle(
            context,
            color: const Color(0xffc16464),
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    if (element.tag == "tooltip") {
      return Tooltip(
        message: element.attributes['message'],
        triggerMode: TooltipTriggerMode.tap,
        textStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.black
                  : Colors.white,
              fontSize: 16,
            ),
        child: Text(
          text,
          style: GoogleFonts.roboto(
            textStyle: const TextStyle(
              fontFamily: "RobotoSerif",
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.underline,
              fontSize: 16,
            ),
          ),
        ),
      );
    }

    if (element.tag == "modal") {
      return SelectableText.rich(
        TextSpan(
          text: text,
          style: pStyle(
            context,
            decoration: TextDecoration.underline,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              showNotificationModal(context);
            },
        ),
      );
    }

    return null;
  }
}

List<md.InlineSyntax> customInlineSyntaxes = [
  RedSyntax(),
  OrangeSyntax(),
  ModalSyntax(),
];

Map<String, MarkdownElementBuilder> markdownBuilders(BuildContext context) {
  return {
    'red': CustomElementBuilder(context),
    'orange': CustomElementBuilder(context),
    'modal': CustomElementBuilder(context),
  };
}

MarkdownStyleSheet markdownStyleSheet(BuildContext context) {
  return MarkdownStyleSheet(
    p: pStyle(context),
    a: pStyle(context, decoration: TextDecoration.underline),
    listBullet: pStyle(context, fontWeight: FontWeight.bold),
    listIndent: 16,
  );
}

TextStyle pStyle(
  BuildContext context, {
  Color? color,
  TextDecoration? decoration,
  FontWeight fontWeight = FontWeight.normal,
  double? fontSize,
  double? height,
}) {
  return GoogleFonts.roboto(
    textStyle: TextStyle(
      fontFamily: "RobotoSerif",
      fontWeight: fontWeight,
      color: color ?? Theme.of(context).primaryColor,
      height: height ?? 1.3,
      fontSize: fontSize ?? 16,
      decoration: decoration,
    ),
  );
}

class RedSyntax extends md.InlineSyntax {
  RedSyntax() : super(r'''<red>(.*)</red>''');

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final tag = md.Element.text('red', match[1]!.trim());
    parser.addNode(tag);
    return true;
  }
}

class OrangeSyntax extends md.InlineSyntax {
  OrangeSyntax() : super(r'''<orange>(.*)</orange>''');

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final tag = md.Element.text('orange', match[1]!.trim());
    parser.addNode(tag);
    return true;
  }
}

class ModalSyntax extends md.InlineSyntax {
  ModalSyntax() : super(r'''<modal>(.*)</modal>''');

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final tag = md.Element.text('modal', match[1]!.trim());
    parser.addNode(tag);
    return true;
  }
}
