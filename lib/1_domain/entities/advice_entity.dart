import 'package:equatable/equatable.dart';

class AdviceEntity extends Equatable {
  final String advice;
  final int ids;

  AdviceEntity({required this.advice, required this.ids});

  @override
  // TODO: implement props
  List<Object?> get props => [advice, ids];
}
