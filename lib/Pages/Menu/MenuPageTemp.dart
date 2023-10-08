
import 'package:flutter/material.dart';
import 'package:restaurentlanding/Pages/Views/ImageMultipleSource.dart';

import '../../Style/Style.dart';
import '/../generated/assets.dart';

class MenuPageTemp extends StatelessWidget {
  final images = [
    Assets.imagesHardcodeMenu1,
    Assets.imagesHardcodeMenu2,
    Assets.imagesHardcodeMenu3,
    Assets.imagesHardcodeMenu4,
    Assets.imagesHardcodeMenu5,
    Assets.imagesHardcodeMenu6,
    Assets.imagesHardcodeMenu7,
    Assets.imagesHardcodeMenu8,
    Assets.imagesHardcodeMenu9,
    Assets.imagesHardcodeMenu10,
    Assets.imagesHardcodeMenu11,
    Assets.imagesHardcodeMenu12,
  ];

  MenuPageTemp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        var size = MediaQuery.of(context).size;

        return SingleChildScrollView(
          child: Container(
            // color: Color(0xff0A183D),
            width: size.width,
            child: Column(
              children: [
                SizedBox(
                  height: 32,
                ),
                Text(
                  "OUR MENU",
                  style: ThemText.describtionTextMobile.copyWith(fontSize: 20),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  width: size.width,
                  height: size.height - 32 - 12 - 30,
                  padding: EdgeInsets.all(12),
                  child: GridView.count(
                    // Create a grid with 2 columns. If you change the scrollDirection to
                    // horizontal, this produces 2 rows.
                    crossAxisCount: constraints.maxWidth >= 600 ? 2 : 1,
                    // Generate 100 widgets that display their index in the List.
                    children: imageList(size.width, images)
                  )
                ),

                SizedBox(
                  height: 12,
                ),
                Text(
                  "Very pleased to be of service",
                  style: ThemText.describtionText.copyWith(fontSize: 20),
                ),
                SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  List<Widget> imageList(double screenWidth, List<String> images) {

    final width = screenWidth / 2 - 32;
    final height = width / 1265 * 1650;
    final isMobile = screenWidth>=600;
    final padding = isMobile ? 8.0 : 30.0;

    List<Widget> result = images.map((e) => Padding(
      padding: EdgeInsets.all(padding),
      child: Image.asset(
        e,
        width: width,
        height: height,
        fit: BoxFit.fill,
      ),
    )).toList();

    if (screenWidth>=600) {
      result.insert(1, Padding(padding: const EdgeInsets.all(8.0)));
      result.insert(9, Padding(padding: const EdgeInsets.all(8.0)));
    }
    return result;

  }
}
