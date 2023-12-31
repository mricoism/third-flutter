import 'package:fpdart/src/either.dart';
import 'package:third_flutter/0_data/datasources/advice_remote_datasource.dart';
import 'package:third_flutter/0_data/exceptions/exception.dart';
import 'package:third_flutter/1_domain/entities/advice_entity.dart';
import 'package:third_flutter/1_domain/failures/failures.dart';
import 'package:third_flutter/1_domain/repositories/advice_repo.dart';

class AdviceRepoImpl implements AdviceRepo {
  final AdviceRemoteDatasource adviceRemoteDatasource = AdviceRemoteDatasourceImpl();

  @override
  Future<Either<Failure, AdviceEntity>> getAdviceFromDatasource() async {

    try {
      final result = await adviceRemoteDatasource.getRandomAdviceFromApi();
    return right(result);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (exceptions) {
      return left(GeneralFailure());
    }

    
  }



}
