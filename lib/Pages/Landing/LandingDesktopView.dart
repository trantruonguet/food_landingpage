// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:restaurentlanding/Firebase/FirestoreData.dart';
import 'package:restaurentlanding/Pages/Views/FooterView.dart';
import 'package:restaurentlanding/Pages/Views/ImageMultipleSource.dart';
import 'package:restaurentlanding/Style/Style.dart';
import 'dart:ui' as ui;
import 'package:google_maps/google_maps.dart' as mapGG;
import 'package:restaurentlanding/Widget/RoundedButton.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';

class LandingDesktopView extends StatefulWidget {
  final FirestoreData? data;

  const LandingDesktopView({super.key, required this.data});

  @override
  _LandingDesktopViewState createState() => _LandingDesktopViewState();
}

class _LandingDesktopViewState extends State<LandingDesktopView> {
  _LandingDesktopViewState();

  @override
  void initState() {
    super.initState();
  }

  Widget customFlexible(String text, String labelText, String subText,
      var image, bool imageLeft, bool isTheLast) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (imageLeft)
                Flexible(
                  flex: 1,
                  child: ImageMultipleSource(
                    imageUrl: image,
                    size: Size(size.width * 0.45, size.width * 0.3),
                  ),
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
              // if (!imageLeft) Spacer(),
              if (!imageLeft)
                Flexible(
                  flex: 1,
                  child: ImageMultipleSource(
                    imageUrl: image,
                    size: Size(size.width * 0.45, size.width * 0.3),
                  ),
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
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0), color: Colors.teal),
            height: MediaQuery.of(context).size.height * 0.47,
            width: MediaQuery.of(context).size.width * 0.22,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage(img),
              ),
            ),
          ),
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

  final PlatformWebViewController _controller = PlatformWebViewController(
    const PlatformWebViewControllerCreationParams(),
  )..loadRequest(LoadRequestParams(
      uri: Uri.parse(
        // "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3333.967410377096!2d-111.89998968453055!3d33.31966746342457!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMzPCsDE5JzEwLjgiTiAxMTHCsDUzJzUyLjEiVw!5e0!3m2!1sen!2sus!4v1516690469899",
        "https://maps-api-ssl.google.com/maps?hl=vi&ll=47.884867,11.915334&output=embed&q=Kirchdorfer+Str.+14b,+83052+Bruckm%C3%BChl,+Deutschland+(King+Keng+-+Vietnamesisches+Spezialit%C3%A4ten+Restaurant)&z=16",
      ),
    ));

  @override
  Widget build(BuildContext context) {
    final overviewImage = widget.data?.overview?.imageUrl ?? "";
    print("build overview imageUrl = $overviewImage");
    var size = MediaQuery.of(context).size;
    final String htmlId = "map";
    final String previewMapId = "preview_map";

    mapGG.MapTypeControlOptions mapTypeControlOptions =
        mapGG.MapTypeControlOptions();
    mapTypeControlOptions.style = mapGG.MapTypeControlStyle.DROPDOWN_MENU;

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
      final panControl = mapGG.PanControlOptions()
        ..position = mapGG.ControlPosition.BOTTOM_CENTER;
      final mapOptions = mapGG.MapOptions()
        ..zoom = 15.0
        ..center = mapGG.LatLng(47.884841, 11.915343)
        ..keyboardShortcuts = true
        ..gestureHandling = 'cooperative'
        ..panControl = true
        ..panControlOptions = panControl
        ..disableDefaultUI = true
        ..disableDoubleClickZoom = true
        // ..panControl = true
        // ..mapTypeControl = true
        // ..mapTypeControlOptions = mapTypeControlOptions
        ..zoomControl = true;
      // ..isFractionalZoomEnabled = true;

      // mapOptions.disableDoubleClickZoom = false;

      final elem = DivElement()..id = htmlId;
      // elem.addEventListener('wheel', (event) {
      //   // ignore: unrelated_type_equality_checks
      //   if (event is WheelEvent && event.getModifierState('Control') != 0) {
      //     event.preventDefault();
      //   }
      // });
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

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(previewMapId, (int viewId) {
      final panControl = mapGG.PanControlOptions()
        ..position = mapGG.ControlPosition.BOTTOM_CENTER;
      final mapOptions = mapGG.MapOptions()
        ..zoom = 15.0
        ..center = mapGG.LatLng(double.parse(widget.data?.latitude ?? "0"), double.parse(widget.data?.longitude ?? "0"))
        ..keyboardShortcuts = true
        ..gestureHandling = 'cooperative'
        ..panControl = true
        ..panControlOptions = panControl
        ..disableDefaultUI = true;

      final elem = DivElement()..id = htmlId;
      // elem.addEventListener('wheel', (event) {
      //   // ignore: unrelated_type_equality_checks
      //   if (event is WheelEvent && event.getModifierState('Control') != 0) {
      //     event.preventDefault();
      //   }
      // });
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
                        child: Container(
                          width: size.width * 0.40,
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
                      ),
                    ],
                  ),
                ),
                Container(
                  width: size.width / 2,
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Image.asset(
                      "images/landing1.jpeg"),
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
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
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
          // SizedBox(
          //   height: 350,
          //   width: size.width,
          //   child: Stack(
          //     children: [
          //       HtmlElementView(viewType: htmlId),
          //       Positioned(
          //         bottom: 20,
          //         left: 20,
          //         child: SizedBox(
          //           height: 50,
          //           width: 50,
          //           child: HtmlElementView(viewType: previewMapId),
          //         ),
          //       ),
          //       Positioned(
          //         top: 20,
          //         left: 20,
          //         child: Container(),
          //       )
          //     ],
          //   ),
          // ),

          Container(
            height: 550,
            width: size.width,
            child: PlatformWebViewWidget(
              PlatformWebViewWidgetCreationParams(controller: _controller),
            ).build(context),
          ),

          //Footer
          FooterView(size: size, data: widget.data)
        ],
      ),
    );
  }
}
