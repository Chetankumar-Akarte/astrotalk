import 'package:json_annotation/json_annotation.dart';

part 'quiz.g.dart';

@JsonSerializable()
class Quiz {
  double? id;
  String? name;
  String? description;
  double? price;
  List<String>? suggestions;

  Quiz();

  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);
}