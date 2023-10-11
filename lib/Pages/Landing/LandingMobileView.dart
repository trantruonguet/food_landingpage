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

class LandingMobileView extends StatefulWidget {
  final FirestoreData? data;

  const LandingMobileView({super.key, required this.data});

  @override
  _LandingMobileViewState createState() => _LandingMobileViewState();
}

class _LandingMobileViewState extends State<LandingMobileView> {
  _LandingMobileViewState();

  final PlatformWebViewController _controller = PlatformWebViewController(
    const PlatformWebViewControllerCreationParams(),
  )..loadRequest(LoadRequestParams(
      uri: Uri.parse(
        // "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3333.967410377096!2d-111.89998968453055!3d33.31966746342457!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMzPCsDE5JzEwLjgiTiAxMTHCsDUzJzUyLjEiVw!5e0!3m2!1sen!2sus!4v1516690469899",
        "https://maps-api-ssl.google.com/maps?hl=vi&ll=47.884867,11.915334&output=embed&q=Kirchdorfer+Str.+14b,+83052+Bruckm%C3%BChl,+Deutschland+(King+Keng+-+Vietnamesisches+Spezialit%C3%A4ten+Restaurant)&z=16",
      ),
    ));

  @override
  void initState() {
    super.initState();
  }

  Widget customFlexible(String text, String labelText, String subText,
      var image, bool imageLeft, bool isTheLast) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Column(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (imageLeft)
                    Flexible(
                      flex: 1,
                      child: ImageMultipleSource(
                        imageUrl: image,
                        size: Size(size.width * 0.3, size.width * 0.35),
                      ),
                    ),
                  if (imageLeft)
                    SizedBox(
                      width: 12,
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
                          style: ThemText.createTextMobile,
                        ),
                      ],
                    ),
                  ),
                  if (!imageLeft)
                    Flexible(
                      flex: 1,
                      child: ImageMultipleSource(
                        imageUrl: image,
                        size: Size(size.width * 0.3, size.width * 0.35),
                      ),
                    ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                labelText,
                style: ThemText.createTextMobile,
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
      padding: const EdgeInsets.all(4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0), color: Colors.teal),
            height: MediaQuery.of(context).size.width * 0.5,
            width: MediaQuery.of(context).size.width * 0.7,
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
            style: ThemText.cardTextMobile,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 16.0,
          ),
          Text(
            description,
            style: ThemText.describtionTextMobile,
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
        ..center = mapGG.LatLng(double.parse(widget.data?.latitude ?? "0"), double.parse(widget.data?.longitude ?? "0"));

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
            // height: size.height,
            width: size.width,
            color: Color(0xff0A183D),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  width: size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: size.width * 0.40,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.data?.overview?.title ?? "",
                                  style: ThemText.homewhiteTitleMobile,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: size.width / 2,
                            child: Image.asset(
                                "images/landing1.jpeg"),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
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
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 48,
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
                      ),
                    ],
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
                        style: ThemText.whititleTextMobile,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
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
            height: size.height * 1.5,
            width: size.width,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
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
          //   child: HtmlElementView(viewType: htmlId),
          // ),
          Container(
            height: 550,
            width: size.width,
            child: PlatformWebViewWidget(
              PlatformWebViewWidgetCreationParams(controller: _controller),
            ).build(context),
          ),
          //Footer
          FooterMobileView(size: size, data: widget.data)
        ],
      ),
    );
  }
}
