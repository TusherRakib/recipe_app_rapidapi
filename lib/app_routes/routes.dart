import 'package:get/get.dart';
import 'package:recipe_app_rapidapi/bindings/individual_recipe_binding.dart';
import 'package:recipe_app_rapidapi/views/individual_recipe_view.dart';
import '../bindings/home_binding.dart';
import '../views/home_view.dart';
import 'routes_path.dart';

class Routes {
  static final List<GetPage> routes = [
    GetPage(
      name: RoutesPath.homePage,
      binding: HomeBinding(),
      page: () => const HomeView(),
    ),
    GetPage(
      name: RoutesPath.individualRecipeView,
      binding: IndividualRecipeBinding(),
      page: () => const IndividualRecipeView(),
    ),
  ];
}
