import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomepageController extends GetxController {
  late FirebaseFirestore firebaseInstance;

  HomepageController() {
    firebaseInstance = FirebaseFirestore.instance;
  }

  /// State variable to hold filter and some other values
  final Map searchData = <String, dynamic>{'routePathStatus': 'searching'}.obs;

  /// For adding key,value pair entries to the 'searchData' state variable
  void addSearchDataValue(String key, dynamic value) {
    searchData[key] = value;
  }

  /// Handle House button clicked event
  void handleItemTypeButtonClicked(String item) async {
    // CollectionReference items = FirebaseFirestore.instance.collection('items');
    // var data = await items.doc('YkBWxIrvyXCrYU0wCDid').get();
    searchData['item'] = item;
    Get.toNamed('/rentOrPurchase');
  }

  /// Handle Rental and Purchase button clicked event
  ///Method which renders the next page for rental or purchase page
  void handleRentalOrPurchaseButtonClicked(String purchaseStatus) {
    searchData['purchaseStatus'] = purchaseStatus;
    if (searchData['routePathStatus'] == 'searching') {
      Get.toNamed('/searchPage');
    } else if (searchData['routePathStatus'] == 'adding') {
      Get.toNamed('/addDetail');
    }
  }

  /// Fetch cities from firestore
  Future<Iterable<String>> fetchCities() async {
    CollectionReference citiesRef = firebaseInstance.collection('cities');
    QuerySnapshot citiesSnapshot = await citiesRef.orderBy('name').get();
    Iterable<String> citiesIterable =
        citiesSnapshot.docs.map((QueryDocumentSnapshot doc) => doc['name']);
    return citiesIterable.toList();
  }
}
