import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class BuildContextParams extends Equatable {
  final BuildContext context;

  const BuildContextParams({required this.context});

  @override
  List<Object> get props => [context];
}
