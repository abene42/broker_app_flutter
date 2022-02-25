import 'package:broker_app/controllers/form_controller.dart';
import 'package:broker_app/helpers/helpers.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String textFieldTitle;
  final String? textFieldDescription;
  final AddItemController formController;
  CustomTextField(
      {Key? key,
      required this.textFieldTitle,
      this.textFieldDescription,
      required this.formController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              HelperClass.capitalizeWords(textFieldTitle),
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Color(0xff3E4E5E),
              ),
            ),
            const VerticalDivider(
              width: 2,
            ),
            InkWell(
              child: const Icon(
                Icons.info_outline_rounded,
                size: 16,
                color: Color(0xff0884FF),
              ),
              onTap: () {
                debugPrint("\x1B[33m $textFieldDescription \x1B[0m");
              },
            )
          ],
        ),
        Container(
          width: 250,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color(0xff3E4E5E),
            ),
          ),
          child: TextFormField(
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xff3E4E5E),
            ),
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            onChanged: (text) {
              formController.formData[
                  textFieldTitle.replaceAll(' ', '_').toLowerCase()] = text;
            },
          ),
        ),
      ],
    );
  }
}
