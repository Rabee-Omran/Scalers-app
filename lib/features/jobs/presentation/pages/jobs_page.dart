import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/locale/app_localizations_setup.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/utils/toast_utils.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/my_error_widget.dart';
import '../../../../core/widgets/no_internet_connection_widget.dart';
import '../bloc/jobs_bloc/jobs_bloc.dart';
import '../widgets/jobs_page/job_card.dart';

class JobsPage extends StatefulWidget {
  const JobsPage({super.key});

  @override
  State<JobsPage> createState() => _JobsPageState();
}

class _JobsPageState extends State<JobsPage> {
  void _fetchJobs() {
    context.read<JobsBloc>().add(FetchJobsEv());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JobsBloc, JobsState>(
      listener: (context, state) {
        if (state is JobsErrorState) {
          ToastUtils(context).showCustomToast(message: state.message);
        } else if (state is JobsNoInternetConnectionState) {
          ToastUtils(context).showNoInternetConnectionToast();
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              AppStrings.jobs.tr(context),
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_outlined,
                    color: Theme.of(context).primaryColor,
                  ))
            ],
          ),
          body: state.jobs.isNotEmpty
              ? RefreshIndicator(
                  onRefresh: () async {
                    _fetchJobs();
                  },
                  child: ListView.builder(
                    padding: EdgeInsets.all(6.sp),
                    itemCount: state.jobs.length,
                    itemBuilder: (context, index) =>
                        JobCard(job: state.jobs[index]),
                  ),
                )
              : Center(
                  child: _mapStateToWidget(state),
                ),
        );
      },
    );
  }

  Widget _mapStateToWidget(JobsState state) {
    if (state is JobsLoadingState) {
      return const LoadingWidget();
    }
    if (state is JobsNoInternetConnectionState) {
      return NoInternetConnectionWidget(
        onRetry: _fetchJobs,
      );
    }
    if (state is JobsErrorState) {
      return MyErrorWidget(
        message: state.message,
        onRetry: _fetchJobs,
      );
    }
    return const SizedBox();
  }
}
