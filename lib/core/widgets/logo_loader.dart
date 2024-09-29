import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../config/locale/app_localizations_setup.dart';
import '../resources/font_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/styles_manager.dart';

class LogoLoader extends StatefulWidget {
  const LogoLoader({super.key, this.size});
  final double? size;

  @override
  State<LogoLoader> createState() => _LogoLoaderState();
}

class _LogoLoaderState extends State<LogoLoader> {
  late Timer _timer;
  String _displayedText = '';
  int _dotCount = 0;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        _dotCount = (_dotCount + 1) % 4;
        _displayedText = '.' * _dotCount;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Row(
              children: [
                Text(
                  AppStrings.scalers.tr(context),
                  style: getBoldStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: FontSize.s16),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  width: 20.sp,
                  child: Text(
                    _displayedText,
                    style: getBoldStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: FontSize.s16),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
