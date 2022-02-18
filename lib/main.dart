import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskonimage/helper/toast.dart';
import 'package:taskonimage/ui/screenone.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: ScreenOne()
));

/*
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Choose option',
            style: TextStyle(color: Colors.blue,fontSize: 18,fontWeight:FontWeight.bold),
          ),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Divider(height: 15,),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop();
                    PicImage();
                  },
                  child: Container(
                    //color: Colors.green,
                    height: 55,
                    width: 250,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.person,color: Colors.blue,size:30,),
                        SizedBox(width: 18),
                        Text("Gallery"),
                      ],
                    ),
                  ),
                ),
                Divider(height: 15,),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop();
                    CaptureImage();
                  },
                  child: Container(
                    //color: Colors.blue,
                    height: 55,
                    width: 250,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.camera,color: Colors.blue,size:30,),
                        SizedBox(width: 18),
                        Text("Camera"),
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 10,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 35,
                    width: 250,
                    color: Colors.blue,
                    child: Text("Cancel",style: TextStyle(color: Colors.white),),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
  XFile? show_image;
  final ImagePicker _picker = ImagePicker();
  // Pick an image
  void PicImage()async{
    final XFile? image = (await _picker.pickImage(source: ImageSource.gallery)) ;
    setState(() {
      show_image = image;
    });
  }
  // Capture a photo
  void CaptureImage()async{
    final XFile? photo = (await _picker.pickImage(source: ImageSource.camera));
    print("Capture photo:::"+photo.toString());
    PrintToast("Capture Photo::" + photo.toString());
    setState(() {
      show_image = photo;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: (){
                _showMyDialog();
          }, child: Text("Get")),
          Center(
            child: show_image == null
                ? Text('Nothing to show.')
                : Image.file(File(show_image!.path),height: 350,width: 250,)
          ),
        ],
      ),
    );
  }
}*/
