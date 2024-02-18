import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

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
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      } else {
        debugPrint('No image selected.');
      }
    });
  }

  Future<void> _uploadImage() async {
    setState(() {
      _isLoading = true;
    });

    if (_imageFile == null) {
      debugPrint('No image to upload.');
      return;
    }

    final user = _auth.currentUser;
    if (user == null) {
      debugPrint('No user logged in.');
      return;
    }

    final ref = FirebaseStorage.instance
        .ref()
        .child('user_images')
        .child('${user.uid}.jpg');

    await ref.putFile(_imageFile!);

    final url = await ref.getDownloadURL();

    await user.updatePhotoURL(url);

    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _removeImage() async {
    final user = _auth.currentUser;
    if (user == null) {
      debugPrint('No user logged in.');
      return;
    }

    await FirebaseStorage.instance
        .ref()
        .child('user_images')
        .child('${user.uid}.jpg')
        .delete();

    await user.updatePhotoURL(null);
  }

  Widget _buildBody(User? user) {
    if (_isLoading) {
      return Center(child: const CircularProgressIndicator());
    }

    return Column(
      children: [
        if (user?.photoURL != null)
          Image.network(user!.photoURL!),
        if (_imageFile != null)
          Image.file(_imageFile!),
        _buildButton('Pick Image', _pickImage),
        _buildButton('Upload Image', _uploadImage),
        if (user?.photoURL != null)
          _buildButton('Remove Image', _removeImage),
      ],
    );
  }

  Widget _buildButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text), // Removed 'const' keyword
    );
}

  @override
  Widget build(BuildContext context) {
    final user = _auth.currentUser;

    return Scaffold(
      body: _buildBody(user),
    );
  }
}