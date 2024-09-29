import 'icp_job_role_model.dart';
import 'icp_sales_type_model.dart';
import '../../domain/entities/icp_answers.dart';

class IcpAnswersModel extends IcpAnswers {
  const IcpAnswersModel({
    required super.jobRole,
    required super.typeOfSales,
  });

  factory IcpAnswersModel.fromJson(Map<String, dynamic> json) {
    return IcpAnswersModel(
      jobRole: (json['job-role'] as List?)
              ?.map((item) => IcpJobRoleModel.fromJson(item))
              .toList() ??
          [],
      typeOfSales: (json['type-of-sales'] as List?)
              ?.map((item) => IcpSalesTypeModel.fromJson(item))
              .toList() ??
          [],
    );
  }
}
