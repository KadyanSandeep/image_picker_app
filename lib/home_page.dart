import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ImagePicker _picker = ImagePicker();
  List<XFile> images = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Image Click Example")),
      body: Container(
        child: images.length > 0
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    childAspectRatio: 100 / 133),
                itemBuilder: (_, index) {
                  return Image.file(File(images[index].path));
                },
                itemCount: images.length,
              )
            : Center(
                child: Text(
                    "No Image Found\nClick on camera button to capture a image",textAlign: TextAlign.center,)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final XFile? photo =
              await _picker.pickImage(source: ImageSource.camera);
          setState(() {
            if (photo != null) {
              images.add(photo);
            }
            ;
          });
        },
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}
