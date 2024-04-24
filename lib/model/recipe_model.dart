class RecipeModel {
  final int id;
  final String title;
  final String image;

  RecipeModel({required this.id, required this.title, required this.image});

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json['id'],
      title: json["title"],
      image: json['image'],
    );
  }
}
