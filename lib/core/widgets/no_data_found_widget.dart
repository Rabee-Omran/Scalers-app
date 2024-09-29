import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../config/locale/app_localizations_setup.dart';
import '../resources/strings_manager.dart';

class NoDataFoundWidget extends StatelessWidget {
  const NoDataFoundWidget({super.key, this.message});
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [ 
        Text(
          message ?? AppStrings.noDataFound.tr(context),
          style:
              Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 13.sp),
        ),
      ],
    );
  }
}
