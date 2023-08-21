import 'package:image_picker/image_picker.dart';

selectImage(ImageSource source) async {
  final _imagePicker = ImagePicker();
  XFile? _file = await _imagePicker.pickImage(source: source);
  if (_file != null) {
    return await _file.readAsBytes();
  }
  print("No image selected");
}
