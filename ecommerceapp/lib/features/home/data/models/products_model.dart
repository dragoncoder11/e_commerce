import 'package:hive/hive.dart';

//part 'products_model.g.dart;
@HiveType(typeId:2)
class CartModel {
@HiveField(0)
  final num? id;
  @HiveField(1)
  int quantity = 1;
  @HiveField(2)
  final ProductModel? product;

  CartModel({this.id, required this.product, required this.quantity});
  factory CartModel.fromJson(json) {
    return CartModel(
        id: json['id'],
        product: ProductModel.fromJson(json['product']),
        quantity: json['quantity']);
  }
}

class ProductModel {
  final num? id;
  final String? name;
  final num? price;
  final num? oldPrice;
  final num? discount;
  final String? image;
  final String? desc;
  final List<dynamic>? images;

  ProductModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.oldPrice,
      required this.discount,
      required this.image,
      required this.desc,
      required this.images});
  factory ProductModel.fromJson(json) {
    return ProductModel(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        oldPrice: json['old_price'],
        discount: json['discount'],
        image: json['image'],
        desc: json['description'],
        images: json['images']);
  }
}
