import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:test_project/settingsScreen.dart';
import 'models/theme_model.dart';
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

  runApp(
    MyApp(camera: firstCamera));
    // initialRoute: '/',
    // routes: {
    //   '/': (context) => MyApp(),
    //   '/cam': (context) => TakePictureScreen(camera: firstCamera),
    //   '/sensor': (context) => MyApp2(),
    //   '/ar': (context) => ObjectsOnPlanesWidget(),
    // }

}

class MyApp extends StatelessWidget {
  var camera;

   MyApp({
    Key? key,
    required this.camera,
  }) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeModel(),
      child: Consumer<ThemeModel>(
          builder: (context, ThemeModel themeNotifier, child) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: themeNotifier.isDark ? ThemeData.dark() : ThemeData.light(),
              debugShowCheckedModeBanner: false,
              home: MyHomePage(camera: camera),
            );
          }),
    );
  }
}
class MyHomePage extends StatefulWidget {
  var camera;

  MyHomePage({
    Key? key,
    required this.camera,
  }) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState(camera: camera);
}

class _MyHomePageState extends State<MyHomePage> {
  var camera;

  _MyHomePageState({
    Key? key,
    required this.camera,
  });
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(themeNotifier.isDark ? "Dark Mode" : "Light Mode"),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TakePictureScreen(camera: camera)),
                        );
                      },
                      child: const Icon(Icons.camera_alt),
                    )), //button first

                Container(
                    margin: EdgeInsets.only(top: 20, right: 10),
                    child: FloatingActionButton(
                      heroTag: "sensors",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyApp2()),
                        );
                      },
                      child: const Icon(Icons.ac_unit),
                    )),
                Container(
                    margin: EdgeInsets.only(top: 20),
                    child: FloatingActionButton(
                      heroTag: "ar",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ObjectsOnPlanesWidget()),
                        );
                      },
                      child: const Text("AR"),
                    )),
                Container(
                    margin: EdgeInsets.only(top: 20, left: 10, right: 10),
                    child: FloatingActionButton(
                      heroTag: "settings",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Settings()),
                        );
                      },
                      child: const Icon(Icons.settings),
                    )), // bu// button second // button third

                // Add more buttons here
              ],
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          );
        });
  }
}
