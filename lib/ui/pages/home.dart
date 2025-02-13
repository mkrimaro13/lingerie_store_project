import 'package:lingerie_store_project/api/api.dart';
import 'package:lingerie_store_project/models/product_model.dart';
import 'package:lingerie_store_project/layout/colors.dart';
import 'package:lingerie_store_project/ui/widgets/home/button_navigation_bar.dart';
import 'package:lingerie_store_project/ui/widgets/home/floating_action_button.dart';
import 'package:lingerie_store_project/ui/widgets/home/list_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

Widget homePage(BuildContext context) {
  fetchProducts();
  return MaterialApp(
      title: 'Velora',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Color(BrandColors.brandPastelPurple1.value)),
        useMaterial3: true,
        textTheme: GoogleFonts.notoSerifOttomanSiyaqTextTheme(),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(BrandColors.appBarColor.value),
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
                Color(BrandColors.brandPastelPurple1.value),
                Color(BrandColors.brandPastelBlue.value)
              ])),
          // child: customListView(context, products),
          child: FutureBuilder<List<ProductModel>>(
            future: fetchProducts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: CircularProgressIndicator()); // Loading state
              } else if (snapshot.hasError) {
                return Center(
                    child: Text('Error: ${snapshot.error}')); // Error state
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(
                    child: Text('No products available')); // No data state
              } else {
                return customListView(context, snapshot.data!); // Data loaded
              }
            },
          ),
        ),
        bottomNavigationBar: homeButtonNavigationBar(context),
        floatingActionButton: homeFloatingActionButton(
            context, BrandColors.brandPastelPurple2.value),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ));
}
