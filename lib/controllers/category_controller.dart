import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ss34flutter/models/category_model.dart';
import 'package:ss34flutter/services/http_service.dart';

class CategoryController extends GetxController {
  var isLoading = false.obs;
  var categoryList = [].obs;
  var formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  void onInit() {
    getCategory();
    super.onInit();
  }

  String? nameValidation(String? name) {
    if (name == null || name == "") {
      return "field name is required";
    }
    return null;
  }

  void formSubmit() async {
    var validate = formKey.currentState!.validate();
    formKey.currentState!.save();
    if (validate) {
      var category = CategoryModel(
          categoryId: "3fa85f64-5717-4562-b3fc-2c963f66afa1",
          categoryName: nameController.value.text,
          description: descController.value.text);
      var result = await HttpService.postCategory(category);
      if (result) {
        Get.snackbar("Success", "Record was save");
      } else {
        Get.snackbar("Failed", "Record could not save");
      }
    }
  }

  void getCategory() async {
    try {
      isLoading(true);
      var categories = await HttpService.fetchCategory();
      categoryList.value = categories;
    } finally {
      isLoading.value = false;
    }
  }
}
