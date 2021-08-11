import 'dart:io';
import 'package:exam_project/screens/app_screen/app_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../main.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  var _formKey = GlobalKey<FormState>();
  TextEditingController smsCode = TextEditingController();
  String? _usernameInput;
  String? _phoneNumberInput;
  PageController _scrollController = PageController();

  String? _verificationId;

  final ImagePicker _picker = ImagePicker();

  _imgFromGallery() async {
    XFile? image =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      MyApp.variables.imageAvatar = File(image!.path);
    });
  }

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().then(
      (value) {
        MyApp.variables.initializeFirebase = value;
        MyApp.variables.authUser = FirebaseAuth.instance;
      },
    );
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  SizedBox(height: 16.0),
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
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "Welcome back!",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: MyApp.variables.kTextColor,
                      ),
                    ),
                  ),
                  Container(
                    height: 250.0,
                    child: PageView(
                      controller: _scrollController,
                      children: [
                        Container(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              children: [
                                Text(
                                  "Enter the username and phone number for sing up",
                                  style: TextStyle(
                                    color: MyApp.variables.kTextColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.0,
                                  ),
                                ),
                                SizedBox(height: 46.0),
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    prefixIcon: Icon(
                                      CupertinoIcons.person,
                                    ),
                                    hintText: "Enter username...",
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                  ),
                                  validator: (e) {
                                    if (e!.isEmpty) {
                                      return "Enter the username in full!";
                                    }
                                  },
                                  onSaved: (e) {
                                    _usernameInput = e;
                                  },
                                ),
                                SizedBox(height: 16.0),
                                TextFormField(
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    prefixIcon: Icon(CupertinoIcons.phone),
                                    hintText: "Enter phone number...",
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(30.0)),
                                    fillColor: Colors.white,
                                    filled: true,
                                  ),
                                  maxLength: 13,
                                  initialValue: "+998",
                                  validator: (e) {
                                    if (e!.length != 13) {
                                      return "Enter the phone number in full!";
                                    }
                                  },
                                  onSaved: (e) {
                                    _phoneNumberInput = e;
                                  },
                                ),
                                Container(
                                  width: 100.0,
                                  height: 40.0,
                                  child: TextButton(
                                    onPressed: () {
                                      _scrollController.jumpToPage(1);
                                      _phoneVerify();
                                    },
                                    child: Text(
                                      "NEXT",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    style: OutlinedButton.styleFrom(
                                      backgroundColor:
                                          MyApp.variables.kPrimaryLightColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 200.0,
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            children: [
                              Text(
                                "Enter the sms code",
                                style: TextStyle(
                                  color: MyApp.variables.kTextColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.0,
                                ),
                              ),
                              SizedBox(height: 46.0),
                              TextFormField(
                                controller: smsCode,
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  prefixIcon: Icon(Icons.message),
                                  hintText: "SMS CODE",
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                                maxLength: 6,
                              ),
                              SizedBox(height: 20.0),
                              Container(
                                width: 120.0,
                                height: 40.0,
                                child: TextButton(
                                  onPressed: () async {
                                    PhoneAuthCredential phoneAuthCredential =
                                        PhoneAuthProvider.credential(
                                            verificationId: _verificationId!,
                                            smsCode: smsCode.text);
                                    await MyApp.variables.authUser!
                                        .signInWithCredential(
                                            phoneAuthCredential);

                                    await MyApp.variables.authUser!.currentUser!
                                        .updateDisplayName(_usernameInput);

                                    await Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AppScreen(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "CONFIRM",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor:
                                        MyApp.variables.kPrimaryLightColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _phoneVerify() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print(_phoneNumberInput);
      try {
        MyApp.variables.authUser!.verifyPhoneNumber(
          phoneNumber: _phoneNumberInput!,
          verificationCompleted: (PhoneAuthCredential credential) {},
          verificationFailed: (FirebaseAuthException credential) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Invalid Code!"),
              ),
            );
          },
          codeSent: (String verificationId, int? resendToken) async {
            _verificationId = verificationId;
          },
          codeAutoRetrievalTimeout: (String text) {
            print("TEXT $text");
          },
        );
      } catch (e) {
        print(e);
      }
    }
  }
}
