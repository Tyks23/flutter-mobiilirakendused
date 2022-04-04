import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'motion.dart';
import 'cameraScreen.dart';
import 'dart:async';
import 'dart:io';
import 'objectsonplanesexample.dart';
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
      '/sensor': (context) => MyApp2(),
      '/ar': (context) => ObjectsOnPlanesWidget(),
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
      floatingActionButton: Wrap(
        //will break to another line on overflow
        direction: Axis.horizontal, //use vertical to show  on vertical axis
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(top: 20, left: 10, right: 10),
              child: FloatingActionButton(
                heroTag: "camera",
                onPressed: () {
                  Navigator.pushNamed(context, '/cam');
                },
                child: const Icon(Icons.camera_alt),
              )), //button first

          Container(
              margin: EdgeInsets.only(top: 20, right: 10),
              child: FloatingActionButton(
                heroTag: "sensors",
                onPressed: () {
                  Navigator.pushNamed(context, '/sensor');
                },
                child: const Icon(Icons.ac_unit),
              )),
          Container(
              margin: EdgeInsets.only(top: 20),
              child: FloatingActionButton(
                heroTag: "ar",
                onPressed: () {
                  Navigator.pushNamed(context, '/ar');
                },
                child: const Text("AR"),
              )), // button second // button third

          // Add more buttons here
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
