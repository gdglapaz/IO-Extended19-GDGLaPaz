
class CategoryModel {
  int id_category;
  String nameTechnology;
  String color;

  CategoryModel({
    this.id_category,
    this.nameTechnology,
    this.color,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => new CategoryModel(
    id_category: json["id_category"],
    nameTechnology: json["nameTechnology"],
    color: json["color"],
  );

  Map<String, dynamic> toJson() => {
    "id_category": id_category,
    "nameTechnology": nameTechnology,
    "color": color,
  };
}
