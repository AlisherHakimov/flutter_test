import 'package:json_annotation/json_annotation.dart';

part 'facts_model.g.dart';

@JsonSerializable()
class Facts {
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: '_v')
  int? v;
  String? text;
  String? updatedAt;
  bool deleted;
  String? api;

  Facts({
    this.id,
    this.v,
    this.text,
    this.updatedAt,
    required this.deleted,
    this.api,
  });

  factory Facts.fromJson(Map<String, dynamic> json) => _$FactsFromJson(json);
  Map<String, dynamic> toJson() => _$FactsToJson(this);
}
