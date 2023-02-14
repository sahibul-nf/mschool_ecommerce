import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markdown_widget/config/style_config.dart';
import 'package:url_launcher/url_launcher.dart';

StyleConfig styleConfig(BuildContext context, {bool autoSizeText = false}) =>
    StyleConfig(
      ulConfig: UlConfig(
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
      ),
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
          if (element.tag == "orange") {
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

          if (element.tag == "red") {
            return Text(
              element.attributes['text'] ?? element.textContent,
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  fontFamily: "RobotoSerif",
                  color: Colors.pink[300],
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

          if (element.tag == "modal") {
            return InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  builder: (context) => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () => Navigator.pop(context),
                            )
                          ],
                        ),
                        const Flexible(child: SizedBox(height: 20)),
                        const Icon(
                          Icons.notifications,
                          size: 100,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Turn on notifications",
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              fontFamily: "RobotoSerif",
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Don't miss out on important \nannouncements or live alerts when your \nfavorites air. You can change your \nNotifications settings anytime.",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              fontFamily: "RobotoSerif",
                              fontWeight: FontWeight.normal,
                              color: Theme.of(context).primaryColor,
                              fontSize: autoSizeText
                                  ? (MediaQuery.of(context).size.longestSide /
                                          MediaQuery.of(context)
                                              .size
                                              .shortestSide) *
                                      16
                                  : 16,
                            ),
                          ),
                        ),
                        const Flexible(child: SizedBox(height: 40)),
                      ],
                    ),
                  ),
                );
              },
              child: Text(
                element.attributes['text'] ?? element.textContent,
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontFamily: "RobotoSerif",
                    fontWeight: FontWeight.normal,
                    color: Theme.of(context).primaryColor,
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
