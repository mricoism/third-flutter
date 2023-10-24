import 'package:equatable/equatable.dart';
import 'package:third_flutter/1_domain/entities/advice_entity.dart';

class AdviceModel extends AdviceEntity with EquatableMixin {
  AdviceModel({required String advice, required int ids})
      : super(advice: advice, ids: ids);

  factory AdviceModel.fromJson(Map<String, dynamic> json) {
    return AdviceModel(advice: json['advice'], ids: json['advice_id']);
  }
}
