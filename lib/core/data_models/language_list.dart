class LanguageList {
  LanguageList({
    required this.language,
    required this.isSuccess,
    required this.currentPageIndex,
    required this.pageCount,
    this.errorMessage,
  });

  factory LanguageList.fromJson(dynamic json) {
    List<Language> language = [];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        language.add(Language.fromJson(v));
      });
    }

    return LanguageList(
        errorMessage: json['errorMessage'],
        language: language,
        isSuccess: json['isSuccess'],
        currentPageIndex: json['currentPageIndex'],
        pageCount: json['pageCount']);
  }
  final List<Language> language;
  final bool isSuccess;
  final int currentPageIndex;
  final int pageCount;
  final String? errorMessage;
}

class Language {
  Language({
    required this.name,
    required this.id,
    required this.createdAt,
    this.updatedAt,
  });

  factory Language.fromJson(dynamic json) {
    return Language(
        name: json['name'], id: json['id'], createdAt: json['created_at']);
  }

  final String name;
  final int id;
  final String createdAt;
  final String? updatedAt;
}
