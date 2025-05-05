import 'package:flutter/material.dart';
import 'package:lingerie_store_project/widgets/signup/terms.dart';

class TermsView extends StatelessWidget {
  const TermsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Requerimos tu consentimiento para continuar :)',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          AcceptanceTerms(),
        ],
      ),
    );
  }
}