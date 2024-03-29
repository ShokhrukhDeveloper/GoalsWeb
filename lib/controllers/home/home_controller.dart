import 'package:chopper/chopper.dart';
import 'package:goals_web/controllers/auth_controller.dart';
import 'package:goals_web/core/data_models/category.dart';
import 'package:goals_web/core/data_models/document_list.dart';
import 'package:goals_web/core/data_models/language_list.dart';
import 'package:goals_web/core/data_models/last_added_model.dart';
import '../../_imports.dart';
import '../base_controller.dart';


class HomeController extends BaseController {
  //categoriyalar
  Category? category;
  Categories? selectedCategory;
  Subjects? selectedSubject;
  //languages
  LanguageList? languageList;
  Language? selectedLanguage;
  var selectedCategoryId = 0.obs;
  var selectedSubjectId = 0.obs;
  var selectedSubjects = <Subjects>[].obs;

  // document list
  DocumentList? documentsList;
  Future<void> getDocumentList(int id) async {
    selectedSubjectId.value=id;
    setLoading(true.obs);
    var response = await apiClient.getSubjectDocuments(id, {});
    print(response.statusCode);
    print(response.error);
    print(response.body);
    if (response.statusCode == 200) {
      documentsList = DocumentList.fromJson(response.body);
    }
    setLoading(false.obs);
  }


  //nested navigation
  late GlobalKey<NavigatorState> navigatorKey;

  ApiClient apiClient = ApiClient.getInstance;
  Future<void> getCategories() async {
    setLoading(true.obs);
    var response = await apiClient.getCategoriesWithSubjects();
    print(response.statusCode);
    print(response.error);
    print(response.body);
    if (response.statusCode == 200) {
      category = Category.fromJson(response.body);
      print("parse success");
    }
    setLoading(false.obs);
  }
  Future<LastAddedModel?> getLasts() async {
    var response = await apiClient.getLasts(10);
    await Future.delayed(Duration(seconds: 2));
    debugPrint("--------------------------------------------------------");
    debugPrint(response.statusCode.toString());
    debugPrint(response.error.toString());
    debugPrint(response.body.toString());
    if (response.isSuccessful) {
      printError(info: "");
      return LastAddedModel.fromJson(response.body);
    }
    return null;
  }
  Future<void> getLanguages() async {
    setLoading(true.obs);
    var response = await apiClient.getLanguages();
    debugPrint("${response.statusCode}");
    debugPrint("${response.error}");
    debugPrint("${response.body}");
    if (response.statusCode == 200) {
     languageList=LanguageList.fromJson(response.body);
     debugPrint("Language successfully ");
    }
    setLoading(false.obs);
  }
  Future<void> createCategory(String name) async {
    setLoading(true.obs);
    var response = await apiClient.createCategory({
      "name": name,
      "image": "string"
    });
    print(response.statusCode);
    print(response.error);
    print(response.body);
    if (response.statusCode == 200) {
     await getCategories();
     navigatorKey.currentState?.pop();
    }
    setLoading(false.obs);
  }
  Future<void> createSubjectByCategoryId({required int categoryId,required String name}) async {
    setLoading(true.obs);
    var response = await apiClient.createSubject(categoryId,{
      "name": name,
      "image": "*"
    });
    print(response.statusCode);
    print(response.error);
    print(response.body);
    if (response.statusCode == 200) {
      await getCategories();
      selectedSubjects.value=category?.categories.firstWhere((element) => element.id==selectedCategoryId.value).subjects??[];
      navigatorKey.currentState?.pop();
    }
    setLoading(false.obs);
  }
  @override
  void onInit() {
    AuthController()
        .getAccountDetail();
    getCategories();
    getLanguages();

    super.onInit();
  }
}
