// To parse this JSON data, do
//
//     final wishListModel = wishListModelFromJson(jsonString);

import 'dart:convert';

WishListModel wishListModelFromJson(String str) => WishListModel.fromJson(json.decode(str));

String wishListModelToJson(WishListModel data) => json.encode(data.toJson());

class WishListModel {
    WishListModel({
        this.success,
        required this.wishlist,
    });

    bool ? success;
    Wishlist wishlist;

    factory WishListModel.fromJson(Map<String, dynamic> json) => WishListModel(
        success: json["success"],
        wishlist: Wishlist.fromJson(json["wishlist"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "wishlist": wishlist.toJson(),
    };
}

class Wishlist {
    Wishlist({
        required this.id,
        required this.user,
        required this.products,
        this.v,
    });

    String id;
    String user;
    List<Product> products;
    int? v;

    factory Wishlist.fromJson(Map<String, dynamic> json) => Wishlist(
        id: json["_id"],
        user: json["user"],
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "__v": v,
    };
}

class Product {
    Product({
       required this.id,
       required this.name,
         this.description,
       required this.price,
         this.ratings,
         required this.images,
         this.category,
         this.stock,
         this.numOfReviews,
         this.user,
         this.reviews,
        this.createdAt,
        this.v,
    });

    String id;
    String name;
    String? description;
    int price;
    int ? ratings;
    List<Image> images;
    String ? category;
    int ? stock;
    int ? numOfReviews;
    String ? user;
    List<Map<String, String>> ? reviews;
    DateTime ? createdAt;
    int ? v;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
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
        reviews: List<Map<String, String>>.from(json["reviews"].map((x) => Map.from(x).map((k, v) => MapEntry<String, String>(k, v)))),
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
        "reviews": List<dynamic>.from(reviews!.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
        "createdAt": createdAt!.toIso8601String(),
        "__v": v,
    };
}

class Image {
    Image({
        this.publicId,
       required this.url,
        this.id,
    });

    String? publicId;
    String url;
    String ? id;

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
