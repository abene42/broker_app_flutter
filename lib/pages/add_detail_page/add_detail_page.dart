import 'package:broker_app/controllers/form_controller.dart';
import 'package:broker_app/controllers/homepage/homepage_controller.dart';
import 'package:broker_app/widgets/custom_button.dart';
import 'package:broker_app/widgets/custom_dropdown.dart';
import 'package:broker_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddDetailPage extends StatefulWidget {
  AddDetailPage({Key? key}) : super(key: key);

  @override
  State<AddDetailPage> createState() => _AddDetailPageState();
}

class _AddDetailPageState extends State<AddDetailPage> {
  final _formKey = GlobalKey<FormState>();

  late final HomepageController _homepageController;
  late final AddItemController _addItemController;

  @override
  initState() {
    super.initState();
    _homepageController = HomepageController();
    _addItemController = Get.put(AddItemController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Add Detail'),
      ),
      body: FutureBuilder<Iterable<String>>(
          future: _homepageController.fetchCities(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            List<String> cities = snapshot.data;
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Text(
                              'Please fill the following fields about the house',
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
                              dropdownOptions: cities,
                              dropdownDescription:
                                  'City where the house is found in',
                              formController: _addItemController,
                            ),
                            const Divider(
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
                            Divider(
                              color: Colors.transparent,
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                CustomButton(
                  buttonText: 'Next',
                  onButtonTap: () => Get.toNamed('/addPhotos'),
                )
              ],
            );
          }),
    );
  }
}
