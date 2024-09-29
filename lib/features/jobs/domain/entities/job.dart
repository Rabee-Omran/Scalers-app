import 'package:equatable/equatable.dart';
import 'company.dart';
import 'icp_answers.dart';
import 'job_status.dart';
import 'job_type.dart';
import 'location.dart';
import 'workplace_preference.dart';

class Job extends Equatable {
  final int id;
  final String createdDate;
  final Location location;
  final JobType type;
  final JobStatus status;
  final WorkplacePreference workplacePreference;
  final Company company;
  final IcpAnswers icpAnswers;
  final String uuid;
  final String title;

  const Job({
    required this.id,
    required this.createdDate,
    required this.location,
    required this.type,
    required this.status,
    required this.workplacePreference,
    required this.company,
    required this.icpAnswers,
    required this.uuid,
    required this.title,
  });

  String get fullDetails {
    List<String> details = [];

    if (location.name.trim().isNotEmpty) {
      details.add(location.name.trim());
    }
    if (workplacePreference.name.trim().isNotEmpty) {
      details.add(workplacePreference.name.trim());
    }
    if (type.name.trim().isNotEmpty) {
      details.add(type.name.trim());
    }

    return details.isNotEmpty ? details.join(' . ') : '';
  }

  @override
  List<Object?> get props => [id, title, uuid];
}
