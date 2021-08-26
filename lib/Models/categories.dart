// To parse this JSON data, do
//
//     final categories = categoriesFromJson(jsonString);

import 'dart:convert';

Categories categoriesFromJson(String str) =>
    Categories.fromJson(json.decode(str));

String categoriesToJson(Categories data) => json.encode(data.toJson());

class Categories {
  Categories({
    this.the0LegalNotice,
    this.jobCount,
    this.categories,
  });

  String? the0LegalNotice;
  int? jobCount;
  List<Category>? categories;

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        the0LegalNotice:
            json["0-legal-notice"] == null ? null : json["0-legal-notice"],
        jobCount: json["job-count"] == null ? null : json["job-count"],
        categories: json["jobs"] == null
            ? null
            : List<Category>.from(
                json["jobs"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "0-legal-notice": the0LegalNotice == null ? null : the0LegalNotice,
        "job-count": jobCount == null ? null : jobCount,
        "jobs": categories == null
            ? null
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
      };
}

class Category {
  Category({
    this.id,
    this.name,
    this.slug,
  });

  int? id;
  String? name;
  String? slug;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        slug: json["slug"] == null ? null : json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "slug": slug == null ? null : slug,
      };
}
