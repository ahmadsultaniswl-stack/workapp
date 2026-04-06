import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'image_model.dart';

class ImageController extends GetxController {
  var images = <FirebaseImage>[].obs;
  var isLoading = false.obs;
  var selectedImage = Rx<File?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchImages();
  }

  Future<void> uploadImage() async {
    try {
      isLoading.value = true;

      final XFile? image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (image != null) {
        File file = File(image.path);
        selectedImage.value = file;

        String fileName = 'image_${DateTime.now().millisecondsSinceEpoch}.jpg';

        TaskSnapshot snapshot = await FirebaseStorage.instance
            .ref('images/$fileName')
            .putFile(file);

        String downloadUrl = await snapshot.ref.getDownloadURL();

        FirebaseImage newImage = FirebaseImage(
          url: downloadUrl,
          name: fileName,
          uploadedAt: DateTime.now(),
        );

        images.add(newImage);

        Get.snackbar('Success', 'Image uploaded successfully!');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to upload image: $e');
      print('Failed to upload image: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // READ - Fetch all images from Firebase Storage
  Future<void> fetchImages() async {
    try {
      isLoading.value = true;

      final ListResult result = await FirebaseStorage.instance
          .ref('images')
          .listAll();

      List<FirebaseImage> imageList = [];
      // Study what are loops
      for (var ref in result.items) {
        String downloadUrl = await ref.getDownloadURL();
        String name = ref.name;

        // Get metadata for upload time
        final metadata = await ref.getMetadata();

        FirebaseImage image = FirebaseImage(
          url: downloadUrl,
          name: name,
          uploadedAt: metadata.timeCreated ?? DateTime.now(),
        );

        imageList.add(image);
      }

      images.assignAll(imageList);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch images: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteImage(FirebaseImage image) async {
    try {
      await FirebaseStorage.instance.ref('images/${image.name}').delete();

      images.remove(image);

      Get.snackbar('Success', 'Image deleted successfully!');
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete image: $e');
    }
  }

  void clearSelectedImage() {
    selectedImage.value = null;
  }
}
