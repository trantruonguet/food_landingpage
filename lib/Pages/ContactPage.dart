import 'package:flutter/cupertino.dart';
import 'package:solmusic/Firebase/FirestoreData.dart';
import 'package:solmusic/Firebase/SectionData.dart';
import 'package:solmusic/Pages/Views/FooterView.dart';
import 'package:solmusic/Style/Style.dart';

class ContactPage extends StatelessWidget {
  final FirestoreData? data;

  const ContactPage({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          var size = MediaQuery.of(context).size;
          return SingleChildScrollView(
            child: Container(
              width: size.width,
              child: Column(
                children: [
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    "Contact",
                    style: ThemText.describtionText.copyWith(fontSize: 32),
                  ),
                  ListView.separated(
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if ((data?.aboutUs?[index].title ?? "").isNotEmpty)
                              Text(
                                  "${data?.aboutUs?[index].title}",
                                  style: ThemText.bigTextTitle
                                      .copyWith(fontSize: 15)
                              ),
                            SizedBox(height: 16),
                            if ((data?.aboutUs?[index].content ?? "").isNotEmpty)
                              Text(
                                  "${data?.aboutUs?[index].content}",
                                  // style: ThemText.bigTextTitle
                                  //     .copyWith(fontSize: 15)
                              ),
                            if ((data?.aboutUs?[index].subContent ?? "").isNotEmpty)
                              Text(
                                "${data?.aboutUs?[index].subContent}",
                                // style: ThemText.bigTextTitle
                                //     .copyWith(fontSize: 15)
                              )
                          ],
                        )

                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 8,);
                    },
                    itemCount: data?.aboutUs?.length ?? 0,
                    shrinkWrap: true,
                  ),
                  FooterView(size: size,data: data)
                ],
              ),
            ),
          );
        }
    );
  }

}
