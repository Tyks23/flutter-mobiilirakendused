import 'dart:async';
import 'dart:io';
import 'package:android_path_provider/android_path_provider.dart';


Future<String> getExternalStorageDirectory() async {
  final directory = await AndroidPathProvider.documentsPath;
  String appDocumentsPath = directory;
  String filePath = '$appDocumentsPath/counter.txt';
  return filePath;
}

class CounterPreference {
  setCounter(int value) async {
    File file = File(await getExternalStorageDirectory());
    file.writeAsString(value.toString());
  }

  getCounter() async {
    File file = File(await getExternalStorageDirectory());
    String fileContent = await file.readAsString();
    return int.parse(fileContent);
  }
}