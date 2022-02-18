import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'package:taskonimage/helper/toast.dart';
import 'package:taskonimage/models/imagemodel.dart';

class ImageProvider {
   String? result_image;
   final ImagePicker _picker = ImagePicker();
   Future<ImageModel> CaptureImage() async {
    final XFile? photo = (await _picker.pickImage(source: ImageSource.camera));
    result_image = photo!.path.toString();

   /* print("Capture photo:::"+photo.toString());
    PrintToast("Capture Photo::" + result_image.toString());*/
    if (photo!=null) {
      PrintToast("photo not null :: Path is = "+result_image!);
      return ImageModel(result_image);
    } else {
      PrintToast("Exception run");
      throw Exception('Failed to load post');
    }
  }
}