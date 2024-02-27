class LastAddedModel {
  LastAddedModel({
      required this.document,});

  factory LastAddedModel.fromJson(dynamic json) {
    List<Document> document=[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        document.add(Document.fromJson(v));
      });
    }
    return LastAddedModel(document: document);
  }
  List<Document> document=[];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

      map['document'] = document.map((v) => v.toJson()).toList();

    return map;
  }

}

class Document {
  Document({
      required this.name,
      required this.id,
      this.categoryId, 
      this.image,});

 factory Document.fromJson(dynamic json) {
    var name = json['name'];
    var id = json['id'];
    var categoryId = json['category_id'];
    var image = json['image'];
    return Document(name: name, id: id,categoryId: categoryId,image: image);

  }
  String name;
  int id;
  int? categoryId;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['id'] = id;
    map['category_id'] = categoryId;
    map['image'] = image;
    return map;
  }

}