// // import 'dart:developer';

// // import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:markdown_widget/config/style_config.dart';
// // import 'package:styled_text/styled_text.dart';
// // import 'package:url_launcher/url_launcher.dart';

// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:markdown/markdown.dart' as m;
// import 'package:markdown_widget/markdown_widget.dart';
// import 'package:url_launcher/url_launcher.dart';


// MarkdownConfig markdownConfig(BuildContext context,
//         {bool autoSizeText = false}) =>
//     MarkdownConfig(
//       configs: [
//         LinkConfig(
//           style: GoogleFonts.roboto(
//             textStyle: TextStyle(
//               fontFamily: "RobotoSerif",
//               fontWeight: FontWeight.normal,
//               color: const Color(0xffc16464),
//               decoration: TextDecoration.underline,
//               height: 1.5,
//               fontSize: autoSizeText
//                   ? (MediaQuery.of(context).size.longestSide /
//                           MediaQuery.of(context).size.shortestSide) *
//                       16
//                   : 16,
//             ),
//           ),
//           onTap: (url) {
//             log("Opening $url...");
//             launchUrl(Uri.parse(url));
//           },
//         ),
//         PConfig(textStyle: pStyle(context, autoSizeText)),
//       ],
//     );

// // SpanNodeGeneratorWithTag customTextWithTag = SpanNodeGeneratorWithTag(
// //   tag: 'red',
// //   generator: (e, config, visitor) {
// //     return CustomTextNode(e., config, visitor);
// //   },
// // );

// SpanNode? customTextGenerator(
//     m.Node node, MarkdownConfig config, WidgetVisitor visitor) {
//   return CustomTextNode(node, config, visitor);
// }

// class CustomTextNode extends SpanNode {
//   final m.Node node;
//   final MarkdownConfig config;
//   final WidgetVisitor visitor;

//   CustomTextNode(this.node, this.config, this.visitor);

//   @override
//   InlineSpan build() {
//     final textStyle = config.p.textStyle.merge(parentStyle);

//     // handle text node if case tag like <red>text</red>
    


//     if (node is m.Text) {
//       log("Text node: 1");
//       final textNode = node as m.Text;

//       return TextSpan(
//         text: textNode.text,
//         style: textStyle,
//       );
//     }

//     if (node is m.InlineSyntax) {
//       log("Text node: 1.1");
//       final textNode = node as m.InlineSyntax;

//       return TextSpan(
//         text: textNode.toString(),
//         style: textStyle,
//       );
//     }

//     if (node is m.Element) {
//       log("Text node: 2");
//       final element = node as m.Element;
//       if (element.tag == 'red') {
//         final text = element.attributes['text'];
//         return TextSpan(
//           text: text,
//           style: textStyle.copyWith(
//             color: Colors.red,
//           ),
//         );
//       }

//       log("Text node: 3");
//       return TextSpan(
//         text: element.textContent,
//         style: textStyle,
//       );
//     }

//     log("Text node: 4");
//     return TextSpan(
//       text: node.textContent,
//       style: textStyle,
//     );
//   }
// }

// TextStyle pStyle(
//   BuildContext context,
//   bool autoSizeText, {
//   Color? color,
//   FontWeight fontWeight = FontWeight.normal,
// }) {
//   return GoogleFonts.roboto(
//     textStyle: TextStyle(
//       fontFamily: "RobotoSerif",
//       fontWeight: fontWeight,
//       color: color ?? Theme.of(context).primaryColor,
//       height: 1.5,
//       fontSize: autoSizeText
//           ? (MediaQuery.of(context).size.longestSide /
//                   MediaQuery.of(context).size.shortestSide) *
//               16
//           : 16,
//     ),
//   );
// }

// // StyleConfig styleConfig(BuildContext context, {bool autoSizeText = false}) =>
// //     StyleConfig(
// //       ulConfig: UlConfig(
// //         textStyle: GoogleFonts.roboto(
// //           textStyle: TextStyle(
// //             fontFamily: "RobotoSerif",
// //             fontWeight: FontWeight.normal,
// //             color: Theme.of(context).primaryColor,
// //             height: 1.5,
// //             fontSize: autoSizeText
// //                 ? (MediaQuery.of(context).size.longestSide /
// //                         MediaQuery.of(context).size.shortestSide) *
// //                     16
// //                 : 16,
// //           ),
// //         ),
// //       ),
// //       pConfig: PConfig(
// //         textStyle: pStyle(context, autoSizeText),
// //         onLinkTap: (url) {
// //           log("Opening $url...");
// //           if (url != null) {
// //             launchUrl(Uri.parse(url));
// //           }
// //         },
//         // linkStyle: GoogleFonts.roboto(
//         //   textStyle: TextStyle(
//         //     fontFamily: "RobotoSerif",
//         //     fontWeight: FontWeight.normal,
//         //     color: const Color(0xffc16464),
//         //     decoration: TextDecoration.underline,
//         //     height: 1.5,
//         //     fontSize: autoSizeText
//         //         ? (MediaQuery.of(context).size.longestSide /
//         //                 MediaQuery.of(context).size.shortestSide) *
//         //             16
//         //         : 16,
//         //   ),
//         // ),
// //         custom: (element) {
// //           if (element.tag == "orange") {
// //             return Text.rich(
// //               TextSpan(
// //                 text: element.attributes["text"] ?? element.textContent,
// //               ),
// //               style: pStyle(
// //                 context,
// //                 autoSizeText,
// //                 color: const Color(0xffc16464),
// //                 fontWeight: FontWeight.bold,
// //               ),
// //             );
// //           }

// //           if (element.tag == "red") {
// //             return Text.rich(
// //               TextSpan(
// //                 text: element.attributes["text"] ?? element.textContent,
// //                 style: GoogleFonts.roboto(
// //                   textStyle: TextStyle(
// //                     fontFamily: "RobotoSerif",
// //                     color: Colors.pink[300],
// //                     fontWeight: FontWeight.normal,
// //                     // height: 1.032,
// //                     fontSize: autoSizeText
// //                         ? (MediaQuery.of(context).size.longestSide /
// //                                 MediaQuery.of(context).size.shortestSide) *
// //                             16
// //                         : 16,
// //                   ),
// //                 ),
// //               ),
// //             );
// //           }

          // if (element.tag == "tooltip") {
          //   return Tooltip(
          //     message: element.attributes['message'],
          //     triggerMode: TooltipTriggerMode.tap,
          //     textStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
          //           color: Theme.of(context).brightness == Brightness.dark
          //               ? Colors.black
          //               : Colors.white,
          //           fontSize: 16,
          //         ),
          //     child: Text(
          //       element.attributes['text'] ?? element.textContent,
          //       style: GoogleFonts.roboto(
          //         textStyle: TextStyle(
          //           fontFamily: "RobotoSerif",
          //           fontWeight: FontWeight.normal,
          //           decoration: TextDecoration.underline,
          //           fontSize: autoSizeText
          //               ? (MediaQuery.of(context).size.longestSide /
          //                       MediaQuery.of(context).size.shortestSide) *
          //                   16
          //               : 16,
          //         ),
          //       ),
          //     ),
          //   );
          // }

          // if (element.tag == "modal") {
          //   return InkWell(
          //     onTap: () {
          //       showModalBottomSheet(
          //         context: context,
          //         shape: const RoundedRectangleBorder(
          //           borderRadius: BorderRadius.only(
          //             topLeft: Radius.circular(20),
          //             topRight: Radius.circular(20),
          //           ),
          //         ),
          //         builder: (context) => Container(
          //           padding: const EdgeInsets.symmetric(
          //             horizontal: 20,
          //             vertical: 20,
          //           ),
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(20),
          //           ),
          //           child: Column(
          //             mainAxisSize: MainAxisSize.min,
          //             mainAxisAlignment: MainAxisAlignment.start,
          //             children: [
          //               Row(
          //                 mainAxisAlignment: MainAxisAlignment.end,
          //                 children: [
          //                   IconButton(
          //                     icon: const Icon(Icons.close),
          //                     onPressed: () => Navigator.pop(context),
          //                   )
          //                 ],
          //               ),
          //               const Flexible(child: SizedBox(height: 20)),
          //               const Icon(
          //                 Icons.notifications,
          //                 size: 100,
          //               ),
          //               const SizedBox(height: 20),
          //               Text(
          //                 "Turn on notifications",
          //                 style: GoogleFonts.roboto(
          //                   textStyle: TextStyle(
          //                     fontFamily: "RobotoSerif",
          //                     fontWeight: FontWeight.bold,
          //                     color: Theme.of(context).primaryColor,
          //                     fontSize: 20,
          //                   ),
          //                 ),
          //               ),
          //               const SizedBox(height: 20),
          //               Text(
          //                 "Don't miss out on important \nannouncements or live alerts when your \nfavorites air. You can change your \nNotifications settings anytime.",
          //                 textAlign: TextAlign.center,
          //                 style: GoogleFonts.roboto(
          //                   textStyle: TextStyle(
          //                     fontFamily: "RobotoSerif",
          //                     fontWeight: FontWeight.normal,
          //                     color: Theme.of(context).primaryColor,
          //                     fontSize: autoSizeText
          //                         ? (MediaQuery.of(context).size.longestSide /
          //                                 MediaQuery.of(context)
          //                                     .size
          //                                     .shortestSide) *
          //                             16
          //                         : 16,
          //                   ),
          //                 ),
          //               ),
          //               const Flexible(child: SizedBox(height: 40)),
          //             ],
          //           ),
          //         ),
          //       );
          //     },
          //     child: Text(
          //       element.attributes['text'] ?? element.textContent,
          //       style: GoogleFonts.roboto(
          //         textStyle: TextStyle(
          //           fontFamily: "RobotoSerif",
          //           fontWeight: FontWeight.normal,
          //           color: Theme.of(context).primaryColor,
          //           decoration: TextDecoration.underline,
          //           fontSize: autoSizeText
          //               ? (MediaQuery.of(context).size.longestSide /
          //                       MediaQuery.of(context).size.shortestSide) *
          //                   16
          //               : 16,
          //         ),
          //       ),
          //     ),
          //   );
          // }

// //           return Text(
// //             element.textContent,
// //             style: TextStyle(
// //               fontFamily: "RobotoSerif",
// //               color: Theme.of(context).primaryColor,
// //               fontWeight: FontWeight.w400,
// //               fontSize: autoSizeText
// //                   ? (MediaQuery.of(context).size.longestSide /
// //                           MediaQuery.of(context).size.shortestSide) *
// //                       16
// //                   : 16,
// //             ),
// //           );
// //         },
// //       ),
// //     );
