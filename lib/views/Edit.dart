// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  File? _profileImage;

  @override
  void initState() {
    _loadSavedData();
    super.initState();
  }

  Future<void> _loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _nameController.text = prefs.getString('name') ?? "";
      _emailController.text = prefs.getString('email') ?? "";
      _descriptionController.text = prefs.getString('description') ?? "";
      String? imagePath = prefs.getString('profile_image');
      if (imagePath != null) {
        _profileImage = File(imagePath);
      }
    });
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _profileImage = File(pickedImage.path);
      });

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('profile_image', pickedImage.path);
    }
  }

  void _saveProfileChanges() async {
    String newName = _nameController.text;
    String newEmail = _emailController.text;
    String newDescription = _descriptionController.text;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', newName);
    prefs.setString('email', newEmail);
    prefs.setString('description', newDescription);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Changes saved!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 38, 69),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 38, 69),
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: GestureDetector(
                  onTap: () {
                    _pickImage(
                      ImageSource.gallery,
                    ); // Allow image selection from gallery
                  },
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 50.0,
                        backgroundImage: _profileImage != null
                            ? Image.file(_profileImage!).image
                            : const AssetImage('assets/images/khmer.jpg'),
                      ),
                      Container(
                        padding: const EdgeInsets.all(4.0),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.redAccent,
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
             TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  labelStyle:
                      TextStyle(color: Colors.white), // Set label text color
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.redAccent), // Set border color when focused
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.redAccent), // Set border color when not focused
                  ),
                ),
                style: const TextStyle(color: Colors.white), // Set input text color
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle:
                      TextStyle(color: Colors.white), // Set label text color
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.redAccent), // Set border color when focused
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.redAccent), // Set border color when not focused
                  ),
                ),
                style: const TextStyle(color: Colors.white), // Set input text color
              ),
              const SizedBox(height: 20.0),
              
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Profile Description',
                  labelStyle:
                      TextStyle(color: Colors.white), // Set label text color
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.redAccent), // Set border color when focused
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.redAccent), // Set border color when not focused
                  ),
                ),
                style: const TextStyle(color: Colors.white), // Set input text color
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  _saveProfileChanges();
                },
                child: const Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
