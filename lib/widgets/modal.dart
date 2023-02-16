import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void showNotificationModal(BuildContext context) {
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
                fontSize: 16,
              ),
            ),
          ),
          const Flexible(child: SizedBox(height: 40)),
        ],
      ),
    ),
  );
}
