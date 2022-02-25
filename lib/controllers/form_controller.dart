import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddItemController extends GetxController {
  /// State variable to hold form data
  final Map formData = <String, dynamic>{}.obs;
  final List selectedPhotos = <XFile>[].obs;

  /// Handle add photo from camera
  Future<void> addPhotoFromCamera() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      selectedPhotos.add(photo);
    }
  }

  /// Handle add photo from gallery
  Future<void> addPhotoFromGallery() async {
    final ImagePicker _picker = ImagePicker();
    final List<XFile>? photos = await _picker.pickMultiImage();
    if (photos != null) {
      selectedPhotos.addAll(photos);
    }
  }

  /// Add data to firestore and firebase storage
  Future<void> addItemToFirebase() async {
    debugPrint("\x1B[33m Adding Item to Firebase \x1B[0m");
    List<String> uploadedPhotoUrls = [];
    for (var photoFile in selectedPhotos) {
      debugPrint("\x1B[33m ${photoFile.path} \x1B[0m");
      File file = File(photoFile.path);
      try {
        firebase_storage.TaskSnapshot response = await firebase_storage
            .FirebaseStorage.instance
            .ref('house/' + photoFile.name)
            .putFile(file);
        uploadedPhotoUrls.add(response.ref.fullPath);
      } on FirebaseException catch (e) {
        debugPrint("\x1B[35m $e \x1B[0m");
      }
    }
    formData['photos'] = uploadedPhotoUrls;
    CollectionReference _itemsRef =
        FirebaseFirestore.instance.collection('items');
    _itemsRef.add(formData).then((value) {
      debugPrint("\x1B[33m Success: $value \x1B[0m");
    }).catchError((error) => {debugPrint("\x1B[33m $error \x1B[0m")});
  }
}
