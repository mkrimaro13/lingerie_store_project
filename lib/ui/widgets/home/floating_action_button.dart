import 'dart:developer';

import 'package:flutter/material.dart';

Widget homeFloatingActionButton(BuildContext context, int color) {
  return FloatingActionButton(
    backgroundColor: Color(color),
    child: Icon(Icons.add),
    onPressed: () {
      log('FAB Pressed');
    },
  );
}
