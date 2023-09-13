// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:google_maps/google_maps.dart' as mapGG;
import 'package:google_maps_flutter_web/google_maps_flutter_web.dart';
import 'package:solmusic/Firebase/FirestoreDBRepo.dart';
import 'package:solmusic/Firebase/FirestoreData.dart';
import 'package:solmusic/Pages/Views/FooterView.dart';
import 'package:solmusic/Style/Style.dart';
import 'package:solmusic/Widget/RoundedButton.dart';
import 'dart:ui' as ui;


import 'Views/ImageMultipleSource.dart';

class LandingPage extends StatefulWidget {
  final FirestoreData? data;

  const LandingPage({super.key, this.data});

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 1200) {
          //For Desktop Screen
          return DesktopPage(data: widget.data);
        } else if (constraints.maxWidth >= 800 &&
            constraints.maxWidth <= 1200) {
          //for Tablet Screen
          return DesktopPage(data: widget.data);
        } else {
          //for mobile Screen
          return DesktopPage(data: widget.data);
        }
      },
    );
  }
}

class DesktopPage extends StatefulWidget {
  final FirestoreData? data;

  const DesktopPage({super.key, required this.data});

  @override
  _DesktopPageState createState() => _DesktopPageState();
}

class _DesktopPageState extends State<DesktopPage> {

  _DesktopPageState();

  @override
  void initState() {
    // TODO: implement initState
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
      // ),
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
                              textTitle: widget.data?.overview?.buttonTitle ?? "",
                              onPressed: () {

                              },
                            ),
                            // RoundedButton(
                            //   color: Color(0xff383B70),
                            //   textTitle: "start free trial",
                            // ),
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
                    child: ImageMultipleSource(imageUrl: widget.data?.overview?.imageUrl ?? ""),
                  ),
                ),
              ],
            ),
          ),

          //Unlimited Access
          // Container(
          //   height: size.height * 0.74,
          //   width: size.width,
          //   color: Colors.white,
          //   child: Row(
          //     children: [
          //       Container(
          //         alignment: Alignment.center,
          //         width: size.width / 2,
          //         child: Padding(
          //           padding: const EdgeInsets.symmetric(horizontal: 26.0),
          //           child: Wrap(
          //             children: [
          //               Text(
          //                 "Welcome",
          //                 style: ThemText.bigTextTitle,
          //               )
          //             ],
          //           ),
          //         ),
          //       ),
          //       Container(
          //         width: size.width / 2,
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Wrap(
          //               children: [
          //                 Padding(
          //                   padding:
          //                       const EdgeInsets.symmetric(horizontal: 16.0),
          //                   child: Text(
          //                     "With us you will experience our philosophy and enjoy the unique quality of our original Japanese sushi. \nWe serve a large selection of first-class sushi and Vietnamese dishes in a cozy East Asian ambience. \nYou can also rely on us when it comes to choosing drinks. Whether you want a homemade iced tea, a fresh mint tea with ginger or an Asian beer - our drinks menu offers numerous specialties as well as well-known alcoholic and soft drinks.",
          //                     style: ThemText.describtionText,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //             SizedBox(
          //               height: 22.0,
          //             ),
          //             RoundedButton(
          //               color: Color(0xff383B70),
          //               textTitle: "Our airy and cozy space will be especially suitable for you and your beloved one. \nWe are looking forward to your visit!",
          //               onPressed: () {
          //
          //               }
          //             ),
          //           ],
          //         ),
          //       )
          //     ],
          //   ),
          // ),

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
                      for (final (index, item) in widget.data?.menus?.indexed ?? [].indexed)
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
                          ...widget.data?.horizontalSlogans?.map((e) =>
                            Flexible(
                            flex: 1,
                            child: customCard(
                            e.title,
                            e.content,
                            e.imageUrl,
                            )),
                          ) ?? [],
                          // Flexible(
                          //     flex: 1,
                          //     child: customCard(
                          //       'THE BEST RESTAURANT',
                          //       "With us you not only enjoy delicious food, but also a diverse Asian cuisine. \nFor all food bloggers: Take a photo and share it immediately on Instagram - no problem, we have free WiFi",
                          //       'images/pic2.jfif',
                          //     )),
                          // Flexible(
                          //     flex: 1,
                          //     child: customCard(
                          //       'PERFECT FOR FAMILY',
                          //       "Our air is filled with aroma. \nIf you are looking for a spacious, comfortable, luxurious and cozy place to meet up with friends and family, VietStreet Restaurant is the best choice",
                          //       'images/pic3.jfif',
                          //     )),
                          // Flexible(
                          //     flex: 1,
                          //     child: customCard(
                          //       'FRESH EVERY DAY',
                          //       'Our dishes are prepared exclusively with fresh and high-quality ingredients. \nYour health and satisfaction is always our top priority',
                          //       'images/pic4.jfif',
                          //     )),
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
          //Subscription
          // Container(
          //   alignment: Alignment.center,
          //   height: size.height,
          //   width: size.width,
          //   color: Color(0xff0A183D),
          //   child: Row(
          //     children: [
          //       Expanded(
          //         flex: 1,
          //         child: Container(
          //           child: Padding(
          //             padding: const EdgeInsets.symmetric(horizontal: 32.0),
          //             child: Column(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Padding(
          //                   padding:
          //                       const EdgeInsets.symmetric(horizontal: 16.0),
          //                   child: Wrap(
          //                     children: [
          //                       Text(
          //                         "Subscription from \$15/month",
          //                         style: ThemText.whititleText,
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //                 SizedBox(
          //                   height: 18.0,
          //                 ),
          //                 Padding(
          //                   padding:
          //                       const EdgeInsets.symmetric(horizontal: 16.0),
          //                   child: Wrap(
          //                     children: [
          //                       Text(
          //                         "Start a free trial now",
          //                         style: ThemText.pinkText,
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //                 SizedBox(
          //                   height: 18.0,
          //                 ),
          //                 Padding(
          //                   padding:
          //                       const EdgeInsets.symmetric(horizontal: 16.0),
          //                   child: Wrap(
          //                     children: [
          //                       Text(
          //                         "SConsectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
          //                         style: ThemText.describtionTex,
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //                 SizedBox(
          //                   height: 20.0,
          //                 ),
          //                 RoundedButton(
          //                   color: Color(0xffF24854),
          //                   textTitle: 'try it now',
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //       Expanded(
          //         child: Padding(
          //           padding: const EdgeInsets.symmetric(horizontal: 60.0),
          //           child: Card(
          //             shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(16.0),
          //             ),
          //             color: Color(0xff1B2949),
          //             child: Container(
          //               alignment: Alignment.center,
          //               height: MediaQuery.of(context).size.height * 0.65,
          //               child: Padding(
          //                 padding: const EdgeInsets.symmetric(horizontal: 32.0),
          //                 child: Column(
          //                   mainAxisAlignment: MainAxisAlignment.center,
          //                   children: [
          //                     customCheckBox('Play any track', true),
          //                     customCheckBox('Listen offline', true),
          //                     customCheckBox('No ad interruptions', true),
          //                     customCheckBox('Unlimited skips', true),
          //                     customCheckBox('High quality audio', true),
          //                     customCheckBox('Shuffle play', true),
          //                   ],
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

          // //People
          // Container(
          //   height: size.height * 0.65,
          //   width: size.width,
          //   color: Colors.white,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: [
          //       customCircleAvtar("No ad interruptions", "images/pic6.jfif",
          //           "Consectetur adipiscing elit"),
          //       customCircleAvtar("High Quality", "images/pic7.jfif",
          //           "Ectetur adipiscing elit"),
          //       customCircleAvtar("Listen Offline", "images/pic8.jfif",
          //           "Sed do eiusmod tempor"),
          //       customCircleAvtar(
          //           "Download Music", "images/pic9.jfif", "Adipiscing elit")
          //     ],
          //   ),
          // ),

          //Footer
          FooterView(size: size, data: widget.data)
        ],
      ),
    );
  }

}
