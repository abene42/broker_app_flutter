import 'package:broker_app/controllers/form_controller.dart';
import 'package:broker_app/widgets/added_image.dart';
import 'package:broker_app/widgets/camera_and_gallery_button.dart';
import 'package:broker_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AddPhotosPage extends StatefulWidget {
  AddPhotosPage({Key? key}) : super(key: key);

  @override
  State<AddPhotosPage> createState() => _AddPhotosPageState();
}

class _AddPhotosPageState extends State<AddPhotosPage> {
  final AddItemController _addItemController = Get.find();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Photos'),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: Column(
                    children: [
                      const Text(
                        'Please add the photo of the house. You can add from your camera or gallery. The more you add a photo, the more it will be descriptive.',
                        style: TextStyle(
                          color: Color(0xff3E4E5E),
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Divider(
                        color: Colors.transparent,
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CameraAndGalleryButton(
                            buttonText: 'Camera',
                            buttonIcon:
                                SvgPicture.asset('assets/icons/camera.svg'),
                            onButtonClick:
                                _addItemController.addPhotoFromCamera,
                          ),
                          CameraAndGalleryButton(
                            buttonText: 'Gallery',
                            buttonIcon:
                                SvgPicture.asset('assets/icons/gallery.svg'),
                            onButtonClick:
                                _addItemController.addPhotoFromGallery,
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.transparent,
                        height: 20,
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 9, vertical: 22),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: const <BoxShadow>[
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.16),
                                blurRadius: 6,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: SingleChildScrollView(
                            child: Obx(
                              () => _addItemController.selectedPhotos.isEmpty
                                  ? Container(
                                      alignment: Alignment.center,
                                      child: const Text(
                                        'Select Photos',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    )
                                  : Wrap(
                                      spacing: 5,
                                      runSpacing: 5,
                                      alignment: WrapAlignment.start,
                                      children: _addItemController
                                          .selectedPhotos
                                          .map((selectedPhoto) => AddedImage(
                                                photoFile: selectedPhoto,
                                              ))
                                          .toList(),
                                    ),
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        color: Colors.transparent,
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              CustomButton(
                buttonText: 'Finish',
                onButtonTap: () async {
                  setState(() {
                    isLoading = true;
                  });
                  await _addItemController.addItemToFirebase();
                  setState(() {
                    isLoading = false;
                  });
                  Get.toNamed('/homepage');
                },
              )
            ],
          ),
          isLoading
              ? Container(
                  width: Get.width,
                  height: Get.height,
                  color: const Color.fromARGB(3, 255, 255, 255),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [LinearProgressIndicator()],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
