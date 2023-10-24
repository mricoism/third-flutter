import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:third_flutter/0_data/exceptions/exception.dart';
import 'package:third_flutter/0_data/models/advice_model.dart';

abstract class AdviceRemoteDatasource {
  /// request a random advice from api
  /// return [AdviceModel] if successfull
  /// throws a server-exceptions if status code not 200
  Future<AdviceModel> getRandomAdviceFromApi();
}

class AdviceRemoteDatasourceImpl implements AdviceRemoteDatasource {


  final http.Client client;

  AdviceRemoteDatasourceImpl({required this.client});

  @override
  Future<AdviceModel> getRandomAdviceFromApi() async {
    final response = await client.get(
      Uri.parse('https://api.flutter-community.com/api/v1/advice'),
      headers: {'content-type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      final responseBody = json.decode(response.body);
      return AdviceModel.fromJson(responseBody);
    }
  }
}
