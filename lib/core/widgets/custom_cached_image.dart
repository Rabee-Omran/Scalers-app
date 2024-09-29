import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CustomCachedImageWidget extends StatelessWidget {
  final double size;
  final double? height;
  final String imageUrl;
  final double? radius;
  final Function()? onTap;
  const CustomCachedImageWidget(
      {super.key,
      required this.size,
      required this.imageUrl,
      this.radius,
      this.height,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 4.sp),
        child: SizedBox(
          width: size,
          height: height ?? size,
          child: SizedBox(
            width: size,
            height: height ?? size,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(radius ?? 300.sp),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Theme.of(context).highlightColor,
                  highlightColor: Theme.of(context).dividerColor,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
