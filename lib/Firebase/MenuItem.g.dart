// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MenuItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuItem _$MenuItemFromJson(Map<String, dynamic> json) => MenuItem(
      cost: json['cost'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      order: json['order'] as int?,
    );

Map<String, dynamic> _$MenuItemToJson(MenuItem instance) => <String, dynamic>{
      'order': instance.order,
      'cost': instance.cost,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
    };
