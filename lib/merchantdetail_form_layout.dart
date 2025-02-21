import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:paylync/appcolors.dart';

var fieldWidth = 270.0;

class MerchantDetailFormLayout extends StatelessWidget {
  const MerchantDetailFormLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            _buildTextField('Legal Name of Merchant'),
            _buildTextField('Company Email'),
            _buildTextField('Company Name'),
            _buildTextField('Number of Locations'),
            _buildTextField('Company Website'),
            _buildTextField('Company Phone Number'),
            _buildTextField('DBA Name or Trade Name', fullWidth: false),
          ],
        ),
        const SizedBox(height: 20),
        _buildUploadBox(),
        const SizedBox(height: 5),
        const Text('Image size should be 21Sx75px',
            style: TextStyle(fontSize: 14, color: Colors.black54)),
      ],
    );
  }

  Widget _buildTextField(String hint, {bool fullWidth = false}) {
    return SizedBox(
      width: fullWidth ? double.infinity : fieldWidth,
      child: TextField(
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
        width: fieldWidth,
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
