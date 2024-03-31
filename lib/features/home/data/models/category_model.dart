class CategorieModel {
  int? id;
  String? category;

  CategorieModel({this.id, this.category});

  CategorieModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
  }
}
