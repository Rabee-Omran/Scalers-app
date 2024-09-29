import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../config/locale/app_localizations_setup.dart';
import '../../config/locale/app_localizations.dart';
import '../resources/strings_manager.dart';

class NoInternetConnectionWidget extends StatelessWidget {
  const NoInternetConnectionWidget({
    super.key,
    required this.onRetry,
  });
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.wifi_off_outlined,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(height: 20),
          Text(
            context.tr(AppStrings.noInternetConnection.tr(context)),
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontSize: 13.sp),
          ),
          TextButton(
              onPressed: onRetry,
              child: Text(
                context.tr(AppStrings.retry.tr(context)),
              )),
        ],
      ),
    );
  }
}
