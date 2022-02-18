import 'package:image_picker/image_picker.dart';
import 'package:taskonimage/helper/toast.dart';
class ImageModel {
  String? image;
  ImageModel(String? result_image){
    image = result_image;
    PrintToast("Assigned in image = "+ image.toString());
  }
  ImageModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    return data;
  }
}