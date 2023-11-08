import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter_riverpod_base/src/core/core.dart';
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../res/endpoints.dart';

final fileRepoProvider = Provider((ref){
  final api = ref.watch(networkRepoProvider);
  return FileRepo(api: api);
});

class FileRepo {
  final NetworkRepo _api;
  FileRepo({required NetworkRepo api}):_api = api;

  // Future<UplaodInfo?> _getUploadUrl ({
  //   required String extension,
  //   required UploadFileType type,
  // }) async {

  //   final body = {
  //     "extension": extension,
  //     "type": type.text
  //   };

  //   final result = await _api.postRequest(url: EndPoints.upload, body: body, requireAuth: false);
  //   return result.fold((l){
  //     log('Failed to get downloadUrl');
  //     return null;
  //   }, (r){
  //     final data = jsonDecode(r.body);
  //     final info = UplaodInfo.fromMap(data);
  //     return info;
  //   });
  // }

  // Future<UplaodInfo?> uploadFile({ required File file, required UploadFileType type}) async {
  //   final extension = _getFileExstension(file);
  //   final info = await _getUploadUrl(extension: extension, type: type);
  //   if(info!=null){
  //     final fileUploadSuccess =  await _upload(file: file, uploadUrl: info.uploadUrl);
  //     if(fileUploadSuccess){
  //       log('File Uploaded succfully');
  //       return info;
  //     }
  //   }
  //   return null;
  // }

  Future<bool> _upload({ required File file, required String uploadUrl }) async {
    log('Uploading File to $uploadUrl');
    final response = await http.put(Uri.parse(uploadUrl), body: file.readAsBytesSync());
    return (response.statusCode == 200);
  }

  String _getFileExstension (File file) {
    final String filePath = file.path;
    final String extension = path.extension(filePath);
    final ext = extension.substring(1);
    log("File extension : $ext");
    return ext;
  }
}