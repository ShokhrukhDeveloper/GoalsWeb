class Session {
  Session({
    required this.studentId,
    this.refreshToken,
    required this.accessToken,
    this.expires,
    required this.id,
    this.createdAt,
    this.updatedAt,
  });
  factory Session.fromJson(dynamic json) {
    var studentId = json['student_id'];
    var refreshToken = json['refresh_token'];
    var accessToken = json['access_token'];
    var expires = json['expires'];
    var id = json['id'];
    var createdAt = json['created_at'];
    var updatedAt = json['updated_at'];
    return Session(
        refreshToken: refreshToken,
        expires: expires,
        createdAt: createdAt,
        updatedAt: updatedAt,
        studentId: studentId,
        accessToken: accessToken,
        id: id);

  }
  final int studentId;
  final String? refreshToken;
  final String accessToken;
  final String? expires;
  final int id;
  final String? createdAt;
  final String? updatedAt;
}
