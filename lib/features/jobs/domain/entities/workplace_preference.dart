import 'package:equatable/equatable.dart';

class WorkplacePreference extends Equatable {
  final int id;
  final String name;

  const WorkplacePreference({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name];
}
