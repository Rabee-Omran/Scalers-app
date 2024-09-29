// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:scalers/config/locale/app_localizations_setup.dart';
import 'package:scalers/config/routes/app_routes.dart';
import 'package:scalers/core/resources/assets_manager.dart';
import 'package:scalers/core/resources/strings_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeNavigator extends StatefulWidget {
  const HomeNavigator({super.key, required this.child});
  final Widget child;

  @override
  State<HomeNavigator> createState() => _HomeNavigatorState();
}

class _HomeNavigatorState extends State<HomeNavigator> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    _selectedIndex = index;
    switch (index) {
      case 0:
        GoRouter.of(context).go(Routes.jobs);
        break;
      case 1:
        GoRouter.of(context).go(Routes.resume);
        break;
      case 2:
        GoRouter.of(context).go(Routes.settings);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    return WillPopScope(
      onWillPop: () async {
        if (location.startsWith(Routes.jobs)) return true;

        context.go(Routes.jobs);
        return false;
      },
      child: Scaffold(
        body: widget.child,
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4.sp),
                child: SvgPicture.asset(
                  SvgAssets.workIconSvg,
                  color: _selectedIndex == 0
                      ? Theme.of(context).primaryColor
                      : null,
                  height: _selectedIndex == 0 ? 20.sp : 18.sp,
                ),
              ),
              label: AppStrings.jobs.tr(context),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4.sp),
                child: SvgPicture.asset(
                  SvgAssets.workIconSvg,
                  color: _selectedIndex == 1
                      ? Theme.of(context).primaryColor
                      : null,
                  height: _selectedIndex == 1 ? 20.sp : 18.sp,
                ),
              ),
              label: AppStrings.resume.tr(context),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4.sp),
                child: SvgPicture.asset(
                  SvgAssets.settingsIconSvg,
                  color: _selectedIndex == 2
                      ? Theme.of(context).primaryColor
                      : null,
                  height: _selectedIndex == 2 ? 20.sp : 18.sp,
                ),
              ),
              label: AppStrings.settings.tr(context),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.grey,
          selectedFontSize: 13.sp,
          unselectedFontSize: 12.5.sp,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.normal,
          ),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
