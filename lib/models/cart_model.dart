// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
    CartModel({
        required this.success,
        required this.msg,
        required this.cart,
    });

    bool success;
    String msg;
    Cart cart;

    factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        success: json["success"],
        msg: json["msg"],
        cart: Cart.fromJson(json["cart"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "msg": msg,
        "cart": cart.toJson(),
    };
}

class Cart {
    Cart({
        required this.id,
        required this.user,
        required this.coupon,
        required this.products,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
        required this.subTotal,
        required this.discount,
        required this.total,
        required this.shipping,
    });

    String id;
    String user;
    dynamic coupon;
    List<ProductElement> products;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    RxInt subTotal;
    int discount;
    RxInt total;
    int shipping;

    factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["_id"],
        user: json["user"],
        coupon: json["coupon"],
        products: List<ProductElement>.from(json["products"].map((x) => ProductElement.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        subTotal: RxInt(json["subTotal"]),
        discount: json["discount"],
        total: RxInt(json["total"]),
        shipping: json["shipping"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user,
        "coupon": coupon,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "subTotal": subTotal.value,
        "discount": discount,
        "total": total.value,
        "shipping": shipping,
    };
}

class ProductElement {
    ProductElement({
        required this.product,
        required this.quantity,
        required this.total,
    });

    ProductProduct product;
    RxInt quantity;
    int total;

    factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
        product: ProductProduct.fromJson(json["product"]),
        quantity: RxInt(json["quantity"]),
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "product": product.toJson(),
        "quantity": quantity.value,
        "total": total,
    };
}

class ProductProduct {
    ProductProduct({
        required this.id,
        required this.name,
        required this.description,
        required this.price,
        required this.ratings,
        required this.images,
        required this.category,
        required this.stock,
        required this.numOfReviews,
        required this.user,
        required this.createdAt,
        required this.v,
    });

    String id;
    String name;
    String description;
    int price;
    int ratings;
    List<Image> images;
    String category;
    int stock;
    int numOfReviews;
    String user;
    DateTime createdAt;
    int v;

    factory ProductProduct.fromJson(Map<String, dynamic> json) => ProductProduct(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        ratings: json["ratings"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        category: json["category"],
        stock: json["Stock"],
        numOfReviews: json["numOfReviews"],
        user: json["user"],
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "description": description,
        "price": price,
        "ratings": ratings,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "category": category,
        "Stock": stock,
        "numOfReviews": numOfReviews,
        "user": user,
        "createdAt": createdAt.toIso8601String(),
        "__v": v,
    };
}

class Image {
    Image({
        required this.publicId,
        required this.url,
        required this.id,
    });

    String publicId;
    String url;
    String id;

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        publicId: json["public_id"],
        url: json["url"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "public_id": publicId,
        "url": url,
        "_id": id,
    };
}
