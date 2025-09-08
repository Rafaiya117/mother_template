import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CustomImagePicker extends StatefulWidget {
  final double radius;
  final Function(File) onImagePicked;

  const CustomImagePicker({
    super.key,
    this.radius = 80.0,
    required this.onImagePicked,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomImagePickerState createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  File? _image;

  // pick iamge function
  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _image = File(image.path); 
      });
      widget.onImagePicked(_image!); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: widget.radius,
          backgroundColor: Colors.grey[200],
          backgroundImage: _image != null ? FileImage(_image!) : null,
          child: _image == null
            ? Icon(
              Icons.person,
              size: widget.radius,
              color: Colors.grey[400],
            ): null, 
          ),
        SizedBox(height: 16),
        // Upload Image button
        ElevatedButton(
          onPressed: _image == null ? null : _pickImage, 
          style: ElevatedButton.styleFrom(
            backgroundColor: _image == null ? Colors.grey[300] : Colors.orange, 
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.upload_file, color: _image == null ? Colors.grey[600] : Colors.white),
              SizedBox(width: 8),
              Text(
                'Upload Image',
                style: TextStyle(color: _image == null ? Colors.grey[600] : Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
