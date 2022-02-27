// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Quiz _$QuizFromJson(Map<String, dynamic> json) => Quiz()
  ..id = (json['id'] as num?)?.toDouble()
  ..name = json['name'] as String?
  ..description = json['description'] as String?
  ..price = (json['price'] as num?)?.toDouble()
  ..suggestions =
      (json['suggestions'] as List<dynamic>?)?.map((e) => e as String).toList();

Map<String, dynamic> _$QuizToJson(Quiz instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'suggestions': instance.suggestions,
    };
