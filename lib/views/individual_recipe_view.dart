import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app_rapidapi/utils/app_constraints.dart';

import '../controllers/individual_recipe_controller.dart';
import '../utils/app_colors.dart';

class IndividualRecipeView extends GetView<IndividualRecipeController> {
  const IndividualRecipeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Image.asset(
            "assets/background_shape.png",
            height: 300,
          ),
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              leading: const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ),
              ),
              title: searchBar(),
              actions: [
                IconButton(
                  icon: const Icon(Icons.menu, color: Colors.grey),
                  onPressed: () {},
                ),
              ],
            ),
            body: Obx(
              () => controller.recipe.value.label == null
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'REFINE SEARCH BY  ',
                                      style: TextStyle(
                                        color: Color(0xFF747D88),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Calories, Diet, Ingredients',
                                      style: TextStyle(
                                        color: Color(0xFF747D88),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            AppConstrains.height30,
                            topSection(),
                            const Text(
                              'Health Labels:',
                              style: TextStyle(
                                color: Color(0xFFCBCFD4),
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            AppConstrains.height5,
                            healthLabel(),
                            AppConstrains.height15,
                            const Text(
                              'Cuisine Type:',
                              style: TextStyle(
                                color: Color(0xFFCBCFD4),
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            AppConstrains.height5,
                            cuisineType(),
                            AppConstrains.height15,
                            const Text(
                              'Ingredients',
                              style: TextStyle(
                                color: Color(0xFF3C444C),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              width: 90,
                              child: Divider(
                                thickness: 2,
                                height: 5,
                                color: Color(0x99FEC915),
                              ),
                            ),
                            AppConstrains.height10,
                            ingredients(),
                            AppConstrains.height15,
                            const Text(
                              'Preparation',
                              style: TextStyle(
                                color: Color(0xFF3C444C),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              width: 90,
                              child: Divider(
                                thickness: 2,
                                height: 5,
                                color: Color(0x99FEC915),
                              ),
                            ),
                            AppConstrains.height10,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RichText(
                                  text: const TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Instructions on',
                                        style: TextStyle(
                                          color: Color(0xFF747D88),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' BBC Food',
                                        style: TextStyle(
                                          color: Color(0xFF747D88),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Icon(Icons.keyboard_arrow_down_outlined)
                              ],
                            ),
                            AppConstrains.height15,
                            const Text(
                              'Nutrition',
                              style: TextStyle(
                                color: Color(0xFF3C444C),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              width: 90,
                              child: Divider(
                                thickness: 2,
                                height: 5,
                                color: Color(0x99FEC915),
                              ),
                            ),
                            AppConstrains.height10,
                            nutritions(),
                            AppConstrains.height15,
                            const Text(
                              'Tags',
                              style: TextStyle(
                                color: Color(0xFF3C444C),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              width: 40,
                              child: Divider(
                                thickness: 2,
                                height: 5,
                                color: Color(0x99FEC915),
                              ),
                            ),
                            AppConstrains.height10,
                            tags(),
                            AppConstrains.height15,
                            const Text(
                              'Nutrition',
                              style: TextStyle(
                                color: Color(0xFF3C444C),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              width: 90,
                              child: Divider(
                                thickness: 2,
                                height: 5,
                                color: Color(0x99FEC915),
                              ),
                            ),
                            AppConstrains.height10,
                            nutrition(),
                            AppConstrains.height10,
                            nutritionSecond()
                          ],
                        ),
                      ),
                    ),
            )),
      ],
    );
  }

  Widget searchBar() {
    return Container(
        width: 253,
        height: 42.55,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x0C30363D),
              blurRadius: 15,
              offset: Offset(0, 5),
              spreadRadius: 0,
            )
          ],
        ),
        child: const TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            hintText: 'Search...',
            hintStyle: TextStyle(
              color: Color(0xFFCBCFD4),
              fontSize: 14,
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w400,
            ),
            border: InputBorder.none,
          ),
          cursorColor: Colors.black,
        ));
  }

  Widget topSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppConstrains.height10,
            SizedBox(
              width: Get.width / 2.5,
              child: Text(
                controller.recipe.value.label ?? "",
                style: const TextStyle(
                  color: Color(0xFF3C444C),
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  height: 1.07,
                  overflow: TextOverflow.visible,
                ),
                maxLines: 3,
              ),
            ),
            AppConstrains.height10,
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'See full recipe on: \n',
                    style: TextStyle(
                      color: Color(0xFF3C444C),
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      height: 1.30,
                    ),
                  ),
                  TextSpan(
                    text: 'BBC Good Food',
                    style: TextStyle(
                      color: Color(0xFF3C444C),
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      height: 1.30,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            AppConstrains.height30,
            Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: ShapeDecoration(
                    color: AppColors.greenContentColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Icon(
                    Icons.add_box_sharp,
                    size: 20,
                  ),
                ),
                AppConstrains.width15,
                Container(
                  width: 32,
                  height: 32,
                  decoration: ShapeDecoration(
                    color: AppColors.greenContentColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Icon(
                    Icons.share,
                    size: 20,
                  ),
                ),
              ],
            )
          ],
        ),
        Container(
          width: 168,
          height: 168,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              imageUrl: "${controller.recipe.value.images?.regular?.url}",
              placeholder: (context, url) => const SizedBox(
                width: 20,
                height: 20,
                child: Center(child: CircularProgressIndicator()),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }

  Widget healthLabel() {
    return SizedBox(
      height: 20,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.recipe.value.healthLabels?.length,
        itemBuilder: (context, index) {
          log(index.toString());
          return Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            height: 18,
            decoration: ShapeDecoration(
              color: const Color(0xFFD9D9D9),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: Text(
              controller.recipe.value.healthLabels![index].name.replaceAll('_', '-'),
              style: const TextStyle(
                color: Color(0xFF3C444C),
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget cuisineType() {
    return SizedBox(
      height: 20,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.recipe.value.cuisineType?.length,
        itemBuilder: (context, index) {
          log(index.toString());
          return Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            height: 18,
            decoration: ShapeDecoration(
              color: const Color(0xFFD9D9D9),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: Text(
              controller.recipe.value.cuisineType![index],
              style: const TextStyle(
                color: Color(0xFF3C444C),
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget ingredients() {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.recipe.value.ingredients?.length,
        itemBuilder: (context, index) {
          return Container(
            width: 90,
            margin: const EdgeInsets.only(right: 10),
            height: 90,
            decoration: ShapeDecoration(
              color: AppColors.greenContentColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 55,
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  width: 90,
                  decoration: ShapeDecoration(
                    color: AppColors.greenContentColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    controller.recipe.value.ingredients?[index].text ?? "",
                    style: const TextStyle(color: Color(0xFF3C444C), fontSize: 12, fontWeight: FontWeight.w600, overflow: TextOverflow.ellipsis),
                    textAlign: TextAlign.center,
                    maxLines: 3,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  height: 35,
                  width: 90,
                  decoration: ShapeDecoration(
                    color: Colors.white.withOpacity(0.58),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                    ),
                  ),
                  child: Text(
                    controller.recipe.value.ingredients?[index].foodCategory?.toString() ?? "",
                    style: const TextStyle(color: Color(0xFF3C444C), fontSize: 12, fontWeight: FontWeight.w600, overflow: TextOverflow.ellipsis),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget nutritions() {
    return Container(
      height: 75,
      decoration: const ShapeDecoration(
        color: AppColors.greenContentColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(3),
                height: 23,
                decoration: ShapeDecoration(
                  color: const Color(0xFFD9D9D9),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Text(
                  "${controller.recipe.value.calories?.round() ?? ""}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF3C444C),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              AppConstrains.height5,
              const Text(
                'CAL / SERV',
                style: TextStyle(
                  color: Color(0xFF3C444C),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Container(
            height: 50,
            width: 2,
            color: Colors.black,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(3),
                height: 23,
                decoration: ShapeDecoration(
                  color: const Color(0xFFD9D9D9),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Text(
                  "${controller.calculateTotalAmount(controller.recipe.value.totalDaily) / 100}%",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF3C444C),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              AppConstrains.height5,
              const Text(
                'DAILY VALUE',
                style: TextStyle(
                  color: Color(0xFF3C444C),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Container(
            height: 50,
            width: 2,
            color: Colors.black,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(3),
                height: 23,
                decoration: ShapeDecoration(
                  color: const Color(0xFFD9D9D9),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Text(
                  "${controller.recipe.value.recipeYield?.round() ?? ""}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF3C444C),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              AppConstrains.height5,
              const Text(
                'SERVINGS',
                style: TextStyle(
                  color: Color(0xFF3C444C),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget tags() {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: controller.recipe.value.healthLabels!
          .map((text) => Text(
                text.name,
                style: const TextStyle(
                  color: Color(0xFF747D88),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline,
                  height: 1.71,
                ),
              ))
          .toList(),
    );
  }

  Widget nutrition() {
    return Container(
        height: 60,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Obx(
          () => ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.recipe.value.digest?.length,
            itemBuilder: (context, index) {
              log(controller.selectedNutrition.value);
              return GestureDetector(
                onTap: () {
                  controller.selectedNutrition.value = controller.recipe.value.digest![index].label.toString();
                  log(controller.selectedNutrition.value);
                },
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Obx(
                    () => Container(
                      alignment: Alignment.center,
                      width: 73,
                      height: 35,
                      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      decoration: ShapeDecoration(
                        color: controller.selectedNutrition.value == controller.recipe.value.digest![index].label.toString() ? AppColors.greenContentColor : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Text(
                        controller.recipe.value.digest?[index].label.toString().replaceAll("Label.", "").capitalizeFirst ?? "",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFF3C444C),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }

  Widget nutritionSecond() {
    return Obx(() => Container(
        padding: const EdgeInsets.all(12),
        width: Get.width,
        decoration: const ShapeDecoration(
          color: AppColors.greenContentColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.recipe.value.digest
                          ?.firstWhere((element) => element.label.toString() == controller.selectedNutrition.value)
                          .label
                          .toString()
                          .replaceAll("Label.", "")
                          .capitalizeFirst ??
                      "",
                  style: const TextStyle(
                    color: Color(0xFF0F0F0F),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Text(
                          controller.recipe.value.digest
                                  ?.firstWhere((element) => element.label.toString() == controller.selectedNutrition.value)
                                  .daily
                                  ?.round()
                                  .toString()
                                  .replaceAll("Label.", "")
                                  .capitalizeFirst ??
                              "",
                          style: const TextStyle(
                            color: Color(0xFF0F0F0F),
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Text(
                          "g",
                          style: TextStyle(
                            color: Color(0xFF3A3A3A),
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          width: 60,
                        ),
                        Text(
                          controller.recipe.value.digest
                                  ?.firstWhere((element) => element.label.toString() == controller.selectedNutrition.value)
                                  .total
                                  ?.round()
                                  .toString()
                                  .replaceAll("Label.", "")
                                  .capitalizeFirst ??
                              "",
                          style: const TextStyle(
                            color: Color(0xFF0F0F0F),
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Text(
                          "%",
                          style: TextStyle(
                            color: Color(0xFF0F0F0F),
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                    Container(
                      color: Colors.black,
                      height: 2,
                      width: 160,
                    )
                  ],
                ),
                const SizedBox(
                  width: 40,
                ),
              ],
            ),
            individualSubSection(),
          ],
        )));
  }

  Widget individualSubSection() {
    return SizedBox(
      width: Get.width,
      child: controller.recipe.value.digest?.firstWhere((element) => element.label.toString() == controller.selectedNutrition.value).sub?.length == 0
          ? Container(height: 80, alignment: Alignment.center, child: const Text("No details available"))
          : ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: controller.recipe.value.digest?.firstWhere((element) => element.label.toString() == controller.selectedNutrition.value).sub?.length ?? 0,
              itemBuilder: (context, subIndex) {
                final sub = controller.recipe.value.digest?.firstWhere((element) => element.label.toString() == controller.selectedNutrition.value).sub?[subIndex];

                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              sub?.label.toString().replaceAll("Label.", "").capitalizeFirst ?? "",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              sub?.total?.toStringAsFixed(0) ?? '0',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "${sub?.daily?.toStringAsFixed(0) ?? '0'}%",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }
}
