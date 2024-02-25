import 'dart:html';

import 'package:active_system/controller/mange_player.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as f;
import 'package:path/path.dart';

class CustomCamera extends StatefulWidget {
  CustomCamera({super.key, required this.contrller});
  MangeUsersControllerImp contrller;

  @override
  _CustomCameraState createState() => _CustomCameraState();
}

class _CustomCameraState extends State<CustomCamera> {
  bool cameraAccess = false;
  String? error;
  List<CameraDescription>? cameras;

  @override
  void initState() {
    getCameras();
    super.initState();
  }

  Future<void> getCameras() async {
    try {
      await window.navigator.mediaDevices!
          .getUserMedia({'video': true, 'audio': false});
      setState(() {
        cameraAccess = true;
      });
      final cameras = await availableCameras();
      setState(() {
        this.cameras = cameras;
      });
    } on DomException catch (e) {
      setState(() {
        error = '${e.name}: ${e.message}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (error != null) {
      return Center(child: Text('Error: $error'));
    }
    if (!cameraAccess) {
      return const Center(child: Text('Camera access not granted yet.'));
    }
    if (cameras == null) {
      return const Center(child: Text('Reading cameras'));
    }
    return CameraView(
      cameras: cameras!,
      contrller: widget.contrller,
    );
  }
}

class CameraView extends StatefulWidget {
  final List<CameraDescription> cameras;
  final MangeUsersControllerImp contrller;
  CameraView({Key? key, required this.cameras, required this.contrller})
      : super(key: key);

  @override
  _CameraViewState createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  String? error;
  CameraController? cameraController;
  late CameraDescription cameraDescription = widget.cameras[0];

  Future<void> initCam(CameraDescription description) async {
    setState(() {
      cameraController = CameraController(description, ResolutionPreset.max);
    });

    try {
      await cameraController!.initialize();
    } catch (e) {
      setState(() {
        error = e.toString();
      });
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initCam(cameraDescription);
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (error != null) {
      return Center(
        child: Text('Initializing error: $error\nCamera list:'),
      );
    }
    if (cameraController == null) {
      return const Center(child: Text('Loading controller...'));
    }
    if (!cameraController!.value.isInitialized) {
      return const Center(child: Text('Initializing camera...'));
    }

    return Column(
      children: [
        Center(
          child: SizedBox(
              height: 400,
              width: 400,
              child: AspectRatio(
                  aspectRatio: 3 / 2, child: CameraPreview(cameraController!))),
        ),
        const SizedBox(
          height: 15,
        ),
        Material(
          textStyle: const TextStyle(overflow: TextOverflow.ellipsis),
          child: DropdownButton<CameraDescription>(
            value: cameraDescription,
            style: const TextStyle(overflow: TextOverflow.clip),
            icon: const Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            onChanged: (CameraDescription? newValue) async {
              if (cameraController != null) {
                await cameraController!.dispose();
              }
              setState(() {
                cameraController = null;
                cameraDescription = newValue!;
              });

              initCam(newValue!);
            },
            items: widget.cameras
                .map<DropdownMenuItem<CameraDescription>>((value) {
              return DropdownMenuItem<CameraDescription>(
                value: value,
                child: Text(
                  '${value.name}: ${value.lensDirection}',
                  overflow: TextOverflow.ellipsis,
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        ElevatedButton(
          onPressed: cameraController == null
              ? null
              : () async {
                  XFile file = await cameraController!.takePicture();

                  //f.File savedfile = f.File(file.path);
                  widget.contrller.file = file;
                  widget.contrller.refresh();
                  //final bytes = await file.readAsBytes();

                  // final link = AnchorElement(
                  //     href: Uri.dataFromBytes(bytes, mimeType: 'image/png')
                  //         .toString());
                  // link.download = 'picture.png';
                  // link.click();
                  //link.remove();
                },
          child: const Text('Take picture.'),
        ),
      ],
    );
  }
}
