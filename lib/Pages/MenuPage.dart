import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:solmusic/Firebase/FirestoreData.dart';
import 'package:solmusic/Firebase/SectionData.dart';
import 'package:solmusic/Pages/Views/ImageMultipleSource.dart';
import 'package:solmusic/Style/Style.dart';
import 'package:solmusic/Firebase/MenuItem.dart';


class MenuPage extends StatelessWidget {
  final FirestoreData? data;

  const MenuPage({super.key, this.data});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        var size = MediaQuery.of(context).size;
        final menuItems = data?.menuItems ?? [];
        if (menuItems.isEmpty) {
          return Container();
        }

        var mappingMenuAndItems = Map<SectionData, List<MenuItem>>();
        final menus = data?.menus ?? [];
        SectionData nonMenuItem = SectionData(title: "Other");

        for (var menuItem in menuItems) {
          if ((menuItem.menuId ?? "").isEmpty) {
            if (mappingMenuAndItems.containsKey(nonMenuItem)) {
              mappingMenuAndItems.update(nonMenuItem, (value) => [...value, ...[menuItem]]);
            } else {
              mappingMenuAndItems[nonMenuItem] = [menuItem];
            }
            continue;
          }

          for (var menu in menus) {
            if (menu.id == menuItem.menuId) {
              if (mappingMenuAndItems.containsKey(menu)) {
                mappingMenuAndItems.update(menu, (value) => [...value, ...[menuItem]]);
              } else {
                mappingMenuAndItems[menu] = [menuItem];
              }
              break;
            }
          }
        }

        List<SectionData> allKeys = mappingMenuAndItems.keys.toList();
        allKeys.sort((a, b) => (a.order ?? 0).compareTo((b.order ?? 0)));
        for (var menu in allKeys) {
          var sortedValue = mappingMenuAndItems[menu];
          sortedValue!.sort((a, b) => (a.order ?? 0).compareTo((b.order ?? 0)));
          mappingMenuAndItems.update(menu, (value) => sortedValue);
        }

        print("mappingMenuAndItems = $mappingMenuAndItems");
        print("allMenu = ${allKeys.map((e) => e.toJson()).toList()}");
        print("menus = ${menus.map((e) => e.toJson()).toList()}");

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
                    children:
                    [
                      SizedBox(height: 0,),
                      for (final (index, item) in allKeys.indexed)
                        generateMenu(item, mappingMenuAndItems[item]!, size.width, index == allKeys.length - 1)
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
      },
    );
  }

  Widget generateMenu(SectionData menu, List<MenuItem> menuItems, double width, bool isTheLast) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

        Text(
          menu.title ?? "Other",
        style: ThemText.bigTextTitle.copyWith(fontSize: 20),
      ),
        ListView.separated(
          itemBuilder: (context, index) {
            return Container(
              child: Row(
                children: [
                  ImageMultipleSource(imageUrl: menuItems[index].image ?? "", size: Size(120, 120)),
                  SizedBox(
                    width: 24,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${menuItems[index].name ?? ""}",
                              style: ThemText.bigTextTitle
                                  .copyWith(fontSize: 15),
                            ),
                            Text(
                              "${menuItems[index].cost ?? ""}\$",
                              style: ThemText.bigTextTitle
                                  .copyWith(fontSize: 16),
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
      ])
    );
  }
}
