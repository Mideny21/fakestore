import 'dart:convert';

// Cart cartFromJson(String str) => Cart.fromJson(json.decode(str));

String cartToJson(Cart data) => json.encode(data.toJson());

class Cart {
  int? productId;
  double? price;
  String? title;
  String? image;
  int? selectedQty;
  Cart({
    this.productId,
    this.price,
    this.title,
    this.image,
    this.selectedQty,
  });

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'price': price,
      'title': title,
      'image': image,
      'selectedQty': selectedQty,
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      productId: map['productId']?.toInt(),
      price: map['price']?.toDouble(),
      title: map['title'],
      image: map['image'],
      selectedQty: map['selectedQty']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) => Cart.fromMap(json.decode(source));
}
