import 'package:equatable/equatable.dart';
import 'icp_job_role.dart';
import 'icp_sales_type.dart';

class IcpAnswers extends Equatable {
  final List<IcpJobRole> jobRole;
  final List<IcpSalesType> typeOfSales;

  const IcpAnswers({
    required this.jobRole,
    required this.typeOfSales,
  });

  @override
  List<Object?> get props =>
      [jobRole, typeOfSales];
}
