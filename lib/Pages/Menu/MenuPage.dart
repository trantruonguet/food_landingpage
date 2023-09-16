import 'package:flutter/material.dart';
import 'package:restaurentlanding/Firebase/FirestoreData.dart';
import 'package:restaurentlanding/Firebase/SectionData.dart';
import 'package:restaurentlanding/Pages/Menu/MenuDesktoPage.dart';
import 'package:restaurentlanding/Pages/Menu/MenuMobilePage.dart';
import 'package:restaurentlanding/Firebase/MenuItem.dart';

class MenuPage extends StatelessWidget {
  final FirestoreData? data;

  const MenuPage({super.key, this.data});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
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
              mappingMenuAndItems.update(
                  nonMenuItem,
                  (value) => [
                        ...value,
                        ...[menuItem]
                      ]);
            } else {
              mappingMenuAndItems[nonMenuItem] = [menuItem];
            }
            continue;
          }

          for (var menu in menus) {
            if (menu.id == menuItem.menuId) {
              if (mappingMenuAndItems.containsKey(menu)) {
                mappingMenuAndItems.update(
                    menu,
                    (value) => [
                          ...value,
                          ...[menuItem]
                        ]);
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

        if (constraints.maxWidth >= 600) {
          //For Desktop Screen
          return MenuDesktopPage(
            allKeys: allKeys,
            mappingMenuAndItems: mappingMenuAndItems,
          );
        } else {
          //for Tablet Screen
          return MenuMobilePage(
            allKeys: allKeys,
            mappingMenuAndItems: mappingMenuAndItems,
          );
        }
      },
    );
  }
}
