class Category {
  Category({
    required this.categories,
    required this.isSuccess,
    required this.currentPageIndex,
    required this.pageCount,
    this.errorMessage,
  });

  factory Category.fromJson(dynamic json) {
    List<Categories> categories = [];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        categories.add(Categories.fromJson(v));
      });
    }

    return Category(
      categories: categories,
      isSuccess: json['isSuccess'],
      currentPageIndex: json['currentPageIndex'],
      pageCount: json['pageCount'],
    );
  }
  List<Categories> categories;
  final bool isSuccess;
  final num currentPageIndex;
  final num pageCount;
  final String? errorMessage;
}

class Categories {
  Categories({
    required this.id,
    required this.name,
    this.image,
    required this.subjects,
  });

  factory Categories.fromJson(dynamic json) {
    List<Subjects> subjects = [];
    if (json['subjects'] != null) {
      json['subjects'].forEach((v) {
        subjects.add(Subjects.fromJson(v));
      });
    }
    return Categories(
        image: json['image'],
        name: json['name'],
        subjects: subjects,
        id: json['id']);
  }
  final int id;
  final String name;
  final String? image;
  final List<Subjects> subjects;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    if (subjects != null) {
      map['subjects'] = subjects.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Subjects {
  Subjects({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.image,
  });

  factory Subjects.fromJson(dynamic json) {
    return Subjects(
        id: json['id'],
        categoryId: json['categoryId'],
        name: json['name'],
        image: json['image']);
  }
  final int id;
  final int categoryId;
  final String name;
  final String image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['categoryId'] = categoryId;
    map['name'] = name;
    map['image'] = image;
    return map;
  }
}
