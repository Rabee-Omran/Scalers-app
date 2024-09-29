import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../config/locale/app_localizations.dart';
import '../resources/strings_manager.dart';

class ToastUtils {
  final BuildContext context;
  late FToast fToast;

  ToastUtils(this.context) {
    fToast = FToast();
    fToast.init(context);
  }

  void showNoInternetConnectionToast() {
    showCustomToast(
      message: context.tr(AppStrings.noInternetConnection),
      iconData: Icons.wifi_off,
    );
  }

  void showCustomToast(
      {Color? backgroundColor,
      required String message,
      IconData? iconData,
      int? durationSeconds}) {
    fToast.showToast(
      child: Wrap(
        children: [
          Opacity(
            opacity: 0.9,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: backgroundColor ?? Colors.black,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  iconData != null
                      ? Row(
                          children: [
                            Icon(
                              iconData,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 12.0,
                            ),
                          ],
                        )
                      : Container(),
                  Flexible(
                    child: Text(
                      context.tr(message),
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      toastDuration: Duration(seconds: durationSeconds ?? 3),
    );
  }

  void showNotificationToast({
    Color? backgroundColor,
    required String title,
    required String description,
    IconData? iconData,
    int? durationSeconds,
  }) {
    fToast.showToast(
      positionedToastBuilder: (context, child) => Positioned(
        top: 10,
        right: AppLocalizations.of(context)!.isRTL ? null : 20,
        left: AppLocalizations.of(context)!.isRTL ? 20 : null,
        child: child,
      ),
      toastDuration: Duration(seconds: durationSeconds ?? 3),
      child: Wrap(
        children: [
          Opacity(
            opacity: 1,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300),
              child: Card(
                surfaceTintColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        iconData ?? Icons.notifications_outlined,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              context.tr(title),
                              textAlign: TextAlign.start,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              context.tr(description),
                              textAlign: TextAlign.start,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
