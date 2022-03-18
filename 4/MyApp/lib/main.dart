import 'package:flutter/material.dart';
import 'cameraScreen.dart';
import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';

Future<void> main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;

  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => HomeScreen(),
      '/cam': (context) => TakePictureScreen(camera: firstCamera),
    },
    theme: ThemeData.dark(),
  ));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Blue page'),
          backgroundColor: Colors.blue,
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: "cameraRoute",
          onPressed: () {
            Navigator.pushNamed(context, '/cam');
          },
          child: const Icon(Icons.camera_alt),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
