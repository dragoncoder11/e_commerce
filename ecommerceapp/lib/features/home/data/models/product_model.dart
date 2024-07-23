  import 'package:hive/hive.dart';

part 'product_model.g.dart;

@HiveType(typeId:2)
class ProductModel extends HiveObject{
@HiveField(0)
  final int? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final double? price;
  @HiveField(3)
  final String? image;
@HiveField(4) 
  final String? desc;
  @HiveField(5)
  final List<dynamic>? images;
    @HiveField(6)

  int?quantity=1;

  ProductModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.image,
      this.quantity,
      required this.desc,
      required this.images});
  factory ProductModel.fromJson(json) {
    return ProductModel(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        image: json['image'],
        desc: json['description'],
        images: json['images']);
  }
}
 

