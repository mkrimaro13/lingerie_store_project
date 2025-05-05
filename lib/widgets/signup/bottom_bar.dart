
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lingerie_store_project/controllers/signup.dart';

class BottomBar extends StatelessWidget {
  final ProgressController controller;

  const BottomBar({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 72,
        decoration: decoration(context),
        child: Row(
          spacing: 0,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.face),
            Obx(
              () => Icon(
                  controller.index.value == 1 || controller.index.value >= 1
                      ? Icons.mark_email_read_rounded
                      : Icons.mail_rounded),
            ),
            Obx(
              () => Icon(
                  controller.index.value == 2 || controller.index.value >= 2
                      ? Icons.check_box_rounded
                      : Icons.check_box_outline_blank_rounded),
            ),
            Obx(
              () => Icon(
                controller.index.value == 3 || controller.index.value >= 3
                    ? Icons.favorite_rounded
                    : Icons.favorite_outline_rounded,
              ),
            ),
          ],
        ));
  }
}

BoxDecoration decoration(BuildContext context) {
  return BoxDecoration(
    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    gradient: LinearGradient(
      colors: [
        Theme.of(context).colorScheme.primary,
        Theme.of(context).colorScheme.secondary,
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  );
}
