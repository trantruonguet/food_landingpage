import 'package:flutter/material.dart';
import 'package:solmusic/Firebase/FirestoreData.dart';
import 'package:solmusic/Style/Style.dart';
import 'package:solmusic/Pages/Views/FooterView.dart';

// ignore: must_be_immutable
class ContactMobilePage extends StatelessWidget {
  ContactMobilePage({
    this.data,
  });

  FirestoreData? data;

  @override
  Widget build(BuildContext context) {
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
              style: ThemText.describtionText.copyWith(fontSize: 20),
            ),
            ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if ((data?.aboutUs?[index].title ?? "").isNotEmpty)
                          Text("${data?.aboutUs?[index].title}",
                              style:
                                  ThemText.bigTextTitle.copyWith(fontSize: 14)),
                        SizedBox(height: 12),
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
                    ));
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 8,
                );
              },
              itemCount: data?.aboutUs?.length ?? 0,
              shrinkWrap: true,
            ),
            FooterMobileView(size: size, data: data)
          ],
        ),
      ),
    );
  }
}
