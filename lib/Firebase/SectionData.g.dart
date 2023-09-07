// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SectionData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SectionData _$SectionDataFromJson(Map<String, dynamic> json) => SectionData(
      title: json['title'] as String?,
      content: json['content'] as String?,
      subContent: json['subContent'] as String?,
      buttonTitle: json['buttonTitle'] as String?,
      imageUrl: json['imageUrl'] as String?,
      iconUrl: json['iconUrl'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$SectionDataToJson(SectionData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'subContent': instance.subContent,
      'buttonTitle': instance.buttonTitle,
      'imageUrl': instance.imageUrl,
      'iconUrl': instance.iconUrl,
      'id': instance.id,
    };
