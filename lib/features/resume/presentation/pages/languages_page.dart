import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/locale/app_localizations_setup.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../jobs/presentation/bloc/jobs_bloc/jobs_bloc.dart';
import '../../../../config/locale/localization_cubit/localization_cubit.dart';

class LanguagesPage extends StatelessWidget {
  const LanguagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppStrings.language.tr(context),
          ),
        ),
        body: BlocBuilder<LocalizationCubit, Locale>(
          builder: (context, locale) {
            return ListView(
              padding: EdgeInsets.all(10.sp),
              children: [
                LanguageTile(
                  name: AppStrings.english.tr(context),
                  currentLocale: locale,
                  languageCode: 'en',
                ),
                LanguageTile(
                  name: AppStrings.arabic.tr(context),
                  currentLocale: locale,
                  languageCode: 'ar',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class LanguageTile extends StatelessWidget {
  const LanguageTile({
    super.key,
    required this.name,
    required this.currentLocale,
    required this.languageCode,
  });
  final String name;
  final String languageCode;
  final Locale currentLocale;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.sp),
      child: Card(
        margin: EdgeInsets.zero,
        elevation: .3,
        clipBehavior: Clip.antiAlias,
        child: ListTile(
          onTap: () {
            context
                .read<LocalizationCubit>()
                .changeLanguage(Locale(languageCode));
            context.read<JobsBloc>().add(FetchJobsEv());
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.sp)),
          ),
          tileColor: Theme.of(context).cardColor,
          title: Text(
            name,
            style: currentLocale.toString() == languageCode
                ? TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  )
                : null,
          ),
          trailing: currentLocale.toString() == languageCode
              ? Icon(
                  Icons.check_circle,
                  color: Theme.of(context).colorScheme.primary,
                )
              : null,
        ),
      ),
    );
  }
}
