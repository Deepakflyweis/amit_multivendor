// To parse this JSON data, do
//
//     final productsModel = productsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ProductsModel productsModelFromJson(String str) => ProductsModel.fromJson(json.decode(str));

String productsModelToJson(ProductsModel data) => json.encode(data.toJson());

class ProductsModel {
    ProductsModel({
        required this.success,
        required this.products,
        required this.demoProduct,
        required this.productsCount,
        required this.resultPerPage,
        required this.filteredProductsCount,
    });

    bool success;
    List<Product> products;
    List<DemoProduct> demoProduct;
    int productsCount;
    int resultPerPage;
    int filteredProductsCount;

    factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        success: json["success"],
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
        demoProduct: List<DemoProduct>.from(json["demoProduct"].map((x) => DemoProduct.fromJson(x))),
        productsCount: json["productsCount"],
        resultPerPage: json["resultPerPage"],
        filteredProductsCount: json["filteredProductsCount"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "demoProduct": List<dynamic>.from(demoProduct.map((x) => x.toJson())),
        "productsCount": productsCount,
        "resultPerPage": resultPerPage,
        "filteredProductsCount": filteredProductsCount,
    };
}

class DemoProduct {
    DemoProduct({
        required this.id,
        required this.name,
        required this.price,
        required this.ratings,
    });

    String id;
    String name;
    int price;
    int ratings;

    factory DemoProduct.fromJson(Map<String, dynamic> json) => DemoProduct(
        id: json["_id"],
        name: json["name"],
        price: json["price"],
        ratings: json["ratings"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "price": price,
        "ratings": ratings,
    };
}

class Product {
    Product({
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
    Category category;
    int stock;
    int numOfReviews;
    String user;
    List<dynamic> reviews;
    DateTime createdAt;
    int v;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
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
        required this.id,
        required this.name,
        required this.image,
        required this.v,
    });

    String id;
    String name;
    String image;
    int v;

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
