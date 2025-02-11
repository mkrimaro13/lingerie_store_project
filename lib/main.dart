import 'package:flutter/material.dart';
import 'package:lingerie_store_project/ui/pages/home.dart';

void main() {
  runApp(const LingerieStore());
}

class LingerieStore extends StatelessWidget {
  const LingerieStore({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return homePage(context);
  }
}
