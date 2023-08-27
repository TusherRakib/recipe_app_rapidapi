import 'dart:developer';

import 'package:get/get.dart';

import '../models/recipe_list_model.dart';

class IndividualRecipeController extends GetxController {
  Rx<Recipe> recipe = Recipe().obs;

  RxString selectedNutrition = "".obs;

  @override
  void onReady() {
    recipe.value = Get.arguments;
    log(recipe.value.image.toString());
    selectedNutrition.value = recipe.value.digest!.first.label.toString();
    super.onReady();
  }

  int calculateTotalAmount(Map<String, Total>? totalDaily) {
    double totalAmount = 0.0;

    if (totalDaily != null) {
      totalDaily.forEach((key, value) {
        log(value.quantity.toString());
        totalAmount += value.quantity ?? 0.0;
      });
    }

    return totalAmount.round();
  }
}
