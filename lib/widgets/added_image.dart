import 'dart:io';

import 'package:broker_app/controllers/form_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddedImage extends StatelessWidget {
  final XFile photoFile;
  final AddItemController _addItemController = Get.find();

  AddedImage({Key? key, required this.photoFile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 160,
      alignment: Alignment.bottomRight,
      decoration: const BoxDecoration(
        color: Colors.pinkAccent,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(5),
          topLeft: Radius.circular(5),
          bottomLeft: Radius.circular(5),
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.16),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          Image.file(
            File(photoFile.path),
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              child: SvgPicture.asset('assets/icons/remove_icon.svg'),
              onTap: () => _addItemController.selectedPhotos.remove(photoFile),
            ),
          )
        ],
      ),
    );
  }
}
