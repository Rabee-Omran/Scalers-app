import 'package:flutter/material.dart';
import 'logo_loader.dart';
import '../resources/values_manager.dart';

class LoadingWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final double? padding;
  final String message;
  const LoadingWidget({
    super.key,
    this.message = "",
    this.height,
    this.width,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: AppSize.s10.toDouble(), horizontal: AppSize.s10.toDouble()),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: height,
              width: width,
              child: const LogoLoader(),
            ),
          ),
          if (message != "")
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: AppSize.s8,
                ),
                Text(
                  message,
                ),
              ],
            )
        ],
      ),
    );
  }
}
