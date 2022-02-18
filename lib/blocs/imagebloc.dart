import 'package:taskonimage/helper/toast.dart';
import 'package:taskonimage/models/imagemodel.dart';
import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class ImageBloc {
  final _repository = Repository();
  final _imageCapturerPS = PublishSubject<ImageModel>();

  Stream<ImageModel> get image => _imageCapturerPS.stream;

  CaptureImageBlocfun() async {
    PrintToast("Capture image run");
    ImageModel itemModel = await _repository.captureImage();
    _imageCapturerPS.sink.add(itemModel);
  }

  dispose() {
    _imageCapturerPS.close();
  }
}

final bloc = ImageBloc();