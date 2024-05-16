class PopularServiceModel {
  int? id;
  String? category;
  int? count;
  PopularServiceModel({this.category, this.count, this.id});
  PopularServiceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    count = json['count'];
  }
}
