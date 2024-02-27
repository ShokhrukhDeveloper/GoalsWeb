import 'package:chopper/chopper.dart';
import 'package:goals_web/core/api_client/api_urls.dart';
import 'package:goals_web/core/data_models/language_list.dart';
import 'package:goals_web/core/storage/local_storage.dart';

import '../data_models/document_details.dart';
part 'api_client.chopper.dart';

@ChopperApi()
abstract class ApiClient extends ChopperService {
  static ChopperClient? _chopperClient;
  static ApiClient get getInstance =>
      _$ApiClient(_chopperClient ??= ChopperClient(
        baseUrl: Uri.parse(ApiUrls.baseUrl),
        services: [_$ApiClient()],
        converter: const JsonConverter(),
        interceptors: [
              (Request request) async => request.copyWith(
              headers: request.headers
                ..addAll({
                  "Authorization":
                  "Bearer ${LocalStorage.accessToken}",
                }))
        ]
      ));

  @Get(path: "/Category")
  Future<Response> getCategoriesWithSubjects();
  @Get(path: "/Language")
  Future<Response> getLanguages();
  @Get(path: "/Book/{id}")
  Future<Response> getBookDetailsById(@Path("id") int id);
  @Get(path: "/Subject/{id}/Books")
  Future<Response> getSubjectDocuments(@Path("id") int id, @QueryMap() Map<String, int> query);
  @Post(path: "/Category")
  Future<Response> createCategory(@Body() Map<String, String> body);
  @Post(path: "/Student")
  Future<Response> createUser(@Body() Map<String, String> body);
  @Post(path: "/Auth")
  Future<Response> login(@Body() Map<String, String> body);
  @Get(path: "/Auth")
  Future<Response> getAccountDetails();
  @Post(path: "/Category/{id}/Subjects")
  Future<Response> createSubject(@Path("id") int id, @Body() Map<String, String> body);

}
