import 'package:get/get.dart';
import 'package:recipe_app_rapidapi/services/api_methods.dart';

import '../models/recipe_list_model.dart';

class HomeController extends GetxController {
  RxList<Hit>? hit = <Hit>[].obs;

  @override
  Future<void> onInit() async {
    RecipeListModel? recipeListModel;
    recipeListModel = await ApiMethods().fetchRecipes();

    if (recipeListModel != null && recipeListModel.hits != null) {
      hit?.value = recipeListModel.hits!;
    }
    super.onInit();
  }
}
