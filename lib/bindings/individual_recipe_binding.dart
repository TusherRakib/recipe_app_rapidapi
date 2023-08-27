import 'package:get/get.dart';
import 'package:recipe_app_rapidapi/controllers/individual_recipe_controller.dart';

class IndividualRecipeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(IndividualRecipeController());
  }
}
