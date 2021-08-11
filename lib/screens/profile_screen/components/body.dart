import 'package:exam_project/screens/profile_screen/components/setting_button.dart';
import 'package:exam_project/widgets/custom_app_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:io';
import 'package:image_picker/image_picker.dart';

import '../../../main.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final ImagePicker _picker = ImagePicker();

  _imgFromGallery() async {
    XFile? image =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      MyApp.variables.imageAvatar = File(image!.path);
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                  leading: new Icon(Icons.photo_library),
                  title: new Text('Photo Library'),
                  onTap: () {
                    _imgFromGallery();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      padding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          Row(
            children: [
              InkWell(
                onTap: () {
                  _showPicker(context);
                },
                child: MyApp.variables.imageAvatar != null
                    ? CircleAvatar(
                        backgroundImage:
                            FileImage(MyApp.variables.imageAvatar!),
                        radius: 40.0,
                        backgroundColor: Colors.indigo.shade400,
                      )
                    : CircleAvatar(
                        radius: 40.0,
                        backgroundColor: MyApp.variables.kPrimaryLightColor,
                        child: Icon(
                          CupertinoIcons.camera,
                          color: Colors.grey.shade100,
                          size: 32.0,
                        ),
                      ),
              ),
              SizedBox(width: 24.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${MyApp.variables.authUser!.currentUser!.displayName.toString()}",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    "Uzbekistan",
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 24.0),
          Text(
            "Settings",
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          SettingButton(
            title: "Edit Name",
            icon: AssetImage("assets/icons/pencil.png"),
          ),
          SizedBox(height: 16.0),
          SettingButton(
            title: "Change Number",
            icon: AssetImage("assets/icons/smartphone.png"),
          ),
          SizedBox(height: 16.0),
          SettingButton(
            title: "Log Out",
            icon: AssetImage("assets/icons/logout.png"),
          ),
        ],
      ),
    );
  }
}
