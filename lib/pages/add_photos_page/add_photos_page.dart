import 'package:broker_app/widgets/added_image.dart';
import 'package:broker_app/widgets/camera_and_gallery_button.dart';
import 'package:broker_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddPhotosPage extends StatelessWidget {
  const AddPhotosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Photos'),
      ),
      body: Column(
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
                        buttonIcon: SvgPicture.asset('assets/icons/camera.svg'),
                      ),
                      CameraAndGalleryButton(
                        buttonText: 'Gallery',
                        buttonIcon:
                            SvgPicture.asset('assets/icons/gallery.svg'),
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
                        child: Wrap(
                          spacing: 5,
                          runSpacing: 5,
                          alignment: WrapAlignment.start,
                          children: [
                            AddedImage(),
                            AddedImage(),
                            AddedImage(),
                            AddedImage(),
                            AddedImage(),
                            AddedImage(),
                          ],
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
            onButtonTap: () => print("\x1B[33m Finish button clicked \x1B[0m"),
          )
        ],
      ),
    );
  }
}
