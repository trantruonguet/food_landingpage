
import 'package:flutter/material.dart';
import 'package:restaurentlanding/Pages/Views/ImageMultipleSource.dart';

import '../../Style/Style.dart';
import '/../generated/assets.dart';

class MenuPageTemp extends StatelessWidget {
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
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 18,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(20),
                      child: Image.asset(
                        index < 9
                            ? "images/karte-copy-2_compressed_page-000${index + 1}.jpg"
                            : "images/karte-copy-2_compressed_page-00${index + 1}.jpg",
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    );
                  },
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
