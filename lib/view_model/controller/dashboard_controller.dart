import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';

class RetailerController extends GetxController {
  Rx<File?> imageFile = Rx<File?>(null);

  Rx<Uint8List?> imageBytes = Rx<Uint8List?>(null);
  Rx<Uint8List?> imageVideo = Rx<Uint8List?>(null);

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      imageFile.value = File(pickedFile.path);
    }
  }

  void selectImage() async {
    // Select file

    if (kIsWeb) {
      final result = await FilePicker.platform.pickFiles(
          // type: FileType.custom,
          //allowedExtensions: ['jpg', 'jpeg', 'png'],
          );

      if (result != null) {
        // Get file
        final file = result.files.first.bytes;

        // Update imageBytes with the selected image
        imageBytes.value = file;
      } else {
        // User canceled the picker
        print('User canceled image selection');
      }
      // Handle web-specific behavior
    }
  }

  RxString fileName = ''.obs;
  void selectvideo() async {
    if (kIsWeb) {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['mp4'],
      );

      if (result != null) {
        final fileanme = result.files.first;
        fileName.value = fileanme.name;
        final file = result.files.first.bytes;

        // Update imageBytes with the selected image
        //imageBytes.value = file;
      } else {
        // User canceled the picker
        print('User canceled image selection');
      }
      // Handle web-specific behavior
    }
  }

  void addData() 
  {
    FirebaseFirestore.instance.collection('Trending').add({
      'field1': 'value1',
      'field2': 'value2',
      // Add more fields as needed
    }).then((value) {
      print("Data added successfully with ID: ${value.id}");
    }).catchError((error) {
      print("Failed to add data: $error");
    });
  }
  // Function to handle image selection
}
