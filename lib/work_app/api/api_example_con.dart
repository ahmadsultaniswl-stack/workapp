import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'helping_functions.dart';
import 'model.dart';

class ApiController extends GetxController {
  var cats = <Cat>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    await fetchCats();
  }

  Future<void> fetchCats() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      var response = await Functions.sendJson(
        jsonMap: null,
        url: 'https://api.thecatapi.com/v1/images/search?limit=10',
        method: 'GET',
      );

      if (kDebugMode) {
        print('API Response: $response');
      }

      if (response is String && response.contains('Error')) {
        // Handle error response
        errorMessage.value = response;
        return;
      }

      if (response is List) {
        // Convert response to Cat objects
        cats.value = response.map((catJson) => Cat.fromJson(catJson)).toList();
      } else {
        errorMessage.value = 'Unexpected response format';
      }
    } catch (e) {
      errorMessage.value = "Check Internet Connection & Try again.";
      if (kDebugMode) {
        print('Error: $e');
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> refreshData() async {
    await fetchCats();
  }
}
