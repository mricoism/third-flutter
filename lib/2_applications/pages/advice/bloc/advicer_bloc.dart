import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:meta/meta.dart';
import 'package:third_flutter/1_domain/entities/advice_entity.dart';
import 'package:third_flutter/1_domain/failures/failures.dart';
import 'package:third_flutter/1_domain/usecases/advice_usecases.dart';
import 'package:third_flutter/constant.dart';

part 'advicer_event.dart';
part 'advicer_state.dart';

class AdvicerBloc extends Bloc<AdvicerEvent, AdvicerState> {
  final AdviceUsecases adviceUsecases;
  
  AdvicerBloc({required this.adviceUsecases}) : super(AdvicerInitial()) {
    

    /// "on" to react on user Event
    on<AdviceRequestedEvent>((event, emit) async {
      emit(AdvicerStateLoading());

      // execute business logic
      // for example get advice
      final Either<Failure, AdviceEntity> failureOrAdvice = await adviceUsecases.getAdvice();

      failureOrAdvice.fold((failure) {
        return emit(AdvicerStateError(message: _mapFailureToMessage(failure)));
      }, (advice) {
        return emit(AdvicerStateLoaded(advice: advice.advice));
      });

      // emit(AdvicerStateLoaded(advice: advice.advice));
      // emit(AdvicerStateError(message: 'ERROR!'));
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return Constant.serverFailureMessage;
      case CacheFailure:
        return Constant.cacheFailureMessage;
      default:
      return Constant.generalFailureMessage;
    }
  }
}
