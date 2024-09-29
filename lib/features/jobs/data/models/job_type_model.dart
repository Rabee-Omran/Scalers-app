import '../../../../core/utils/shared_pref.dart';
import '../../domain/entities/job_type.dart';
import '../../../../injection_container.dart';

class JobTypeModel extends JobType {
  const JobTypeModel({
    required super.id,
    required super.name,
    required super.order,
  });

  factory JobTypeModel.fromJson(Map<String, dynamic> json) {
    final languageCode = sl<SharedPref>().languageCode;
    return JobTypeModel(
      id: json['id'] ?? 0,
      name: json['name_$languageCode'] ?? '',
      order: json['order'] ?? 0,
    );
  }
}
