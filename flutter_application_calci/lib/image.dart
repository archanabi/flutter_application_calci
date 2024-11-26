
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';

class ImageUploadScreen extends StatefulWidget {
  @override
  _ImageUploadScreenState createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen> {
  final _imageNotifier = ValueNotifier<XFile?>(null);
  final ImagePicker _picker = ImagePicker();

  // Function to request permissions
  Future<void> _requestPermission(Permission permission) async {
    PermissionStatus status = await permission.request();
    if (status.isGranted) {
      print('Permission granted');
    } else {
      print('Permission denied');
      // Optionally show an alert or message to the user explaining why permission is needed
    }
  }

  // Function to pick an image from the gallery
  Future<void> _pickImageFromGallery() async {
    // Check and request storage permission
    PermissionStatus status = await Permission.photos.request();
    if (status.isGranted) {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        _imageNotifier.value = pickedFile;
      }
    } else {
      print("Permission to access photos denied.");
    }
  }

  // Function to capture an image using the camera
  Future<void> _pickImageFromCamera() async {
    // Check and request camera permission
    PermissionStatus status = await Permission.camera.request();
    if (status.isGranted) {
      final pickedFile = await _picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        _imageNotifier.value = pickedFile;
      }
    } else {
      print("Permission to access camera denied.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the selected image or a placeholder text
            ValueListenableBuilder(
              valueListenable: _imageNotifier,
              builder: (context, image, child) {
                return image != null
                    ? Image.file(
                        File(image.path),
                      )
                    : Text('No image selected');
              },
            ),
      
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _pickImageFromGallery,
                  child: Text('Pick from Gallery'),
                ),
                ElevatedButton(
                  onPressed: _pickImageFromCamera,
                  child: Text('Capture with Camera'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}