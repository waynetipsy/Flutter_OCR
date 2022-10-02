import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class RecognizedPage extends StatefulWidget {
  final String? path;
 const RecognizedPage({Key? key, this.path}) : super(key: key);

  @override
  State<RecognizedPage> createState() => _RecognizedPageState();
}

class _RecognizedPageState extends State<RecognizedPage> {
   bool _isBusy = false;

   TextEditingController controller =TextEditingController();

   @override
  void initState() {
    
    super.initState();

    final InputImage inputImage = InputImage.fromFilePath(widget.path!);

    processImage(inputImage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Recognized Page"),),
      body: _isBusy == true ? const Center(
        child:  CircularProgressIndicator(),
      ) : Container(
        padding: const EdgeInsets.all(20),
        child: TextFormField(
          maxLines: MediaQuery.of(context).size.height.toInt(),
          controller: controller,
          decoration: const InputDecoration(
            hintText: "Text goes here"
          ),
        ),
      )
    );
  }
  void processImage(InputImage image) async{
    
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    
    setState(() {
      _isBusy = true;
    });

    log(image.filePath!);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(image);

    controller.text = recognizedText.text;

    //End busy state
     setState(() {
       _isBusy = false; 
     });
  }
}