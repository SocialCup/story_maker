import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:story_maker/story_maker.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Story Designer Example'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              await [
                Permission.photos,
                Permission.storage,
              ].request();
              final picker = ImagePicker();
              final pickedFile = await picker.pickImage(source: ImageSource.gallery);
              if (pickedFile != null) {
                final editedFile = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => StoryMaker(
                      filePath: pickedFile.path,
                    ),
                  ),
                );
                setState(() {
                  image = editedFile;
                });
                print('editedFile: ${image?.path}');
              }
            },
            child: const Text('Pick Image'),
          ),
          if (image != null)
            Container(
                width: 200,
                height: 300,
                child: Image.file(
                  image!,
                  fit: BoxFit.fitHeight,
                ))
          // if (image != null)
          //   Expanded(
          //     child: Image.file(image!),
          //   ),
        ],
      ),
    );
  }
}
