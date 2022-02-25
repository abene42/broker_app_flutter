import 'package:get/get.dart';

class SearchPageController extends GetxController {
  final RxMap formData = <String, dynamic>{}.obs;
  final RxString selectedCity = ''.obs;
  SearchPageController(List<String> initialData) {
    formData['city'] = initialData.first;
    selectedCity.value = initialData.first;
  }

  /// Setts the value of formData state variable with the provided key and value
  void setFormDataValue(String key, dynamic value) {
    formData[key.toLowerCase()] = value;
    formData.refresh();
  }
}
