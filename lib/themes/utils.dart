import 'package:flutter/material.dart';

bool smallScreen(BuildContext context) =>
    MediaQuery.of(context).size.height < 670;
bool heightScreen(BuildContext context) =>
    MediaQuery.of(context).size.height > 850;
