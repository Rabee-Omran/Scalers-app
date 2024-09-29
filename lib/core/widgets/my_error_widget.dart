import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../config/locale/app_localizations_setup.dart';
import '../resources/strings_manager.dart';
import '../../config/locale/app_localizations.dart';
import '../resources/color_manager.dart';

class MyErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const MyErrorWidget({
    super.key,
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.error,
              color: kRedColor,
            ),
            const SizedBox(height: 20),
            Flexible(
              child: SingleChildScrollView(
                child: Text(
                  context.tr(message),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 10.sp),
            TextButton(
              onPressed: onRetry,
              child: Text(AppStrings.retry.tr(context)),
            ),
          ],
        ),
      ),
    );
  }
}
