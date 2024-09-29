import '../../../../core/utils/shared_pref.dart';
import '../../domain/entities/workplace_preference.dart';
import '../../../../injection_container.dart';

class WorkplacePreferenceModel extends WorkplacePreference {
  const WorkplacePreferenceModel({
    required super.id,
    required super.name,
  });

  factory WorkplacePreferenceModel.fromJson(Map<String, dynamic> json) {
    final languageCode = sl<SharedPref>().languageCode;
    return WorkplacePreferenceModel(
      id: json['id'] ?? 0,
      name: json['name_$languageCode'] ?? '',
    );
  }
}
