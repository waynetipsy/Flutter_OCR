import 'package:flutter/material.dart';

void imagePickerModal(BuildContext context,
 {VoidCallback? onCameraTop, VoidCallback? onGallery}) {
  showModalBottomSheet(
    context: context,
     builder: (context){
        return Container(
          padding: const EdgeInsets.all(20),
          height: 220,
          child: Column(
            children: [
              GestureDetector(
                onTap: onCameraTop,
                child: Card(
                  child: Container(
                    alignment: Alignment.center,
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(color: Colors.grey),
                    child:const Text("Camera", 
                    style: TextStyle(
                     fontWeight: FontWeight.bold, fontSize: 20 
                    ),),
                  ),
                ),
              ),
             const SizedBox(height:10),
             GestureDetector(
               onTap: onGallery,
               child: Card(
                  child: Container(
                    alignment: Alignment.center,
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(color: Colors.grey),
                    child:const Text("Gallery", 
                    style: TextStyle(
                     fontWeight: FontWeight.bold, fontSize: 20 
                    ),),
                  ),
                ),
             ),
            ],
          ),
        );
     }
     );
}