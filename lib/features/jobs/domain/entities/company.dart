import 'package:equatable/equatable.dart';

class Company extends Equatable {
  final String name;
  final String logo;
  final String industry;

  const Company({
    required this.name,
    required this.logo,
    required this.industry,
  });

  @override
  List<Object?> get props => [name, logo, industry];
}
