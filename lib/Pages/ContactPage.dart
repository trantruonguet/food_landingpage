import 'package:flutter/cupertino.dart';
import 'package:solmusic/Firebase/SectionData.dart';
import 'package:solmusic/Style/Style.dart';

class ContactPage extends StatelessWidget {
  final List<SectionData> data;

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
                            if ((data[index].title ?? "").isNotEmpty)
                              Text(
                                  "${data[index].title}",
                                  style: ThemText.bigTextTitle
                                      .copyWith(fontSize: 15)
                              ),
                            SizedBox(height: 16),
                            if ((data[index].content ?? "").isNotEmpty)
                              Text(
                                  "${data[index].content}",
                                  // style: ThemText.bigTextTitle
                                  //     .copyWith(fontSize: 15)
                              ),
                            if ((data[index].subContent ?? "").isNotEmpty)
                              Text(
                                "${data[index].subContent}",
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
                    itemCount: data.length,
                    shrinkWrap: true,
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

}
