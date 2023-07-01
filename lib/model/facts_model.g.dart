// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Facts _$FactsFromJson(Map<String, dynamic> json) => Facts(
      id: json['_id'] as String?,
      v: json['_v'] as int?,
      text: json['text'] as String?,
      updatedAt: json['updatedAt'] as String?,
      deleted: json['deleted'] as bool,
      api: json['api'] as String?,
    );

Map<String, dynamic> _$FactsToJson(Facts instance) => <String, dynamic>{
      '_id': instance.id,
      '_v': instance.v,
      'text': instance.text,
      'updatedAt': instance.updatedAt,
      'deleted': instance.deleted,
      'api': instance.api,
    };
