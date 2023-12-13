class CategoryModel {
  String? categoryId;
  String? categoryName;
  String? description;

  CategoryModel({this.categoryId, this.categoryName, this.description});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    categoryName = json['categoryName'];
    description = json['description'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['categoryId'] = categoryId;
    data['categoryName'] = categoryName;
    data['description'] = description;
    return data;
  }
}
