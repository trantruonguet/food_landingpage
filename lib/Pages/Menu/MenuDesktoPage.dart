import 'package:flutter/material.dart';
import 'package:solmusic/Firebase/MenuItem.dart';
import 'package:solmusic/Firebase/SectionData.dart';
import 'package:solmusic/Pages/Views/ImageMultipleSource.dart';
import 'package:solmusic/Style/Style.dart';

class MenuDesktopPage extends StatelessWidget {
  const MenuDesktopPage({
    required this.allKeys,
    required this.mappingMenuAndItems,
  });

  final List<SectionData> allKeys;
  final Map<SectionData, List<MenuItem>> mappingMenuAndItems;

  @override
  Widget build(BuildContext context) {
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
              style: ThemText.describtionText.copyWith(fontSize: 32),
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              padding: EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 0,
                  ),
                  for (final (index, item) in allKeys.indexed)
                    generateMenu(item, mappingMenuAndItems[item]!, size.width,
                        index == allKeys.length - 1)
                ],
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Text(
              "Very pleased to be of service",
              style: ThemText.describtionText.copyWith(fontSize: 32),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }

  Widget generateMenu(SectionData menu, List<MenuItem> menuItems, double width,
      bool isTheLast) {
    return Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        menu.title ?? "Other",
        style: ThemText.bigTextTitle.copyWith(fontSize: 20),
      ),
      ListView.separated(
        itemBuilder: (context, index) {
          return Container(
            child: Row(
              children: [
                ImageMultipleSource(
                    imageUrl: menuItems[index].image ?? "",
                    size: Size(120, 120)),
                SizedBox(
                  width: 24,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${menuItems[index].name ?? ""}",
                            style: ThemText.bigTextTitle.copyWith(fontSize: 15),
                          ),
                          Text(
                            "${menuItems[index].cost ?? ""}\$",
                            style: ThemText.bigTextTitle.copyWith(fontSize: 16),
                          ),
                        ],
                      ),
                      Container(
                        width: width * 0.65,
                        child: Text(
                          "${menuItems[index].description ?? ""}",
                          maxLines: 3,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Container();
        },
        itemCount: menuItems.length,
        shrinkWrap: true,
      ),
      if (!isTheLast)
        SizedBox(
          height: 50,
        ),
    ]));
  }
}
