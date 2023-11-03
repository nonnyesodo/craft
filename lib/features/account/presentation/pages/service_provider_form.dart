import 'package:craftman/constants/export.dart';
import 'package:flutter/material.dart';

class ServiceProviderForm extends StatelessWidget {
  const ServiceProviderForm({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        color: Appcolors.blue,
        body: Column(
          children: [CustomAppbar(title: 'Welcome Nonny Schwab')],
        ));
  }
}
