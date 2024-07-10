import 'package:hive/hive.dart';

part 'banners_model.g.dart';

@HiveType(typeId: 0)
class BannersModel extends HiveObject{
  @HiveField(0)
  final int id;
   @HiveField(1)
  final String image;

  BannersModel({required this.id, required this.image});
  factory BannersModel.fromJson(json){
    return BannersModel(id: json['id'], image: json['image']);
  }
}