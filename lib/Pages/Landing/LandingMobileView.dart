// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:solmusic/Firebase/FirestoreData.dart';
import 'package:solmusic/Pages/Views/FooterView.dart';
import 'package:solmusic/Pages/Views/ImageMultipleSource.dart';
import 'package:solmusic/Style/Style.dart';
import 'dart:ui' as ui;
import 'package:google_maps/google_maps.dart' as mapGG;
import 'package:solmusic/Widget/RoundedButton.dart';

class LandingMobileView extends StatefulWidget {
  final FirestoreData? data;

  const LandingMobileView({super.key, required this.data});

  @override
  _LandingMobileViewState createState() => _LandingMobileViewState();
}

class _LandingMobileViewState extends State<LandingMobileView> {
  _LandingMobileViewState();

  @override
  void initState() {
    super.initState();
  }

  Widget customFlexible(String text, String labelText, String subText,
      var image, bool imageLeft, bool isTheLast) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            children: [
              if (imageLeft)
                Flexible(
                  flex: 1,
                  child: ImageMultipleSource(imageUrl: image),
                ),
              if (imageLeft)
                SizedBox(
                  width: 48,
                ),
              Flexible(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      text,
                      style: ThemText.createText,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      labelText,
                      style: ThemText.createText,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      subText,
                      style: ThemText.howitworkDec,
                    ),
                  ],
                ),
              ),
              if (!imageLeft)
                SizedBox(
                  width: 48,
                ),
              if (!imageLeft)
                Flexible(
                  flex: 1,
                  child: ImageMultipleSource(imageUrl: image),
                ),
            ],
          ),
          if (!isTheLast)
            SizedBox(
              height: 48.0,
            )
        ],
      ),
    );
  }

  Widget customCheckBox(String text, bool value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
              activeColor: Colors.pink, value: value, onChanged: (value) {}),
          SizedBox(
            width: 16.0,
          ),
          Text(
            text,
            style: ThemText.smallWhiteText,
          ),
        ],
      ),
    );
  }

  Widget customCard(text, description, img) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Container(
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(16.0), color: Colors.teal),
          //   height: MediaQuery.of(context).size.height * 0.47,
          //   width: MediaQuery.of(context).size.width * 0.22,
          //   child: ClipRRect(
          //     borderRadius: BorderRadius.circular(16.0),
          //     child: Image(
          //       fit: BoxFit.cover,
          //       image: AssetImage(img),
          //     ),
          //   ),
          // ),
          SizedBox(
            height: 16.0,
          ),
          Text(
            text,
            style: ThemText.cardText,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 16.0,
          ),
          Text(
            description,
            style: ThemText.describtionText,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  Widget customCircleAvtar(text, img, subText) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 100.0,
          backgroundImage: AssetImage(img),
        ),
        SizedBox(
          height: 16.0,
        ),
        Text(
          text,
          style: ThemText.cardText,
        ),
        SizedBox(
          height: 16.0,
        ),
        Text(
          subText,
          style: ThemText.whitexlText,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final String htmlId = "map";

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
      final mapOptions = mapGG.MapOptions()
        ..zoom = 15.0
        ..center = mapGG.LatLng(35.7560423, 139.7803552);

      final elem = DivElement()..id = htmlId;
      final map = mapGG.GMap(elem, mapOptions);

      map.onCenterChanged.listen((event) {});
      map.onDragstart.listen((event) {});
      map.onDragend.listen((event) {});

      mapGG.Marker(mapGG.MarkerOptions()
        ..position = map.center
        ..map = map
        ..title = widget.data?.restaurantName);

      return elem;
    });

    return SingleChildScrollView(
      child: Column(
        children: [
          //Home Music for everyone
          Container(
            height: size.height,
            width: size.width,
            color: Color(0xff0A183D),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  width: size.width / 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: size.width * 0.40,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.data?.overview?.title ?? "",
                              style: ThemText.homewhiteTitle,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                width: size.width * 0.40,
                                alignment: Alignment.centerLeft,
                                child: Wrap(
                                  children: [
                                    Text(
                                      widget.data?.overview?.content ?? "",
                                      style: ThemText.homeDescTitle,
                                    ),
                                  ],
                                )),
                            Container(
                                width: size.width * 0.40,
                                alignment: Alignment.centerLeft,
                                child: Wrap(
                                  children: [
                                    Text(
                                      widget.data?.overview?.subContent ?? "",
                                      style: ThemText.homeDescTitle,
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 48.0,
                          vertical: 24.0,
                        ),
                        child: Row(
                          children: [
                            RoundedButton(
                              color: Color(0xffFC0254),
                              textTitle:
                                  widget.data?.overview?.buttonTitle ?? "",
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: size.width / 2,
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ImageMultipleSource(
                        imageUrl: widget.data?.overview?.imageUrl ?? ""),
                  ),
                ),
              ],
            ),
          ),

          //How it works
          Container(
            // height: size.height * 0.86,
            width: size.width,
            color: Color(0xff0A183D),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // width: size.width * 0.46,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        "About our menus",
                        style: ThemText.whititleText,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      for (final (index, item)
                          in widget.data?.menus?.indexed ?? [].indexed)
                        customFlexible(
                            item.title ?? "",
                            item.content ?? "",
                            item.subContent ?? "",
                            item.imageUrl ?? "",
                            index % 2 == 0,
                            index == (widget.data?.menus?.length ?? 0) - 1)
                    ],
                  )
                ],
              ),
            ),
          ),

          //Our Concept
          Container(
            height: size.height * 1.20,
            width: size.width,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ...widget.data?.horizontalSlogans?.map(
                                (e) => Flexible(
                                    flex: 1,
                                    child: customCard(
                                      e.title,
                                      e.content,
                                      e.imageUrl,
                                    )),
                              ) ??
                              [],
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Color(0xff0A183D),
            height: 50,
            width: size.width,
            child: Center(
              child: Text(
                "We are here for you",
                style: ThemText.cardText.copyWith(color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 350,
            width: size.width,
            child: HtmlElementView(viewType: htmlId),
          ),
          //Footer
          FooterView(size: size, data: widget.data)
        ],
      ),
    );
  }
}
