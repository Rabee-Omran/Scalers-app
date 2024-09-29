import '../../domain/entities/company.dart';

class CompanyModel extends Company {
  const CompanyModel({
    required super.name,
    required super.logo,
    required super.industry,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      name: json['name'] ?? '',
      logo: json['logo'] ?? '',
      industry: json['industry'] ?? '',
    );
  }
}
