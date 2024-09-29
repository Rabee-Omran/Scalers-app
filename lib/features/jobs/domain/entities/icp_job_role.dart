import 'package:equatable/equatable.dart';

class IcpJobRole extends Equatable {
  final int id;
  final String title;
  final List<String> nextQuestion;
  final String description;

  const IcpJobRole({
    required this.id,
    required this.title,
    required this.nextQuestion,
    required this.description,
  });

  @override
  List<Object?> get props => [id, title, nextQuestion, description];
}
