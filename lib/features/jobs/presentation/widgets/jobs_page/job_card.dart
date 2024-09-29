import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/utils/timeago_utils.dart';
import '../../../../../core/widgets/custom_cached_image.dart';
import '../../../../../config/routes/app_routes.dart';
import '../../../domain/entities/job.dart';

class JobCard extends StatelessWidget {
  final Job job;
  const JobCard({
    super.key,
    required this.job,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.sp, left: 6.sp, right: 6.sp),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.sp),
            border: Border.all(
                color: Theme.of(context).dividerColor.withOpacity(.2))),
        child: InkWell(
          onTap: () {
            context.push(Routes.jobDetails(job.uuid));
          },
          child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.sp)),
              margin: EdgeInsets.zero,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomCachedImageWidget(
                            size: 54.sp,
                            radius: 6.sp,
                            imageUrl: job.company.logo),
                        SizedBox(width: 10.sp),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              job.title,
                              style: const TextStyle(
                                  fontSize: FontSize.s14,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 2.sp),
                            Text(
                              job.company.name,
                              style: const TextStyle(
                                  fontSize: FontSize.s14,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(height: 2.sp),
                            Text(
                              job.fullDetails,
                              style: const TextStyle(
                                  fontSize: FontSize.s13,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 2.sp),
                    Text(
                      TimeAgo.format(DateTime.parse(job.createdDate)),
                      style: const TextStyle(
                          fontSize: FontSize.s13, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
