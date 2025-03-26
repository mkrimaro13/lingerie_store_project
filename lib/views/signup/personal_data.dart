import 'package:flutter/material.dart';
import 'package:lingerie_store_project/widgets/signup/register_form.dart';

class PersonalDataView extends StatelessWidget {
  const PersonalDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
            spacing: 16,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Cuéntanos sobre ti :)',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              PersonalDataForm(),
            ]));
  }
}
