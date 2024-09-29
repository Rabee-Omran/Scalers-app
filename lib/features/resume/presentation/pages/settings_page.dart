import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../config/locale/app_localizations_setup.dart';

import '../../../../config/locale/app_localizations.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/resources/strings_manager.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppStrings.settings.tr(context),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SettingTile(
                title: AppStrings.language.tr(context),
                onTap: () => GoRouter.of(context).go(Routes.languages),
                value: AppLocalizations.of(context)?.languageName,
                leading: const Icon(Icons.language_outlined),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SettingTile extends StatelessWidget {
  const SettingTile({
    super.key,
    required this.title,
    required this.onTap,
    required this.leading,
    this.value,
  });
  final String title;
  final VoidCallback onTap;
  final String? value;
  final Widget leading;
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: .3,
      margin: EdgeInsets.zero,
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.sp)),
        ),
        onTap: onTap,
        tileColor: Theme.of(context).cardColor,
        title: Text(title),
        leading: leading,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (value != null)
              Text(
                value!,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            SizedBox(width: 3.sp),
            Icon(
              Icons.arrow_forward_ios,
              size: 18.sp,
            ),
          ],
        ),
      ),
    );
  }
}
