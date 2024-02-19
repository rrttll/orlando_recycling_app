// File: /lib/screens/profile_screen.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  final _auth = FirebaseAuth.instance;
  final _picker = ImagePicker();
  File? _imageFile;
  bool _isLoading = false;

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _imageFile = pickedFile != null ? File(pickedFile.path) : null;
    });
  }

  Future<void> _uploadImage() async {
    if (_imageFile == null || _auth.currentUser == null) {
      debugPrint('No image to upload or no user logged in.');
      return;
    }

    setState(() => _isLoading = true);

    final ref = FirebaseStorage.instance
        .ref()
        .child('user_images')
        .child('${_auth.currentUser!.uid}.jpg');

    await ref.putFile(_imageFile!);
    final url = await ref.getDownloadURL();
    await _auth.currentUser!.updatePhotoURL(url);

    setState(() => _isLoading = false);
  }

  Future<void> _removeImage() async {
    if (_auth.currentUser == null) {
      debugPrint('No user logged in.');
      return;
    }

    await FirebaseStorage.instance
        .ref()
        .child('user_images')
        .child('${_auth.currentUser!.uid}.jpg')
        .delete();
    await _auth.currentUser!.updatePhotoURL(null);
  }

  Widget _buildBody(User? user) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      children: [
        if (user?.photoURL != null) Image.network(user!.photoURL!),
        if (_imageFile != null) Image.file(_imageFile!),
        _buildButton('Pick Image', _pickImage),
        _buildButton('Upload Image', _uploadImage),
        if (user?.photoURL != null) _buildButton('Remove Image', _removeImage),
      ],
    );
  }

  Widget _buildButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text), // 'const' cannot be applied here due to dynamic text
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = _auth.currentUser;
    return Scaffold(body: _buildBody(user));
  }
}
