import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../user_page/add_video_screen.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late List<CameraDescription> cameras;
  CameraController? cameraController;
  bool isRecording = false;
  bool isPause = false;
  XFile? videoFile;
  int cameraDirection = 0;

  @override
  void initState() {
    startCamera(cameraDirection);

    super.initState();
  }

  void startCamera(int direction) async {
    cameras = await availableCameras();

    cameraController = CameraController(
        cameras[direction], ResolutionPreset.medium,
        enableAudio: false);
    await cameraController!.initialize().then((value) {
      if (!mounted) {
        return;
      }

      setState(() {});
    });
  }

  @override
  void dispose() {
    cameraController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (cameraController?.value.isInitialized ?? false) {
      return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                  child: Stack(
                children: [
                  Positioned.fill(child: CameraPreview(cameraController!)),
                  if (isRecording)
                    Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                            padding: const EdgeInsets.only(top: 16, right: 16),
                            child: Icon(
                              isPause ? Icons.pause : Icons.circle,
                              color: isPause ? Colors.white : Colors.red,
                              size: 32,
                            )))
                ],
              )),
              Container(
                color: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 32),
                width: MediaQuery.sizeOf(context).width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        if (!isRecording) return;
                        if (!isPause) {
                          setState(() {
                            isPause = !isPause;
                          });
                          await cameraController!.pauseVideoRecording();
                        } else {
                          setState(() {
                            isPause = !isPause;
                          });
                          await cameraController!.resumeVideoRecording();
                        }
                      },
                      child: Icon(
                        isPause ? Icons.play_arrow : Icons.pause,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (!isRecording) {
                          cameraController!.startVideoRecording();
                          setState(() {
                            isRecording = !isRecording;
                          });
                        } else {
                          setState(() {
                            isRecording = !isRecording;
                            isPause = false;
                          });
                          await cameraController!
                              .stopVideoRecording()
                              .then((videoFile) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => AddVideoScreen(
                                  videoFile: File(videoFile.path),
                                  videoPath: videoFile.path,
                                ),
                              ),
                            );
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: const CircleBorder(),
                          padding: const EdgeInsetsDirectional.all(16)),
                      child: Icon(
                        isRecording ? Icons.square : Icons.circle,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    InkWell(
                      onTap: () async {
                        cameraDirection = cameraDirection == 0 ? 1 : 0;
                        startCamera(cameraDirection);
                      },
                      child: const Icon(
                        Icons.change_circle,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
