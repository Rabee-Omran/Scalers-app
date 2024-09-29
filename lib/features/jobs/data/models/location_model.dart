import '../../../../core/utils/shared_pref.dart';
import '../../domain/entities/location.dart';
import '../../../../injection_container.dart';

class LocationModel extends Location {
  const LocationModel({
    required super.id,
    required super.name,
    required super.listOrder,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    final languageCode = sl<SharedPref>().languageCode;
    return LocationModel(
      id: json['id'] ?? 0,
      name: json['name_$languageCode'] ?? '',
      listOrder: json['list_order'] ?? 0,
    );
  }
}
