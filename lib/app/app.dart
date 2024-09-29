import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../config/locale/app_localizations_setup.dart';
import '../core/resources/strings_manager.dart';
import '../features/jobs/presentation/bloc/jobs_bloc/jobs_bloc.dart';
import '../config/locale/app_localizations.dart';
import '../config/locale/localization_cubit/localization_cubit.dart';
import '../config/routes/app_routes.dart';
import '../core/resources/theme_manager.dart';
import '../injection_container.dart' as di;

class ScalersApp extends StatelessWidget {
  const  ScalersApp({super.key});
    
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<LocalizationCubit>()),
        BlocProvider(
            create: (context) => di.sl<JobsBloc>()..add(FetchJobsEv())),
      ],
      child: ScreenUtilInit(
          designSize: const Size(375, 767),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) {
            return BlocBuilder<LocalizationCubit, Locale>(
              builder: (context, locale) {
                return MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  routerConfig: router,
                  title: AppStrings.appName.tr(context),
                  theme: appTheme,
                  supportedLocales: const [
                    Locale('en'),
                    Locale('ar'),
                  ],
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  localeResolutionCallback: (locale, supportedLocales) {
                    for (var supportedLocal in supportedLocales) {
                      if (supportedLocal.languageCode == locale!.languageCode) {
                        return supportedLocal;
                      }
                    }
                    return supportedLocales.first;
                  },
                  locale: locale,
                );
              },
            );
          }),
    );
  }
}
