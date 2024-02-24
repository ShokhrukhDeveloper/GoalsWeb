import 'package:chopper/chopper.dart';
import 'package:goals_web/core/api_client/api_urls.dart';
part 'api_client.chopper.dart';
@ChopperApi()
abstract class ApiClient extends ChopperService {
  static ChopperClient? _chopperClient;
  static ApiClient get getInstance =>
      _$ApiClient(_chopperClient ??= ChopperClient(
          baseUrl: Uri.parse(ApiUrls.baseUrl),
          services: [_$ApiClient()],
          converter: const JsonConverter(),
          // interceptors: [
          //       (Request request) async => request.copyWith(
          //       headers: request.headers
          //         ..addAll({
          //           "Authorization":
          //           "Bearer ${LocalSource.getInstance().accessToken}",
          //           "X-APP-UID": "${LocalSource.getInstance().deviceInfo}",
          //         }))
          // ]
      ));

  @Get(path: "/Category")
  Future<Response> getCategoriesWithSubjects();
  @Post(path: "/Category")
  Future<Response> createCategory(@Body() Map<String,String> body);
  @Post(path: "/Category/{id}/Subjects")
  Future<Response> createSubject(@Path("id") int id,@Body() Map<String,String> body);
}