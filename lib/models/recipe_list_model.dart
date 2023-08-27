import 'dart:convert';

RecipeListModel recipeListModelFromJson(String str) => RecipeListModel.fromJson(json.decode(str));

String recipeListModelToJson(RecipeListModel data) => json.encode(data.toJson());

class RecipeListModel {
  int? from;
  int? to;
  int? count;
  RecipeListModelLinks? links;
  List<Hit>? hits;

  RecipeListModel({
    this.from,
    this.to,
    this.count,
    this.links,
    this.hits,
  });

  factory RecipeListModel.fromJson(Map<String, dynamic> json) => RecipeListModel(
        from: json["from"],
        to: json["to"],
        count: json["count"],
        links: json["_links"] == null ? null : RecipeListModelLinks.fromJson(json["_links"]),
        hits: json["hits"] == null ? [] : List<Hit>.from(json["hits"].map((x) => Hit.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "from": from,
        "to": to,
        "count": count,
        "_links": links?.toJson(),
        "hits": hits == null ? [] : List<dynamic>.from(hits!.map((x) => x.toJson())),
      };
}

class Hit {
  Recipe? recipe;
  HitLinks? links;

  Hit({
    this.recipe,
    this.links,
  });

  factory Hit.fromJson(Map<String, dynamic> json) => Hit(
        recipe: json["recipe"] == null ? null : Recipe.fromJson(json["recipe"]),
        links: json["_links"] == null ? null : HitLinks.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "recipe": recipe?.toJson(),
        "_links": links?.toJson(),
      };
}

class HitLinks {
  Self? self;

  HitLinks({
    this.self,
  });

  factory HitLinks.fromJson(Map<String, dynamic> json) => HitLinks(
        self: json["self"] == null ? null : Self.fromJson(json["self"]),
      );

  Map<String, dynamic> toJson() => {
        "self": self?.toJson(),
      };
}

class Self {
  String? href;
  Title? title;

  Self({
    this.href,
    this.title,
  });

  factory Self.fromJson(Map<String, dynamic> json) => Self(
        href: json["href"],
        title: titleValues.map[json["title"]],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
        "title": titleValues.reverse[title],
      };
}

enum Title { SELF }

final titleValues = EnumValues({"Self": Title.SELF});

class Recipe {
  String? uri;
  String? label;
  String? image;
  Images? images;
  String? source;
  String? url;
  String? shareAs;
  double? recipeYield;
  List<DietLabel>? dietLabels;
  List<HealthLabel>? healthLabels;
  List<String>? cautions;
  List<String>? ingredientLines;
  List<Ingredient>? ingredients;
  double? calories;
  double? totalWeight;
  double? totalTime;
  List<String>? cuisineType;
  List<MealType>? mealType;
  List<DishType>? dishType;
  Map<String, Total>? totalNutrients;
  Map<String, Total>? totalDaily;
  List<Digest>? digest;

  Recipe({
    this.uri,
    this.label,
    this.image,
    this.images,
    this.source,
    this.url,
    this.shareAs,
    this.recipeYield,
    this.dietLabels,
    this.healthLabels,
    this.cautions,
    this.ingredientLines,
    this.ingredients,
    this.calories,
    this.totalWeight,
    this.totalTime,
    this.cuisineType,
    this.mealType,
    this.dishType,
    this.totalNutrients,
    this.totalDaily,
    this.digest,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        uri: json["uri"],
        label: json["label"],
        image: json["image"],
        images: json["images"] == null ? null : Images.fromJson(json["images"]),
        source: json["source"],
        url: json["url"],
        shareAs: json["shareAs"],
        recipeYield: json["yield"],
        dietLabels: (json["dietLabels"] as List<dynamic>?)?.map((x) => dietLabelValues.map[x]).whereType<DietLabel>().toList(),
        healthLabels: (json["healthLabels"] as List<dynamic>?)?.map((x) => healthLabelValues.map[x]).whereType<HealthLabel>().toList(),
        cautions: json["cautions"] == null ? [] : List<String>.from(json["cautions"].map((x) => x)),
        ingredientLines: json["ingredientLines"] == null ? [] : List<String>.from(json["ingredientLines"].map((x) => x)),
        ingredients: json["ingredients"] == null ? [] : List<Ingredient>.from(json["ingredients"].map((x) => Ingredient.fromJson(x))),
        calories: json["calories"]?.toDouble(),
        totalWeight: json["totalWeight"]?.toDouble(),
        totalTime: json["totalTime"],
        cuisineType: json["cuisineType"] == null ? [] : List<String>.from(json["cuisineType"].map((x) => x)),
        mealType: (json["mealType"] as List<dynamic>?)?.map((x) => mealTypeValues.map[x]).whereType<MealType>().toList(),
        dishType: (json["dishType"] as List<dynamic>?)?.map((x) => dishTypeValues.map[x]).whereType<DishType>().toList(),
        totalNutrients: Map.from(json["totalNutrients"]!).map((k, v) => MapEntry<String, Total>(k, Total.fromJson(v))),
        totalDaily: Map.from(json["totalDaily"]!).map((k, v) => MapEntry<String, Total>(k, Total.fromJson(v))),
        digest: json["digest"] == null ? [] : List<Digest>.from(json["digest"].map((x) => Digest.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "uri": uri,
        "label": label,
        "image": image,
        "images": images?.toJson(),
        "source": source,
        "url": url,
        "shareAs": shareAs,
        "yield": recipeYield,
        "dietLabels": dietLabels == null ? [] : List<dynamic>.from(dietLabels!.map((x) => dietLabelValues.reverse[x])),
        "healthLabels": healthLabels == null ? [] : List<dynamic>.from(healthLabels!.map((x) => healthLabelValues.reverse[x])),
        "cautions": cautions == null ? [] : List<dynamic>.from(cautions!.map((x) => x)),
        "ingredientLines": ingredientLines == null ? [] : List<dynamic>.from(ingredientLines!.map((x) => x)),
        "ingredients": ingredients == null ? [] : List<dynamic>.from(ingredients!.map((x) => x.toJson())),
        "calories": calories,
        "totalWeight": totalWeight,
        "totalTime": totalTime,
        "cuisineType": cuisineType == null ? [] : List<dynamic>.from(cuisineType!.map((x) => x)),
        "mealType": mealType == null ? [] : List<dynamic>.from(mealType!.map((x) => mealTypeValues.reverse[x])),
        "dishType": dishType == null ? [] : List<dynamic>.from(dishType!.map((x) => dishTypeValues.reverse[x])),
        "totalNutrients": Map.from(totalNutrients!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "totalDaily": Map.from(totalDaily!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "digest": digest == null ? [] : List<dynamic>.from(digest!.map((x) => x.toJson())),
      };
}

enum DietLabel { BALANCED, LOW_CARB, LOW_FAT }

final dietLabelValues = EnumValues({"Balanced": DietLabel.BALANCED, "Low-Carb": DietLabel.LOW_CARB, "Low-Fat": DietLabel.LOW_FAT});

class Digest {
  Label? label;
  String? tag;
  SchemaOrgTag? schemaOrgTag;
  double? total;
  bool? hasRdi;
  double? daily;
  Unit? unit;
  List<Digest>? sub;

  Digest({
    this.label,
    this.tag,
    this.schemaOrgTag,
    this.total,
    this.hasRdi,
    this.daily,
    this.unit,
    this.sub,
  });

  factory Digest.fromJson(Map<String, dynamic> json) => Digest(
        label: labelValues.map[json["label"]],
        tag: json["tag"],
        schemaOrgTag: schemaOrgTagValues.map[json["schemaOrgTag"]],
        total: json["total"]?.toDouble(),
        hasRdi: json["hasRDI"],
        daily: json["daily"]?.toDouble(),
        unit: unitValues.map[json["unit"]],
        sub: json["sub"] == null ? [] : List<Digest>.from(json["sub"].map((x) => Digest.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "label": labelValues.reverse[label],
        "tag": tag,
        "schemaOrgTag": schemaOrgTagValues.reverse[schemaOrgTag],
        "total": total,
        "hasRDI": hasRdi,
        "daily": daily,
        "unit": unitValues.reverse[unit],
        "sub": sub == null ? [] : List<dynamic>.from(sub!.map((x) => x.toJson())),
      };
}

enum Label {
  CALCIUM,
  CARBOHYDRATES_NET,
  CARBS,
  CARBS_NET,
  CHOLESTEROL,
  ENERGY,
  FAT,
  FIBER,
  FOLATE_EQUIVALENT_TOTAL,
  FOLATE_FOOD,
  FOLIC_ACID,
  IRON,
  MAGNESIUM,
  MONOUNSATURATED,
  NIACIN_B3,
  PHOSPHORUS,
  POLYUNSATURATED,
  POTASSIUM,
  PROTEIN,
  RIBOFLAVIN_B2,
  SATURATED,
  SODIUM,
  SUGARS,
  SUGARS_ADDED,
  SUGAR_ALCOHOLS,
  THIAMIN_B1,
  TRANS,
  VITAMIN_A,
  VITAMIN_B12,
  VITAMIN_B6,
  VITAMIN_C,
  VITAMIN_D,
  VITAMIN_E,
  VITAMIN_K,
  WATER,
  ZINC
}

final labelValues = EnumValues({
  "Calcium": Label.CALCIUM,
  "Carbohydrates (net)": Label.CARBOHYDRATES_NET,
  "Carbs": Label.CARBS,
  "Carbs (net)": Label.CARBS_NET,
  "Cholesterol": Label.CHOLESTEROL,
  "Energy": Label.ENERGY,
  "Fat": Label.FAT,
  "Fiber": Label.FIBER,
  "Folate equivalent (total)": Label.FOLATE_EQUIVALENT_TOTAL,
  "Folate (food)": Label.FOLATE_FOOD,
  "Folic acid": Label.FOLIC_ACID,
  "Iron": Label.IRON,
  "Magnesium": Label.MAGNESIUM,
  "Monounsaturated": Label.MONOUNSATURATED,
  "Niacin (B3)": Label.NIACIN_B3,
  "Phosphorus": Label.PHOSPHORUS,
  "Polyunsaturated": Label.POLYUNSATURATED,
  "Potassium": Label.POTASSIUM,
  "Protein": Label.PROTEIN,
  "Riboflavin (B2)": Label.RIBOFLAVIN_B2,
  "Saturated": Label.SATURATED,
  "Sodium": Label.SODIUM,
  "Sugars": Label.SUGARS,
  "Sugars, added": Label.SUGARS_ADDED,
  "Sugar alcohols": Label.SUGAR_ALCOHOLS,
  "Thiamin (B1)": Label.THIAMIN_B1,
  "Trans": Label.TRANS,
  "Vitamin A": Label.VITAMIN_A,
  "Vitamin B12": Label.VITAMIN_B12,
  "Vitamin B6": Label.VITAMIN_B6,
  "Vitamin C": Label.VITAMIN_C,
  "Vitamin D": Label.VITAMIN_D,
  "Vitamin E": Label.VITAMIN_E,
  "Vitamin K": Label.VITAMIN_K,
  "Water": Label.WATER,
  "Zinc": Label.ZINC
});

enum SchemaOrgTag {
  CARBOHYDRATE_CONTENT,
  CHOLESTEROL_CONTENT,
  FAT_CONTENT,
  FIBER_CONTENT,
  PROTEIN_CONTENT,
  SATURATED_FAT_CONTENT,
  SODIUM_CONTENT,
  SUGAR_CONTENT,
  TRANS_FAT_CONTENT
}

final schemaOrgTagValues = EnumValues({
  "carbohydrateContent": SchemaOrgTag.CARBOHYDRATE_CONTENT,
  "cholesterolContent": SchemaOrgTag.CHOLESTEROL_CONTENT,
  "fatContent": SchemaOrgTag.FAT_CONTENT,
  "fiberContent": SchemaOrgTag.FIBER_CONTENT,
  "proteinContent": SchemaOrgTag.PROTEIN_CONTENT,
  "saturatedFatContent": SchemaOrgTag.SATURATED_FAT_CONTENT,
  "sodiumContent": SchemaOrgTag.SODIUM_CONTENT,
  "sugarContent": SchemaOrgTag.SUGAR_CONTENT,
  "transFatContent": SchemaOrgTag.TRANS_FAT_CONTENT
});

enum Unit { EMPTY, G, KCAL, MG, UNIT_G }

final unitValues = EnumValues({"%": Unit.EMPTY, "g": Unit.G, "kcal": Unit.KCAL, "mg": Unit.MG, "µg": Unit.UNIT_G});

enum DishType { CONDIMENTS_AND_SAUCES, DESSERTS, MAIN_COURSE, SANDWICHES }

final dishTypeValues = EnumValues(
    {"condiments and sauces": DishType.CONDIMENTS_AND_SAUCES, "desserts": DishType.DESSERTS, "main course": DishType.MAIN_COURSE, "sandwiches": DishType.SANDWICHES});

enum HealthLabel {
  Alcohol_Free,
  Dash,
  Fodmap_Free,
  Immuno_Supportive,
  Keto_Friendly,
  Mediterranean,
  Peanut_Free,
  Pescatarian,
  Sugar_Conscious,
  Sulfite_Free,
  Tree_Nut_Free,
  Vegan,
  Vegetarian,
}

final healthLabelValues = EnumValues({
  "Alcohol-Free": HealthLabel.Alcohol_Free,
  "DASH": HealthLabel.Dash,
  "FODMAP-Free": HealthLabel.Fodmap_Free,
  "Immuno-Supportive": HealthLabel.Immuno_Supportive,
  "Keto-Friendly": HealthLabel.Keto_Friendly,
  "Mediterranean": HealthLabel.Mediterranean,
  "Peanut-Free": HealthLabel.Peanut_Free,
  "Pescatarian": HealthLabel.Pescatarian,
  "Sugar-Conscious": HealthLabel.Sugar_Conscious,
  "Sulfite-Free": HealthLabel.Sulfite_Free,
  "Tree-Nut-Free": HealthLabel.Tree_Nut_Free,
  "Vegan": HealthLabel.Vegan,
  "Vegetarian": HealthLabel.Vegetarian,
});

class Images {
  Large? thumbnail;
  Large? small;
  Large? regular;
  Large? large;

  Images({
    this.thumbnail,
    this.small,
    this.regular,
    this.large,
  });

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        thumbnail: json["THUMBNAIL"] == null ? null : Large.fromJson(json["THUMBNAIL"]),
        small: json["SMALL"] == null ? null : Large.fromJson(json["SMALL"]),
        regular: json["REGULAR"] == null ? null : Large.fromJson(json["REGULAR"]),
        large: json["LARGE"] == null ? null : Large.fromJson(json["LARGE"]),
      );

  Map<String, dynamic> toJson() => {
        "THUMBNAIL": thumbnail?.toJson(),
        "SMALL": small?.toJson(),
        "REGULAR": regular?.toJson(),
        "LARGE": large?.toJson(),
      };
}

class Large {
  String? url;
  int? width;
  int? height;

  Large({
    this.url,
    this.width,
    this.height,
  });

  factory Large.fromJson(Map<String, dynamic> json) => Large(
        url: json["url"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "width": width,
        "height": height,
      };
}

class Ingredient {
  String? text;
  double? weight;
  String? foodCategory;
  String? foodId;
  String? image;

  Ingredient({
    this.text,
    this.weight,
    this.foodCategory,
    this.foodId,
    this.image,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        text: json["text"],
        weight: json["weight"]?.toDouble(),
        foodCategory: json["foodCategory"],
        foodId: json["foodId"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "weight": weight,
        "foodCategory": foodCategory,
        "foodId": foodId,
        "image": image,
      };
}

enum MealType { BREAKFAST, LUNCH_DINNER, SNACK }

final mealTypeValues = EnumValues({"breakfast": MealType.BREAKFAST, "lunch/dinner": MealType.LUNCH_DINNER, "snack": MealType.SNACK});

class Total {
  Label? label;
  double? quantity;
  Unit? unit;

  Total({
    this.label,
    this.quantity,
    this.unit,
  });

  factory Total.fromJson(Map<String, dynamic> json) => Total(
        label: labelValues.map[json["label"]],
        quantity: json["quantity"]?.toDouble(),
        unit: unitValues.map[json["unit"]],
      );

  Map<String, dynamic> toJson() => {
        "label": labelValues.reverse[label],
        "quantity": quantity,
        "unit": unitValues.reverse[unit],
      };
}

class RecipeListModelLinks {
  RecipeListModelLinks();

  factory RecipeListModelLinks.fromJson(Map<String, dynamic> json) => RecipeListModelLinks();

  Map<String, dynamic> toJson() => {};
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
