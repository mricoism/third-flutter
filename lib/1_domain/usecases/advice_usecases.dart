import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:third_flutter/0_data/repositories/advice_repo_impl.dart';
import 'package:third_flutter/1_domain/entities/advice_entity.dart';
import 'package:third_flutter/1_domain/failures/failures.dart';
import 'package:third_flutter/1_domain/repositories/advice_repo.dart';

class AdviceUsecases {
  final AdviceRepo adviceRepo;

  AdviceUsecases({required this.adviceRepo});



  Future<Either<Failure, AdviceEntity>> getAdvice() async {
    // debugPrint('fake get advice triggered');
    // await Future.delayed(Duration(seconds: 3), () {});
    // debugPrint('got advice');

    // // call repo if not fail. right side
    // return right(AdviceEntity(advice: 'Okay riko, Its Hammer time!', ids: 285));

    // // call repo if error or fail. Left side
    // return left(ServerFailure());

    return adviceRepo.getAdviceFromDatasource();
    // space for business logic


  }
}

