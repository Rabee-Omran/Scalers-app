import 'package:equatable/equatable.dart';

class IcpSalesType extends Equatable {
  final int id;
  final String title;
  final List<String> nextQuestion;
  final String description;

  const IcpSalesType({
    required this.id,
    required this.title,
    required this.nextQuestion,
    required this.description,
  });

  @override
  List<Object?> get props => [id, title, nextQuestion, description];
}
