import '../../../../core/utils/shared_pref.dart';
import '../../domain/entities/job_status.dart';
import '../../../../injection_container.dart';

class JobStatusModel extends JobStatus {
  const JobStatusModel({
    required super.id,
    required super.name,
  });

  factory JobStatusModel.fromJson(Map<String, dynamic> json) {
    final languageCode = sl<SharedPref>().languageCode;
    return JobStatusModel(
      id: json['id'] ?? 0,
      name: json['name_$languageCode'] ?? '',
    );
  }
}
