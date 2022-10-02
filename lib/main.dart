import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_ocr/Utilis/image_picker_class.dart';
import 'package:flutter_ocr/Widgets/modal_dialog.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
       });
  }
  
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
       
        title: Text(widget.title),
      ),
      body: Center(
       
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children:  <Widget>[
           const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
           
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          imagePickerModal(context, 
          onCameraTop: () {
            log("Camera");
            pickImage(source: ImageSource.camera).then((value) {
               if(value != '') {

               }
            });
          },
          onGallery: () {
            log("Gallery");
            pickImage(source: ImageSource.gallery).then((value){

            });
          },
          );
        },
        tooltip: 'Increment',
      label: const Text("Scan Photo"),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}