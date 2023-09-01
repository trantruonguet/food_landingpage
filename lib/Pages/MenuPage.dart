import 'package:flutter/material.dart';
import 'package:solmusic/Style/Style.dart';

class MenuItem {
  MenuItem({
    this.cost,
    this.name,
    this.description,
    this.image,
  });

  String? cost;
  String? name;
  String? description;
  String? image;
}

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<MenuItem> sushiItems = [
      MenuItem(
          name: "1. Sake wine",
          description:
              '2 Sake Nigiri - 6 Sake Maki - 8 Sake Inside Out - (*D, 1, 2, 17, 20) - Ein Süppchen oder eine Extra-Soße (Beilage) gegen Aufpreis wird empfohlen.',
          cost: '15',
          image: 'images/pic1.png'),
      MenuItem(
          name: "1. Sake wine",
          description:
              '2 Sake Nigiri - 6 Sake Maki - 8 Sake Inside Out - (*D, 1, 2, 17, 20) - Ein Süppchen oder eine Extra-Soße (Beilage) gegen Aufpreis wird empfohlen.',
          cost: '15',
          image: 'images/pic1.png'),
      MenuItem(
          name: "1. Sake wine",
          description:
              '2 Sake Nigiri - 6 Sake Maki - 8 Sake Inside Out - (*D, 1, 2, 17, 20) - Ein Süppchen oder eine Extra-Soße (Beilage) gegen Aufpreis wird empfohlen.',
          cost: '15',
          image: 'images/pic1.png'),
      MenuItem(
          name: "1. Sake wine",
          description:
              '2 Sake Nigiri - 6 Sake Maki - 8 Sake Inside Out - (*D, 1, 2, 17, 20) - Ein Süppchen oder eine Extra-Soße (Beilage) gegen Aufpreis wird empfohlen.',
          cost: '15',
          image: 'images/pic1.png'),
      MenuItem(
          name: "1. Sake wine",
          description:
              '2 Sake Nigiri - 6 Sake Maki - 8 Sake Inside Out - (*D, 1, 2, 17, 20) - Ein Süppchen oder eine Extra-Soße (Beilage) gegen Aufpreis wird empfohlen.',
          cost: '15',
          image: 'images/pic1.png'),
      MenuItem(
          name: "1. Sake wine",
          description:
              '2 Sake Nigiri - 6 Sake Maki - 8 Sake Inside Out - (*D, 1, 2, 17, 20) - Ein Süppchen oder eine Extra-Soße (Beilage) gegen Aufpreis wird empfohlen.',
          cost: '15',
          image: 'images/pic1.png'),
      MenuItem(
          name: "1. Sake wine",
          description:
              '2 Sake Nigiri - 6 Sake Maki - 8 Sake Inside Out - (*D, 1, 2, 17, 20) - Ein Süppchen oder eine Extra-Soße (Beilage) gegen Aufpreis wird empfohlen.',
          cost: '15',
          image: 'images/pic1.png'),
      MenuItem(
          name: "1. Sake wine",
          description:
              '2 Sake Nigiri - 6 Sake Maki - 8 Sake Inside Out - (*D, 1, 2, 17, 20) - Ein Süppchen oder eine Extra-Soße (Beilage) gegen Aufpreis wird empfohlen.',
          cost: '15',
          image: 'images/pic1.png'),
      MenuItem(
          name: "1. Sake wine",
          description:
              '2 Sake Nigiri - 6 Sake Maki - 8 Sake Inside Out - (*D, 1, 2, 17, 20) - Ein Süppchen oder eine Extra-Soße (Beilage) gegen Aufpreis wird empfohlen.',
          cost: '15',
          image: 'images/pic1.png'),
      MenuItem(
          name: "1. Sake wine",
          description:
              '2 Sake Nigiri - 6 Sake Maki - 8 Sake Inside Out - (*D, 1, 2, 17, 20) - Ein Süppchen oder eine Extra-Soße (Beilage) gegen Aufpreis wird empfohlen.',
          cost: '15',
          image: 'images/pic1.png'),
      MenuItem(
          name: "1. Sake wine",
          description:
              '2 Sake Nigiri - 6 Sake Maki - 8 Sake Inside Out - (*D, 1, 2, 17, 20) - Ein Süppchen oder eine Extra-Soße (Beilage) gegen Aufpreis wird empfohlen.',
          cost: '15',
          image: 'images/pic1.png'),
    ];
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
                      Text(
                        "SUSHI MENU",
                        style: ThemText.bigTextTitle.copyWith(fontSize: 20),
                      ),
                      ListView.separated(
                        itemBuilder: (context, index) {
                          return Container(
                            child: Row(
                              children: [
                                Image.asset(
                                  "${sushiItems[index].image}",
                                  height: 120,
                                  width: 120,
                                ),
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
                                            "${sushiItems[index].name}",
                                            style: ThemText.bigTextTitle
                                                .copyWith(fontSize: 15),
                                          ),
                                          Text(
                                            "${sushiItems[index].cost}\$",
                                            style: ThemText.bigTextTitle
                                                .copyWith(fontSize: 16),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: size.width * 0.65,
                                        child: Text(
                                          "${sushiItems[index].description}",
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
                        itemCount: sushiItems.length,
                        shrinkWrap: true,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "SATISFACTION MENU",
                        style: ThemText.bigTextTitle.copyWith(fontSize: 20),
                      ),
                      ListView.separated(
                        itemBuilder: (context, index) {
                          return Container(
                            child: Row(
                              children: [
                                Image.asset(
                                  "${sushiItems[index].image}",
                                  height: 120,
                                  width: 120,
                                ),
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
                                            "${sushiItems[index].name}",
                                            style: ThemText.bigTextTitle
                                                .copyWith(fontSize: 15),
                                          ),
                                          Text(
                                            "${sushiItems[index].cost}\$",
                                            style: ThemText.bigTextTitle
                                                .copyWith(fontSize: 16),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: size.width * 0.65,
                                        child: Text(
                                          "${sushiItems[index].description}",
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
                        itemCount: sushiItems.length,
                        shrinkWrap: true,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "DRINK MENU",
                        style: ThemText.bigTextTitle.copyWith(fontSize: 20),
                      ),
                      ListView.separated(
                        itemBuilder: (context, index) {
                          return Container(
                            child: Row(
                              children: [
                                Image.asset(
                                  "${sushiItems[index].image}",
                                  height: 120,
                                  width: 120,
                                ),
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
                                            "${sushiItems[index].name}",
                                            style: ThemText.bigTextTitle
                                                .copyWith(fontSize: 15),
                                          ),
                                          Text(
                                            "${sushiItems[index].cost}\$",
                                            style: ThemText.bigTextTitle
                                                .copyWith(fontSize: 16),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: size.width * 0.65,
                                        child: Text(
                                          "${sushiItems[index].description}",
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
                        itemCount: sushiItems.length,
                        shrinkWrap: true,
                      ),
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
}
