import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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

      if (result != null)
       {
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

  /////////////////////////////////////////

  TextEditingController titleController = TextEditingController();
  TextEditingController newsDescription = TextEditingController();
  TextEditingController referenceController = TextEditingController();
  TextEditingController referenceURLController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  final List<String> language = [
    'Select Language ',
    'Hindi',
    'English',
  ].obs;

  RxString selectedValue = 'Select Language '.obs;

  final List<String> slectNewsType = [
    'Select News Type',
    'My Feed',
    'All News',
    'Trending',
    'Book Mark',
    'Technology',
    'Entertainment',
    'Sports',
  ].obs;
  RxString selectedtype = 'Select News Type'.obs;

  void addData() {
    uploadImage(imageFile.value!);
    // FirebaseFirestore.instance.collection('Trending').add({
    //   'field1': 'value1',
    //   'field2': 'value2',
    //   // Add more fields as needed
    // }).then((value) {
    //   print("Data added successfully with ID: ${value.id}");
    // }).catchError((error) {
    //   print("Failed to add data: $error");
    // });
  }

  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String?> uploadImage(File imageFile) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference reference = _storage.ref().child('images/$fileName');
      UploadTask uploadTask = reference.putFile(imageFile);
      TaskSnapshot snapshot = await uploadTask.whenComplete(() => null);
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }
}
