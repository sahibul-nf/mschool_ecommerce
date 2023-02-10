import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:mschool_ecommerce/markdown_style_config.dart';
import 'package:mschool_ecommerce/models/content.dart';
import 'package:mschool_ecommerce/state_managment/dark_mode_state_manager.dart';

class ContentPage extends ConsumerWidget {
  const ContentPage(this.content, {Key? key}) : super(key: key);
  final Content content;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final isDarkMode = ref.watch(darkModeStateManagerProvider);

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Image.asset(
              isDarkMode ? content.imageDark! : content.image!,
              fit: BoxFit.cover,
              height:
                  MediaQuery.of(context).size.height * (isPortrait ? 0.3 : 0.5),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: MarkdownGenerator(
                data: content.content!,
                styleConfig: styleConfig(context),
              ).widgets!,
            )
          ],
        ),
      ),
    );
  }
}
