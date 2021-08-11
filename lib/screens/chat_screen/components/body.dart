import 'dart:ui';

import 'package:exam_project/main.dart';
import 'package:exam_project/scheme/picture.dart';
import 'package:exam_project/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'message_item_widget.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<List<Picture>>? _futurePictures;
  List<Picture>? _pictures;
  @override
  void initState() {
    super.initState();
    _futurePictures = MyApp.variables.database!.queryPicture();
  }

  void _getPictures() async {
    for (String item in MyApp.pictures) {
      var image = await http.get(Uri.parse(item));

      var bytes = image.bodyBytes;
      Picture picture = Picture(picture: bytes);

      MyApp.variables.database!.insertPicture(picture);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Picture>>(
      future: _futurePictures,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          _pictures = snapshot.data!;
          if (_pictures!.length == 0) {
            _getPictures();
            return ListView.builder(
              physics: AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              padding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 16.0),
              itemCount: MyApp.pictures.length + 2,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return CustomAppBar();
                }

                if (index == 1) {
                  return Padding(
                    padding: EdgeInsets.only(top: 8.0, bottom: 28.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Your Message",
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          "You have 9 Messages",
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return MessageItemWidget(
                  image: NetworkImage(MyApp.pictures[index - 2]),
                  title: "Billy Jack",
                  date: "12 July",
                  subtitle: "+\$20,256",
                );
              },
            );
          } else {
            return ListView.builder(
              physics: AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              padding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 16.0),
              itemCount: MyApp.pictures.length + 2,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return CustomAppBar();
                }

                if (index == 1) {
                  return Padding(
                    padding: EdgeInsets.only(top: 8.0, bottom: 28.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Your Message",
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          "You have 9 Messages",
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return MessageItemWidget(
                  image: MemoryImage(_pictures![index - 2].picture!),
                  title: "Billy Jack",
                  date: "12 July",
                  subtitle: "+\$20,256",
                );
              },
            );
          }
        }

        if (snapshot.hasError) {
          return Center(
            child: Text("${snapshot.error}"),
          );
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
