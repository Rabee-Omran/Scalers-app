import 'package:flutter/material.dart';
import '../../../../config/locale/app_localizations_setup.dart';
import '../../../../core/resources/strings_manager.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(AppStrings.comingSoon.tr(context)),
    );
  }
}
