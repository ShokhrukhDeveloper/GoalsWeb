class DocumentDetails {
  DocumentDetails({
    required this.description,
    required this.name,
    required this.categoryId,
    required this.category,
    required this.subjectId,
    required this.subject,
    required this.userId,
    required this.user,
    required this.languageId,
    required this.language,
    required this.images,
    required this.fileType,
    required this.file,
    required this.fileSize,
    required this.isAccepted,
    required this.image,
    required this.views,
    required this.downloads,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DocumentDetails.fromJson(dynamic json) {
    List<Images> images = [];
    var description = json['description'];
    var name = json['name'];
    var categoryId = json['category_id'];
    var category = json['category'];
    var subjectId = json['subject_id'];
    var subject = json['subject'];
    var userId = json['user_id'];
    var user = json['user'];
    var languageId = json['language_id'];
    var language = json['language'];
    if (json['images'] != null) {
      json['images'].forEach((v) {
        images.add(Images.fromJson(v));
      });
    }
    var fileType = json['file_type'];
    var file = json['file'];
    var fileSize = json['file_size'];
    var isAccepted = json['is_accepted'];
    var image = json['image'];
    var views = json['views'];
    var downloads = json['downloads'];
    var id = json['id'];
    var createdAt = json['created_at'];
    var updatedAt = json['updated_at'];
    return DocumentDetails(
        description: description,
        name: name,
        categoryId: categoryId,
        category: category,
        subjectId: subjectId,
        subject: subject,
        userId: userId,
        user: user,
        languageId: languageId,
        language: language,
        images: images,
        fileType: fileType,
        file: file,
        fileSize: fileSize,
        isAccepted: isAccepted,
        image: image,
        views: views,
        downloads: downloads,
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }
  final dynamic description;
  final String name;
  final num categoryId;
  final dynamic category;
  final num subjectId;
  final dynamic subject;
  final num userId;
  final dynamic user;
  final num languageId;
  final dynamic language;
  final List<Images> images;
  final String fileType;
  final String file;
  final num fileSize;
  final bool isAccepted;
  final String image;
  final num views;
  final num downloads;
  final num id;
  final String createdAt;
  final dynamic updatedAt;
}

class Images {
  Images({
    required this.id,
    required this.bookId,
    required this.book,
    required this.url,
  });

  factory Images.fromJson(dynamic json) {
    var id = json['id'];
    var bookId = json['bookId'];
    var book = json['book'];
    var url = json['url'];
    return Images(id: id, bookId: bookId, book: book, url: url);
  }
  final num id;
  final num bookId;
  final dynamic book;
  final String url;
}
