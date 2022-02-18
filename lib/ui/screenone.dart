import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskonimage/blocs/imagebloc.dart';
import 'package:taskonimage/helper/toast.dart';
import 'package:taskonimage/models/imagemodel.dart';
class ScreenOne extends StatefulWidget {
  const ScreenOne({Key? key}) : super(key: key);

  @override
  _ScreenOneState createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {

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
    bloc.CaptureImageBlocfun();
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker'),
      ),
      body: StreamBuilder(
        stream: bloc.image,
        builder:(context, AsyncSnapshot<ImageModel>snapshot) {
          if (snapshot.hasData) {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: ()async{
                        // _showMyDialog();
                       await bloc.CaptureImageBlocfun();

                      }, child: Text("Get")),
                  ElevatedButton(
                      onPressed: (){
                        // _showMyDialog();
                        PrintToast(snapshot.data!.image.toString());
                        }, child: Text("Show Output")),
                  Center(
                      child: snapshot.data!.image.toString() == null
                          ? Text('Nothing to show.')
                          : Image.file(File(snapshot.data!.image.toString()),height: 350,width: 250,)
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
       /* child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){
                  // _showMyDialog();
                  bloc.CaptureImageBlocfun();

                }, child: Text("Get")),
            ElevatedButton(
                onPressed: (){
                  // _showMyDialog();
                 PrintToast(bloc.image.toString());

                }, child: Text("Show Output")),
            Center(
                child: show_image == null
                    ? Text('Nothing to show.')
                    : Image.file(File(bloc.image.toString()),height: 350,width: 250,)
            ),
          ],
        ),*/
      );

  }
}