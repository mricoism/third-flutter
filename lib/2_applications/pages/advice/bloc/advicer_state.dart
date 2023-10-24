part of 'advicer_bloc.dart';

@immutable
sealed class AdvicerState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class AdvicerInitial extends AdvicerState {}

final class AdvicerStateLoading extends AdvicerState {}

final class AdvicerStateLoaded extends AdvicerState {
  final String advice;

  AdvicerStateLoaded({required this.advice});
  @override
  // TODO: implement props
  List<Object?> get props => [advice];
}

final class AdvicerStateError extends AdvicerState {
  final String message;

  AdvicerStateError({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
