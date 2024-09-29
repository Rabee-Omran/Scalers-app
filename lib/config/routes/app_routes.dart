import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../locale/app_localizations_setup.dart';
import '../../core/resources/strings_manager.dart';
import '../../features/jobs/presentation/bloc/job_details_cubit/job_details_cubit.dart';
import '../../features/jobs/presentation/pages/home_navigator.dart';
import '../../features/jobs/presentation/pages/job_details_page.dart';
import '../../features/jobs/presentation/pages/jobs_page.dart';
import '../../features/resume/presentation/pages/languages_page.dart';
import '../../features/resume/presentation/pages/settings_page.dart';
import '../../features/settings/presentation/pages/resume_page.dart';
import '../../injection_container.dart';
import '../locale/app_localizations.dart';

class Routes {
  static String jobs = '/';
  static String resume = '/resume';
  static String settings = '/settings';
  static String languages = '$settings/languages';
  static String jobDetails(String uuid) => '/details/$uuid';
}

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: Routes.jobs,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => HomeNavigator(
        child: child,
      ),
      routes: [
        GoRoute(
          path: Routes.jobs,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: JobsPage(),
          ),
          routes: [
            GoRoute(
              path: 'details/:uuid',
              redirect: (context, state) {
                if (state.pathParameters['uuid'] == null ||
                    state.pathParameters['uuid'].runtimeType != String ||
                    (state.pathParameters['uuid'] as String).isEmpty) {
                  return Routes.jobs;
                }
                return null;
              },
              pageBuilder: (context, state) => SlideTransitionPage(
                child: BlocProvider(
                  create: (context) => sl<JobDetailsCubit>(),
                  child: JobDetailsPage(
                      jobUuid: state.pathParameters['uuid'] as String),
                ),
              ),
            ),
          ],
        ),
        GoRoute(
          path: Routes.resume,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: ResumePage(),
          ),
        ),
        GoRoute(
          path: '/settings',
          name: 'settings',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: SettingsPage()),
          routes: [
            GoRoute(
              path: 'languages',
              name: "Languages",
              pageBuilder: (context, state) =>
                  const SlideTransitionPage(child: LanguagesPage()),
            ),
          ],
        ),
      ],
    ),
  ],
  errorPageBuilder: (context, state) =>
      const NoTransitionPage(child: PageNotFound()),
);

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.pageNotFound.tr(context),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              TextButton(
                onPressed: () {
                  if (GoRouter.of(context).canPop()) {
                    Navigator.pop(context);
                  } else {
                    context.go(Routes.jobs);
                  }
                },
                child: Text(GoRouter.of(context).canPop()
                    ? AppStrings.back.tr(context)
                    : AppStrings.home.tr(context)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SlideTransitionPage<T> extends CustomTransitionPage<T> {
  const SlideTransitionPage({
    required super.child,
    super.name,
    super.arguments,
    super.restorationId,
    super.key,
  }) : super(
          transitionsBuilder: _transitionsBuilder,
          transitionDuration: const Duration(milliseconds: 300),
        );

  static Widget _transitionsBuilder(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    final begin = AppLocalizations.of(context)!.isRTL
        ? const Offset(-1.0, 0.0)
        : const Offset(1.0, 0.0);
    const end = Offset.zero;
    const curve = Curves.ease;

    final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    return SlideTransition(
      position: tween.animate(animation),
      child: child,
    );
  }
}
