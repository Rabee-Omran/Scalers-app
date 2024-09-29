import 'package:equatable/equatable.dart';

class JobType extends Equatable {
  final int id;
  final String name;
  final int order;

  const JobType({
    required this.id,
    required this.name,
    required this.order,
  });

  @override
  List<Object?> get props => [id, name, order];
}
