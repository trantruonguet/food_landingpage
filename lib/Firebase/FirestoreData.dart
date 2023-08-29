import 'package:json_annotation/json_annotation.dart';

part 'FirestoreData.g.dart'; // This will be generated by the build_runner

@JsonSerializable() // Add this annotation to your model class
class FirestoreData {
  final String? restaurantName;

  FirestoreData({
    required this.restaurantName
  });

  factory FirestoreData.fromJson(Map<String, dynamic> json) => _$FirestoreDataFromJson(json);
  Map<String, dynamic> toJson() => _$FirestoreDataToJson(this);

}