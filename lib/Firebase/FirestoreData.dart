import 'package:json_annotation/json_annotation.dart';
import 'SectionData.dart';
import 'MenuItem.dart';

part 'FirestoreData.g.dart'; // This will be generated by the build_runner

@JsonSerializable() // Add this annotation to your model class
class FirestoreData {
  final String? restaurantName;
  final SectionData? overview;
  final List<SectionData>? menus;
  final List<SectionData>? horizontalSlogans;
  final String? latitude;
  final String? longitude;
  final List<String>? openHours;
  final String? phoneNumber;
  final String? facebookLink;
  final String? instagramLink;
  final String? youtubeLink;
  final String? address;
  final String? email;
  final List<SectionData>? privacy;
  final List<SectionData>? aboutUs;
  final List<MenuItem>? menuItems;

  FirestoreData(
      this.restaurantName,
      this.overview,
      this.menus,
      this.horizontalSlogans,
      this.latitude,
      this.longitude,
      this.openHours,
      this.phoneNumber,
      this.facebookLink,
      this.instagramLink,
      this.youtubeLink,
      this.address,
      this.email,
      this.privacy,
      this.aboutUs,
      this.menuItems);

  factory FirestoreData.fromJson(Map<String, dynamic> json) =>
      _$FirestoreDataFromJson(json);

  // factory FirestoreData.fromJson(Map<String, dynamic> jsonMap) {
  //   final String? restaurantName = jsonMap['restaurantName'];
  //
  //   String overviewString = jsonMap['overview'] as String;
  //   overviewString = overviewString.replaceAll("\\", "");
  //   Map<String, dynamic> overviewJson = json.decode(overviewString);
  //   SectionData? overview = SectionData.fromJson(overviewJson);
  //   print("overview = ${overview.toJson()}");
  //
  //   List<SectionData>? menus;
  //   List<SectionData>? horizontalSlogans;
  //   String? latitude;
  //   String? longitude;
  //   List<String>? openHours;
  //   String? phoneNumber;
  //   String? facebookLink;
  //   String? instagramLink;
  //   String? youtubeLink;
  //   String? privacyLink;
  //   String? aboutUsLink;
  //   FirestoreData data = FirestoreData(restaurantName, overview, menus, horizontalSlogans, latitude, longitude,
  //       openHours, phoneNumber, facebookLink, instagramLink, youtubeLink, privacyLink, aboutUsLink);
  //   return data;
  // }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = _$FirestoreDataToJson(this);
    result['overview'] = this.overview?.toJson();
    List<Map<String, dynamic>>? menus =
        this.menus?.map((object) => object.toJson()).toList();
    result['menus'] = menus;
    result['horizontalSlogans'] =
        this.horizontalSlogans?.map((object) => object.toJson()).toList();
    result['menuItems'] = this.menuItems?.map((e) => e.toJson()).toList();
    result['openHours'] = this.openHours?.toList();
    result['privacy'] = this.privacy?.map((object) => object.toJson()).toList();
    result['aboutUs'] = this.aboutUs?.map((object) => object.toJson()).toList();

    return result;
  }
}
