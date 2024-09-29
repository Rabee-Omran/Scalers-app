import '../../../../core/utils/shared_pref.dart';
import '../../domain/entities/icp_sales_type.dart';
import '../../../../injection_container.dart';

class IcpSalesTypeModel extends IcpSalesType {
  const IcpSalesTypeModel({
    required super.id,
    required super.title,
    required super.nextQuestion,
    required super.description,
  });

  factory IcpSalesTypeModel.fromJson(Map<String, dynamic> json) {
    final languageCode = sl<SharedPref>().languageCode;
    return IcpSalesTypeModel(
      id: json['id'] ?? 0,
      title: json['title_$languageCode'] ?? '',
      nextQuestion:
          (json['next_question'] as List?)?.map((e) => e as String).toList() ??
              [],
      description: json['description_$languageCode'] ?? '',
    );
  }
}
