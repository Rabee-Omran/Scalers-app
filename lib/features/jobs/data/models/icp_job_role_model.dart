import '../../../../core/utils/shared_pref.dart';
import '../../domain/entities/icp_job_role.dart';
import '../../../../injection_container.dart';

class IcpJobRoleModel extends IcpJobRole {
  const IcpJobRoleModel({
    required super.id,
    required super.title,
    required super.nextQuestion,
    required super.description,
  });

  factory IcpJobRoleModel.fromJson(Map<String, dynamic> json) {
    final languageCode = sl<SharedPref>().languageCode;
    return IcpJobRoleModel(
      id: json['id'] ?? 0,
      title: json['title_$languageCode'] ?? '',
      nextQuestion:
          (json['next_question'] as List?)?.map((e) => e as String).toList() ??
              [],
      description: json['description_$languageCode'] ?? '',
    );
  }
}
