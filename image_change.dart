import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageChange extends StatefulWidget {
  const ImageChange({Key? key}) : super(key: key);

  @override
  State<ImageChange> createState() => _ImageChangeState();
}

class _ImageChangeState extends State<ImageChange> {
  File? image; // Initialize with null

  final picker = ImagePicker();

  void changeImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {
        image = File(pickedImage.path);
      } else {
        // Handle case where pickedImage is null
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('No image selected')));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 100,
            backgroundColor: Colors.teal,
            backgroundImage: image != null ? Image.file(image!, fit: BoxFit.fill).image : null,
            child: image == null ? Text("image") : null,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: changeImage,
                child: Text(
                  "Upload Image",
                  style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
                ),
              ),
              TextButton(
                onPressed: changeImage,
                child: Text(
                  "Edit Image",
                  style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}