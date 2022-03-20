import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sensorid/motion.dart';
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
      //'/sensor': (context) => MyApp2()
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
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cam');
              },
              child: const Icon(Icons.camera_alt),
            ),
            FloatingActionButton(
              onPressed: () {
                //Navigator.pushNamed(context, '/sensor');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyApp2(),
                  ),
                );
              },
              child: const Icon(Icons.ac_unit),
            ),
          ],
        ));
  }
}
