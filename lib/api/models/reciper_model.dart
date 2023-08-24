class Recipe {
  int id;
  String image;
  String imageType;
  int likes;
  int missedIngredientCount;
  List<SedIngredient> missedIngredients;
  String title;
  List<SedIngredient> unusedIngredients;
  int usedIngredientCount;
  List<SedIngredient> usedIngredients;

  Recipe({
    required this.id,
    required this.image,
    required this.imageType,
    required this.likes,
    required this.missedIngredientCount,
    required this.missedIngredients,
    required this.title,
    required this.unusedIngredients,
    required this.usedIngredientCount,
    required this.usedIngredients,
  });
}

class SedIngredient {
  String aisle;
  double amount;
  int id;
  String image;
  List<String> meta;
  String name;
  String original;
  String originalName;
  String unit;
  String unitLong;
  String unitShort;
  String? extendedName;

  SedIngredient({
    required this.aisle,
    required this.amount,
    required this.id,
    required this.image,
    required this.meta,
    required this.name,
    required this.original,
    required this.originalName,
    required this.unit,
    required this.unitLong,
    required this.unitShort,
    this.extendedName,
  });
}
