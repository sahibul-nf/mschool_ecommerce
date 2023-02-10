import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markdown_widget/config/style_config.dart';
import 'package:url_launcher/url_launcher.dart';

StyleConfig styleConfig(BuildContext context, {bool autoSizeText = false}) =>
    StyleConfig(
      pConfig: PConfig(
        textStyle: GoogleFonts.roboto(
          textStyle: TextStyle(
            fontFamily: "RobotoSerif",
            fontWeight: FontWeight.normal,
            color: Theme.of(context).primaryColor,
            fontSize: autoSizeText
                ? (MediaQuery.of(context).size.longestSide /
                        MediaQuery.of(context).size.shortestSide) *
                    16
                : 16,
          ),
        ),
        onLinkTap: (url) {
          log("Opening $url...");
          if (url != null) {
            launchUrl(Uri.parse(url));
          }
        },
        linkStyle: GoogleFonts.roboto(
          textStyle: TextStyle(
            fontFamily: "RobotoSerif",
            fontWeight: FontWeight.normal,
            color: const Color(0xffc16464),
            decoration: TextDecoration.underline,
            fontSize: autoSizeText
                ? (MediaQuery.of(context).size.longestSide /
                        MediaQuery.of(context).size.shortestSide) *
                    16
                : 16,
          ),
        ),
        custom: (element) {
          if (element.tag == "red") {
            return Text(
              element.attributes['text'] ?? element.textContent,
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  fontFamily: "RobotoSerif",
                  color: const Color(0xffc16464),
                  fontWeight: FontWeight.bold,
                  fontSize: autoSizeText
                      ? (MediaQuery.of(context).size.longestSide /
                              MediaQuery.of(context).size.shortestSide) *
                          16
                      : 16,
                ),
              ),
            );
          }

          if (element.tag == "redthin") {
            return Text(
              element.attributes['text'] ?? element.textContent,
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  fontFamily: "RobotoSerif",
                  color: const Color(0xffc16464),
                  fontWeight: FontWeight.normal,
                  fontSize: autoSizeText
                      ? (MediaQuery.of(context).size.longestSide /
                              MediaQuery.of(context).size.shortestSide) *
                          16
                      : 16,
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
                element.attributes['text'] ?? element.textContent,
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontFamily: "RobotoSerif",
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.underline,
                    fontSize: autoSizeText
                        ? (MediaQuery.of(context).size.longestSide /
                                MediaQuery.of(context).size.shortestSide) *
                            16
                        : 16,
                  ),
                ),
              ),
            );
          }

          return Text(
            element.textContent,
            style: TextStyle(
              fontFamily: "RobotoSerif",
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w400,
              fontSize: autoSizeText
                  ? (MediaQuery.of(context).size.longestSide /
                          MediaQuery.of(context).size.shortestSide) *
                      16
                  : 16,
            ),
          );
        },
      ),
    );
