
import 'package:fpdart/fpdart.dart';
import 'package:third_flutter/1_domain/entities/advice_entity.dart';
import 'package:third_flutter/1_domain/failures/failures.dart';

abstract class AdviceRepo {
  Future<Either<Failure, AdviceEntity>> getAdviceFromDatasource();
}