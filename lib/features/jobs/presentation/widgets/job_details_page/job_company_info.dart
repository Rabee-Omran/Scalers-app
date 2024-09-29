import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../domain/entities/job.dart';

import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/widgets/custom_cached_image.dart';

class JobCompanyInfo extends StatelessWidget {
  final Job job;
  const JobCompanyInfo({
    super.key,
    required this.job,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomCachedImageWidget(
            size: 52.sp, radius: 6.sp, imageUrl: job.company.logo),
        SizedBox(width: 10.sp),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * .7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                job.company.name,
                maxLines: 2,
                style: TextStyle(
                    fontSize: FontSize.s16.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 6.sp),
              Text(
                job.company.industry,
                style: const TextStyle(
                    fontSize: FontSize.s14, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
