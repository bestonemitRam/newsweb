import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firabase_storage;
import 'package:http/http.dart' as http;

class RetailerController extends GetxController {
  Rx<File?> imageFile = Rx<File?>(null);
  String selectedFile = '';

  Rx<Uint8List?> imageBytes = Rx<Uint8List?>(null);
  Rx<Uint8List?> imageVideo = Rx<Uint8List?>(null);
  late Uint8List selectedImageInBytes;

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
        selectedFile = result.files.first.name;
        selectedImageInBytes = result.files.first.bytes!;

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

  Future<String> uploadFile() async {
    String imageUrl = '';
    try {
      firabase_storage.UploadTask uploadTask;

      firabase_storage.Reference ref = firabase_storage.FirebaseStorage.instance
          .ref()
          .child('product')
          .child('/' + selectedFile);

      final metadata =
          firabase_storage.SettableMetadata(contentType: 'image/jpeg');

      //uploadTask = ref.putFile(File(file.path));
      uploadTask = ref.putData(selectedImageInBytes, metadata);

      await uploadTask.whenComplete(() => null);
      imageUrl = await ref.getDownloadURL();
    } catch (e) {
      print(e);
    }
    return imageUrl;
  }

  Future<void> addData() async {
    String imageUrl = await uploadFile();
    FirebaseFirestore.instance.collection('shortnews').add({
      'description': newsDescription.text,
      'from': referenceController.text,
      'img': imageUrl,
      'language': selectedValue.value,
      'news_link': referenceURLController.text,
      'takenby': 'value2',
      'title': titleController.text,
      'video': 'value2',
      "newsType": selectedtype.value,
      "news_id":'',
    }).then((value)
     {
        Fluttertoast.showToast(
          msg: "Data added successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
      print("Data added successfully with ID: ${value.id}");
    }).catchError((error) {
      print("Failed to add data: $error");
    });
  }
}
