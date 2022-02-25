import 'package:broker_app/controllers/form_controller.dart';
import 'package:broker_app/controllers/search_page/search_page_controller.dart';
import 'package:broker_app/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropdown extends StatefulWidget {
  final String dropdownTitle;
  final String? dropdownDescription;
  final List<String> dropdownOptions;
  final AddItemController formController;

  const CustomDropdown(
      {Key? key,
      required this.dropdownTitle,
      this.dropdownDescription,
      required this.dropdownOptions,
      required this.formController})
      : super(key: key);

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  late String selectedOption = '';

  @override
  void initState() {
    // TODO: implement setState
    super.initState();
    setState(() {
      selectedOption = widget.dropdownOptions.first;
    });
    widget.formController.formData[widget.dropdownTitle.toLowerCase()] =
        widget.dropdownOptions.first;
  }

  @override
  Widget build(BuildContext context) {
    final SearchPageController _searchPageController =
        Get.put(SearchPageController(widget.dropdownOptions));
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.dropdownTitle,
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
                debugPrint("\x1B[33m ${widget.dropdownDescription} \x1B[0m");
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
          child: DropdownButton(
            value: selectedOption,
            items: widget.dropdownOptions
                .map(
                  (value) => DropdownMenuItem(
                    value: value,
                    child: Text(
                      HelperClass.capitalizeWords(value),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff3E4E5E),
                      ),
                    ),
                  ),
                )
                .toList(),
            hint: Text('Choose ${widget.dropdownTitle}'),
            onChanged: (value) {
              setState(() {
                selectedOption = value as String;
              });
              widget.formController
                      .formData[widget.dropdownTitle.toLowerCase()] =
                  value as String;
              debugPrint("\x1B[33m ${widget.formController.formData} \x1B[0m");
            },
            dropdownColor: Colors.white,
            alignment: Alignment.centerRight,
            icon: const Icon(Icons.keyboard_arrow_down),
            iconSize: 30,
            underline: const SizedBox(),
          ),
        ),
      ],
    );
  }
}
