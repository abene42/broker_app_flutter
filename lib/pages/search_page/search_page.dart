import 'package:broker_app/controllers/form_controller.dart';
import 'package:broker_app/widgets/custom_button.dart';
import 'package:broker_app/widgets/custom_dropdown.dart';
import 'package:broker_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _formKey = GlobalKey<FormState>();
  late final AddItemController _addItemController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _addItemController = AddItemController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: const Color(0xff3E4E5E),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Search',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const Text(
                        'Please use the following filters to find your specific need',
                        style: TextStyle(
                          color: Color(0xff3E4E5E),
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Divider(
                        color: Colors.transparent,
                        height: 50,
                      ),
                      CustomDropdown(
                        dropdownTitle: 'City',
                        dropdownOptions: [
                          'Addis Ababa',
                          'Adama',
                          'Bahr Dar',
                          'Bishoftu'
                        ],
                        dropdownDescription: 'City where the house is found in',
                        formController: _addItemController,
                      ),
                      Divider(
                        color: Colors.transparent,
                        height: 10,
                      ),
                      CustomTextField(
                        textFieldTitle: 'Sub City',
                        textFieldDescription: 'The sub-city of the house',
                        formController: _addItemController,
                      ),
                      Divider(
                        color: Colors.transparent,
                        height: 10,
                      ),
                      CustomTextField(
                        textFieldTitle: 'Specific Area',
                        textFieldDescription:
                            'The specific area name of the house',
                        formController: _addItemController,
                      ),
                      Divider(
                        color: Colors.transparent,
                        height: 10,
                      ),
                      CustomTextField(
                        textFieldTitle: 'Floors',
                        textFieldDescription:
                            'The number of floors the house has',
                        formController: _addItemController,
                      ),
                      Divider(
                        color: Colors.transparent,
                        height: 10,
                      ),
                      CustomTextField(
                        textFieldTitle: 'Area',
                        textFieldDescription:
                            'The area of the land where the house is built on',
                        formController: _addItemController,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          CustomButton(
            buttonText: 'Search',
            onButtonTap: () => Get.toNamed('/searchResult'),
          )
        ],
      ),
    );
  }
}
