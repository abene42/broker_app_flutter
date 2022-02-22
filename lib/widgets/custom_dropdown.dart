import 'package:broker_app/controllers/search_page/search_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropdown extends StatelessWidget {
  final String dropdownTitle;
  final String? dropdownDescription;
  final List<String> dropdownOptions;

  const CustomDropdown(
      {Key? key,
      required this.dropdownTitle,
      this.dropdownDescription,
      required this.dropdownOptions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SearchPageController _searchPageController =
        Get.put(SearchPageController(dropdownOptions));
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              dropdownTitle,
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
                print("\x1B[33m $dropdownDescription \x1B[0m");
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
          child: Obx(() => DropdownButton(
                value: _searchPageController.formData.value['city'],
                items: dropdownOptions
                    .map(
                      (value) => DropdownMenuItem(
                        value: value,
                        child: Text(
                          value.toUpperCase(),
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
                hint: Text('Choose $dropdownTitle'),
                onChanged: (value) => _searchPageController.setFormDataValue(
                    dropdownTitle, value),
                dropdownColor: Colors.white,
                alignment: Alignment.centerRight,
                icon: const Icon(Icons.keyboard_arrow_down),
                iconSize: 30,
                underline: const SizedBox(),
              )),
        ),
      ],
    );
  }
}
