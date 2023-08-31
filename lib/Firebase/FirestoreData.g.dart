// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FirestoreData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FirestoreData _$FirestoreDataFromJson(Map<String, dynamic> json) =>
    FirestoreData(
      json['restaurantName'] as String?,
      json['overview'] == null
          ? null
          : SectionData.fromJson(json['overview'] as Map<String, dynamic>),
      (json['menus'] as List<dynamic>?)
          ?.map((e) => SectionData.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['horizontalSlogans'] as List<dynamic>?)
          ?.map((e) => SectionData.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['latitude'] as String?,
      json['longitude'] as String?,
      (json['openHours'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['phoneNumber'] as String?,
      json['facebookLink'] as String?,
      json['instagramLink'] as String?,
      json['youtubeLink'] as String?,
      json['privacyLink'] as String?,
      json['aboutUsLink'] as String?,
    );

Map<String, dynamic> _$FirestoreDataToJson(FirestoreData instance) =>
    <String, dynamic>{
      'restaurantName': instance.restaurantName,
      'overview': instance.overview,
      'menus': instance.menus,
      'horizontalSlogans': instance.horizontalSlogans,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'openHours': instance.openHours,
      'phoneNumber': instance.phoneNumber,
      'facebookLink': instance.facebookLink,
      'instagramLink': instance.instagramLink,
      'youtubeLink': instance.youtubeLink,
      'privacyLink': instance.privacyLink,
      'aboutUsLink': instance.aboutUsLink,
    };
