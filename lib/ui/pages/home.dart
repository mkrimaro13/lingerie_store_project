import 'package:lingerie_store_project/models/product_model.dart';
import 'package:lingerie_store_project/layout/colors.dart';
import 'package:lingerie_store_project/ui/widgets/home/button_navigation_bar.dart';
import 'package:lingerie_store_project/ui/widgets/home/floating_action_button.dart';
import 'package:lingerie_store_project/ui/widgets/home/list_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

BrandColors brandColors = BrandColors();

Widget homePage(BuildContext context) {
  return MaterialApp(
      title: 'Velora',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Color(brandColors.brandPastelPurple1)),
        useMaterial3: true,
        textTheme: GoogleFonts.notoSerifOttomanSiyaqTextTheme(),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(brandColors.appBarColor),
          centerTitle: true,
          title: Text('Velora Lingerie Shop'),
        ),
        body: Container(
          // color en hex siempre es 0xff + hex
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color(brandColors.brandPastelPurple1),
                Color(brandColors.brandPastelBlue)
              ])),
          child: customListView(context, products),
        ),
        // floatingActionButton: FloatingActionButton(
        //   child: Icon(Icons.add_shopping_cart),
        //   onPressed: () => {log('Button pressed: add_shopping_cart')},
        // ),
        bottomNavigationBar: homeButtonNavigationBar(context),
        floatingActionButton:
            homeFloatingActionButton(context, brandColors.brandPastelPurple2),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ));
}
