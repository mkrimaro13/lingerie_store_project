import 'dart:developer';

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
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
          gradient: LinearGradient(
            colors:
                //  [Colors.blue[100]!, Colors.pink[100]!],
                [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.face),
              onPressed: () {
                controller.updateProgress(0);
                log(controller.progress.value.toString());
                log('face pressed');
              },
            ),
            Obx(() => IconButton(
                  icon: Icon(
                      controller.index.value == 1 || controller.index.value >= 1
                          ? Icons.mark_email_read_rounded
                          : Icons.mail_rounded),
                  onPressed: () {
                    controller.updateProgress(1);
                    log(controller.progress.value.toString());
                    log('mail_rounded pressed');
                  },
                )),
            Obx(() => IconButton(
                  icon: Icon(
                      controller.index.value == 2 || controller.index.value >= 2
                          ? Icons.check_box_rounded
                          : Icons.check_box_outline_blank_rounded),
                  onPressed: () {
                    controller.updateProgress(2);
                    log(controller.progress.value.toString());
                    log('favorite_outline_rounded pressed');
                  },
                )),
            Obx(() => IconButton(
                  icon: Icon(
                      controller.index.value == 3 || controller.index.value >= 3
                          ? Icons.favorite_rounded
                          : Icons.favorite_outline_rounded),
                  onPressed: () {
                    controller.updateProgress(3);
                    log(controller.progress.value.toString());
                    log('favorite_outline_rounded pressed');
                  },
                )),
          ],
        ));
  }
}
