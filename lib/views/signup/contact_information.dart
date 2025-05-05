import 'package:flutter/material.dart';
import 'package:lingerie_store_project/widgets/signup/contact_form.dart';

class ContactInformationView extends StatelessWidget {
  const ContactInformationView({super.key});

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
            '¿Cómo te podríamos contactar?',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          ContactInformationForm(),
        ],
      ),
    );
  }
}
