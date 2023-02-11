import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:mschool_ecommerce/markdown_style_config.dart';
import 'package:mschool_ecommerce/models/content.dart';
import 'package:mschool_ecommerce/pages/content_page.dart';
import 'package:mschool_ecommerce/providers/dark_mode_provider.dart';

class ContentPreviewPage extends ConsumerWidget {
  const ContentPreviewPage(
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
                  data: content.shortDescription!,
                  styleConfig: styleConfig(context),
                ).widgets!,
              ),
            ],
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
                      builder: (context) => ContentPage(content),
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
