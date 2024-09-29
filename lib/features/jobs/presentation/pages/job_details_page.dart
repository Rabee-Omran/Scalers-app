import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scalers/config/locale/app_localizations_setup.dart';
import 'package:scalers/core/resources/font_manager.dart';
import 'package:scalers/core/resources/strings_manager.dart';
import 'package:scalers/core/resources/styles_manager.dart';
import 'package:scalers/features/jobs/domain/usecases/fetch_job_details.dart';
import 'package:scalers/features/jobs/presentation/bloc/job_details_cubit/job_details_cubit.dart';
import 'package:scalers/features/jobs/presentation/widgets/job_details_page/job_company_info.dart';
import '../../../../core/utils/toast_utils.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/my_error_widget.dart';
import '../../../../core/widgets/no_internet_connection_widget.dart';

class JobDetailsPage extends StatefulWidget {
  final String jobUuid;
  const JobDetailsPage({
    super.key,
    required this.jobUuid,
  });

  @override
  State<JobDetailsPage> createState() => _JobDetailsPageState();
}

class _JobDetailsPageState extends State<JobDetailsPage> {
  void _fetchJobDetails() {
    context
        .read<JobDetailsCubit>()
        .fetchJobDetails(JobDetailsParams(uuid: widget.jobUuid));
  }

  @override
  void initState() {
    super.initState();
    _fetchJobDetails();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JobDetailsCubit, JobDetailsState>(
      listener: (context, state) {
        if (state is JobDetailsErrorState) {
          ToastUtils(context).showCustomToast(message: state.message);
        } else if (state is JobDetailsNoInternetConnectionState) {
          ToastUtils(context).showNoInternetConnectionToast();
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_outlined,
                    color: Theme.of(context).primaryColor,
                  ))
            ],
          ),
          bottomNavigationBar: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Padding(
              padding: EdgeInsets.all(12.sp),
              child: ElevatedButton(
                  onPressed: () {}, child: Text(AppStrings.apply.tr(context))),
            ),
          ),
          body: state is JobDetailsLoadedState
              ? RefreshIndicator(
                  onRefresh: () async {
                    _fetchJobDetails();
                  },
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 16.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        JobCompanyInfo(job: state.job),
                        SizedBox(height: 16.sp),
                        _buildJobtitle(state),
                        SizedBox(height: 4.sp),
                        _buildCompanyWorkDetails(state),
                        SizedBox(height: 8.sp),
                        _buildTags(state, context),
                        SizedBox(height: 16.sp),
                        _buildJobDescription(state)
                      ],
                    ),
                  ),
                )
              : Center(
                  child: _mapStateToWidget(state),
                ),
        );
      },
    );
  }

  Widget _buildJobDescription(JobDetailsLoadedState state) {
    if (state.job.icpAnswers.jobRole.isEmpty) return const SizedBox();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.jobDescription.tr(context),
          style: getBoldStyle(fontSize: FontSize.s18.sp),
        ),
        SizedBox(height: 4.sp),
        ...state.job.icpAnswers.jobRole.map((role) => Padding(
              padding: EdgeInsets.only(bottom: 8.sp),
              child: Text(
                role.description,
              ),
            ))
      ],
    );
  }

  Text _buildJobtitle(JobDetailsLoadedState state) {
    return Text(
      state.job.title,
      style: getBoldStyle(fontSize: FontSize.s18.sp),
    );
  }

  Text _buildCompanyWorkDetails(JobDetailsLoadedState state) {
    return Text(
      state.job.fullDetails,
      style:
          const TextStyle(fontSize: FontSize.s13, fontWeight: FontWeight.w400),
    );
  }

  Wrap _buildTags(JobDetailsLoadedState state, BuildContext context) {
    return Wrap(
      runSpacing: 10.sp,
      spacing: 10.sp,
      children: [
        ...state.job.icpAnswers.jobRole.map((tag) => Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.sp),
                  color: Theme.of(context).primaryColor.withOpacity(.1)),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 4.sp, horizontal: 8.sp),
                child: Text(
                  tag.title,
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            ))
      ],
    );
  }

  Widget _mapStateToWidget(JobDetailsState state) {
    if (state is JobDetailsLoadingState) {
      return const LoadingWidget();
    }
    if (state is JobDetailsNoInternetConnectionState) {
      return NoInternetConnectionWidget(
        onRetry: _fetchJobDetails,
      );
    }
    if (state is JobDetailsErrorState) {
      return MyErrorWidget(
        message: state.message,
        onRetry: _fetchJobDetails,
      );
    }
    return const SizedBox();
  }
}
