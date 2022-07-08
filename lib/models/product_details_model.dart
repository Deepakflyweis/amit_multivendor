// To parse this JSON data, do
//
//     final productDetailsModel = productDetailsModelFromJson(jsonString);

import 'dart:convert';

ProductDetailsModel productDetailsModelFromJson(String str) => ProductDetailsModel.fromJson(json.decode(str));

String productDetailsModelToJson(ProductDetailsModel data) => json.encode(data.toJson());

class ProductDetailsModel {
    ProductDetailsModel({
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
       required this.reviews,
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
    List<Map<String, String>> reviews;
    DateTime createdAt;
    int v;

    factory ProductDetailsModel.fromJson(Map<String, dynamic> json) => ProductDetailsModel(
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
        "reviews": List<dynamic>.from(reviews.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
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
