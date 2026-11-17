import 'dart:io';
import 'dart:convert';

import 'package:file_picker/file_picker.dart';

class Filepick {
  Future<void> pickFile() async {
    final result = await FilePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf'],
    );
    if (result != null) {
      File file = File(result.single.path!);

      List<int> fileBytes = await file.readAsBytes();

      // Convert bytes to Base64
      String base64String = base64Encode(fileBytes);

      print("Selected file: ${file.path}");
      print("File name: ${result.single.name}");
    }
  }
}
