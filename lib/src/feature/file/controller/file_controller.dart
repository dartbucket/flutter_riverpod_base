import 'dart:developer';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/src/feature/file/res/messages.dart';
import 'package:flutter_riverpod_base/src/utils/config.dart';
import 'package:image_picker/image_picker.dart';

final fileControllerProvider = Provider((ref) => FileController());

class FileController {
  final _name = "FILE_CONTROLLER";

  Future<File?> selectFile() async {
    try{
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source:ImageSource.gallery);
      File imageFile = File(image!.path);
      log(SuccessMessage.fileSelected, name: _name);
      return imageFile;
    } catch(e){
      if(AppConfig.devMode){
        log(FailureMessage.fileSelected, name: _name);
      }
      return null;
    }
  }
}