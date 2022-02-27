import 'package:json_annotation/json_annotation.dart';

import 'birth_details.dart';
import 'birth_place.dart';

part 'relatives.g.dart';

@JsonSerializable()
class Relatives {
  String? uuid;
  String? relation;
  double? relationId;
  String? firstName;
  String? middleName;
  String? lastName;
  String? fullName;
  String? gender;
  String? dateAndTimeOfBirth;
  BirthDetails? birthDetails;
  BirthPlace? birthPlace;

  Relatives();

  factory Relatives.fromJson(Map<String, dynamic> json) => _$FamilyProfileFromJson(json);

  Map<String, dynamic> toJson() => _$FamilyProfileToJson(this);

}