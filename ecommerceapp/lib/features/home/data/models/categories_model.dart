import 'package:hive/hive.dart';

part 'categories_model.g.dart';
@HiveType(typeId: 1)
class CategoriesModel {
   @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? image;
   @HiveField(2)
  final String? name;

  CategoriesModel({required this.id, required this.image, required this.name});
  factory CategoriesModel.fromJson(json) {
    return CategoriesModel(
      id: json['id'],
      image: json['image'],
      name: json['name'],
    );
  }
}
