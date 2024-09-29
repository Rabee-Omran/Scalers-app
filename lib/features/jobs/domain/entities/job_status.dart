import 'package:equatable/equatable.dart';

class JobStatus extends Equatable {
  final int id;
  final String name;

  const JobStatus({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name];
}
