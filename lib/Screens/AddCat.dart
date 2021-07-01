import 'dart:io';
import 'package:catlog/Screens/HomePage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:catlog/Model/CatModel.dart';
import 'package:catlog/Widgets/MainDrawer.dart';
import 'package:catlog/Widgets/starRating.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddCat extends StatefulWidget {
  @override
  _AddCatState createState() => _AddCatState();
}

class _AddCatState extends State<AddCat> {
  String name = "";
  int rating = 0;
  TextEditingController catName = new TextEditingController();
  final picker = ImagePicker();
  File imagefile = new File('');
  bool _isLoading = false;

  Future getImage() async {
    var image = await picker.getImage(
        source: ImageSource.gallery,
        imageQuality: 50,
        maxHeight: 300,
        maxWidth: 200);
    setState(() {
      if (image != null) {
        imagefile = File(image.path);
      } else {
        CircularProgressIndicator();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF2471A3),
          title: Text("Add a cat"),
          centerTitle: true,
          actions: [Icon(Icons.more_vert)],
        ),
        drawer: Drawer(
          child: MainDrawer(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    TextFormField(
                      onChanged: (value) {
                        setState(() {
                          name = value;
                        });
                      },
                      controller: catName,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(),
                    ),
                    Text(
                      "Name",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Name",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(name),
                      ],
                    ),
                    Container(
                      height: 50,
                      child: StarRating(
                        rating: rating,
                        color: Colors.yellow,
                        onRatingChanged: (rating) =>
                            setState(() => this.rating = rating),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(),
                  child: Column(
                    children: [
                      Container(
                        height: 180,
                        width: 500,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                        ),
                        child: _isLoading
                            ? Padding(
                          padding:
                          const EdgeInsets.only(top: 150.0, left: 30),
                             child:Text(
                              "Insert cat image",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                        )
                            : Container(
                            child: imagefile != null
                                ? Image.file(
                              imagefile,
                              fit: BoxFit.cover,
                            )
                                : Icon(
                              Icons.image,
                              color: Colors.white,
                            )),
//
                      ),
                      Container(
                          height: 35,
                          //color: Colors.grey,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      getImage();
                                    },
                                    child: Text(
                                      "Upload Image",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.blue),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) => AddCat()));
                                        },
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                        ),
                                      ),
                                      SizedBox(width: 30),
                                      GestureDetector(
                                        onTap: () async {
                                          Cat c = new Cat(
                                              name: name,
                                              image: imagefile.toString(),
                                              location: "London",
                                              rating: rating);

                                          shopFor.add(c);
                                          print(shopFor);
                                          await Navigator.of(context)
                                              .push(new MaterialPageRoute(
                                              builder: (context) => HomePage(
                                                title: 'Cat-a-Log',
                                              )))
                                              .whenComplete(() {
                                            setState(() {
                                              shopFor = shopFor;
                                            });
                                          });
                                        },
                                        child: Text(
                                          "Save",
                                          style: TextStyle(
                                              fontSize: 16, color: Colors.blue),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )),
                      SizedBox(
                        //width:1,
                        child: Divider(
                          thickness: 1,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.smallcircle_circle,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Add Location",
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                        Text(
                          "You can't track me",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 100,
                  color: Colors.grey,
                ),
                Text(
                  "Location Details",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Set current location",
                      style: TextStyle(fontSize: 14, color: Colors.blue),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}