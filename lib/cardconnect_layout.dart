import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:paylync/appcolors.dart';

// var fieldWidth = 270.0;

class CardConnectFormLayout extends StatelessWidget {
  const CardConnectFormLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _buildTextField('Username'),
            const SizedBox(width: 10),
            _buildTextField('Password'),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            _buildTextField('MID'),
            const SizedBox(width: 10),
            _buildTextField('Gateway Port'),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            _buildTextField('Gateway URL', fullWidth: true),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(flex: 1, child: _buildUploadBox()),
            Expanded(flex: 1, child: SizedBox()),
          ],
        ),
        const SizedBox(height: 5),
        const Text('Image size should be 21Sx75px',
            style: TextStyle(fontSize: 14, color: Colors.black54)),
      ],
    );
  }

  Widget _buildTextField(String hint, {bool fullWidth = false}) {
    return Expanded(
      flex: 1,
      child: TextField(
        style: TextStyle(
          fontSize: 18,
        ),
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        ),
      ),
    );
  }

  Widget _buildUploadBox() {
    return DottedBorder(
      color: Colors.black,
      strokeWidth: 1,
      child: Container(
        color: secondaryColor,
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.upload, color: Colors.black45),
            SizedBox(
              width: 5,
            ),
            Text('Upload image', style: TextStyle(color: Colors.black45)),
          ],
        ),
      ),
    );
  }
}
