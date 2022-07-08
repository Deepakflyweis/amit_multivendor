
// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

List<SearchModel> searchModelFromJson(String str) => List<SearchModel>.from(json.decode(str).map((x) => SearchModel.fromJson(x)));

String searchModelToJson(List<SearchModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchModel {
    SearchModel({
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
        this.v,
    });

    String id;
    String name;
    String description;
    int price;
    int ratings;
    List<Image> images;
    Category category;
    int stock;
    int numOfReviews;
    String user;
    List<dynamic> reviews;
    DateTime createdAt;
    int? v;

    factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        ratings: json["ratings"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        category: Category.fromJson(json["category"]),
        stock: json["Stock"],
        numOfReviews: json["numOfReviews"],
        user: json["user"],
        reviews: List<dynamic>.from(json["reviews"].map((x) => x)),
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
        "category": category.toJson(),
        "Stock": stock,
        "numOfReviews": numOfReviews,
        "user": user,
        "reviews": List<dynamic>.from(reviews.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "__v": v,
    };
}

class Category {
    Category({
        this.id,
        this.name,
        this.image,
        this.v,
    });

    String? id;
    String? name;
    String? image;
    int ? v;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"],
        name: json["name"],
        image: json["image"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "image": image,
        "__v": v,
    };
}

class Image {
    Image({
        this.publicId,
       required this.url,
       required this.id,
    });

    String ? publicId;
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
