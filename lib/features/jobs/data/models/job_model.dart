import 'company_model.dart';
import 'icp_answers_model.dart';
import 'job_status_model.dart';
import 'job_type_model.dart';
import 'location_model.dart';
import 'workplace_preference_model.dart';
import '../../domain/entities/job.dart';

class JobModel extends Job {
  const JobModel({
    required super.id,
    required super.createdDate,
    required super.location,
    required super.type,
    required super.status,
    required super.workplacePreference,
    required super.company,
    required super.icpAnswers,
    required super.uuid,
    required super.title,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      id: json['id'] ?? 0,
      createdDate: json['created_date'] ?? '',
      location: json['location'] != null
          ? LocationModel.fromJson(json['location'])
          : const LocationModel(id: 0, name: '', listOrder: 0),
      type: json['type'] != null
          ? JobTypeModel.fromJson(json['type'])
          : JobTypeModel.fromJson(const {}),
      status: json['status'] != null
          ? JobStatusModel.fromJson(json['status'])
          : JobStatusModel.fromJson(const {}),
      workplacePreference: json['workplace_preference'] != null
          ? WorkplacePreferenceModel.fromJson(json['workplace_preference'])
          : WorkplacePreferenceModel.fromJson(const {}),
      company: json['company'] != null
          ? CompanyModel.fromJson(json['company'])
          : CompanyModel.fromJson(const {}),
      icpAnswers: json['icp_answers'] != null
          ? IcpAnswersModel.fromJson(json['icp_answers'])
          : IcpAnswersModel.fromJson(const {}),
      uuid: json['uuid'] ?? '',
      title: json['title'] ?? '',
    );
  }
}
