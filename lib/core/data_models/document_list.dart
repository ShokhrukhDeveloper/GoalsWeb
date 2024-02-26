class DocumentList {
  DocumentList({
    required this.documents,
    required this.isSuccess,
    required this.currentPageIndex,
    required this.pageCount,
    this.errorMessage,
  });

  factory DocumentList.fromJson(dynamic json) {
    List<Documents> documents = [];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        documents.add(Documents.fromJson(v));
      });
    }
    return DocumentList(
        documents: documents,
        isSuccess: json['isSuccess'],
        currentPageIndex: json['currentPageIndex'],
        pageCount: json['pageCount'],
        errorMessage: json['errorMessage']);
  }
  final List<Documents> documents;
  final bool isSuccess;
  final int currentPageIndex;
  final int pageCount;
  final String? errorMessage;
}

class Documents {
  Documents({
    required this.name,
    required this.id,
    required this.categoryId,
    required this.image,
  });

  factory Documents.fromJson(dynamic json) {
    return Documents(
        name: json['name'],
        id: json['id'],
        categoryId: json['category_id'],
        image: json['image']);
  }
  final String name;
  final int id;
  final num categoryId;
  final String image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['id'] = id;
    map['category_id'] = categoryId;
    map['image'] = image;
    return map;
  }
}
