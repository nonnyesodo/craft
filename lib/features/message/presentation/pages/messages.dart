import 'package:craftman/constants/appcolors.dart';
import 'package:craftman/constants/appscaffold.dart';
import 'package:craftman/constants/apptext.dart';
import 'package:flutter/material.dart';

import '../widgets/export.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AppScaffold(
        color: Appcolors.blue,
        body: Column(
          children: [
            Center(
              child: AppText(
                  text: 'Messages',
                  color: Appcolors.white,
                  fontweight: FontWeight.w700),
            ),
            SizedBox(height: size.height * 0.01),
            AllMessages(size: size)
          ],
        ));
  }
}
