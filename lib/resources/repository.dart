import 'dart:async';
import 'package:taskonimage/models/imagemodel.dart';
import 'package:taskonimage/resources/providers/image_provider.dart';

class Repository {
  final imageProvider = ImageProvider();
  Future<ImageModel> captureImage() => imageProvider.CaptureImage();
}