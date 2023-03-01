import 'package:flutter/material.dart';

bool smallScreen(BuildContext context) =>
    MediaQuery.of(context).size.height <= 700;
