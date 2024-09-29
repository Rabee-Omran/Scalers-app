import 'package:equatable/equatable.dart';

class Location extends Equatable {
  final int id;
  final String name;
  final int listOrder;

  const Location({
    required this.id,
    required this.name,
    required this.listOrder,
  });

  @override
  List<Object?> get props => [id, name, listOrder];
}
