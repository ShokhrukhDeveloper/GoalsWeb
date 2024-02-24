import 'package:goals_web/core/data_models/category.dart';

import '../../_imports.dart';
import '../base_controller.dart';

class HomeController extends BaseController {
  Category? category;
  var selectedCategoryId = 0.obs;
  var selectedSubjectId = 0.obs;
  var selectedSubjects = <Subjects>[].obs;
  late GlobalKey<NavigatorState> navigatorKey;

  ApiClient apiClient = ApiClient.getInstance;
  Future<void> getCategories() async {
    setLoading(true);
    var response = await apiClient.getCategoriesWithSubjects();
    print(response.statusCode);
    print(response.error);
    print(response.body);
    if (response.statusCode == 200) {
      category = Category.fromJson(response.body);
      print("parse success");
    }
    setLoading(false);
  }
  Future<void> createCategory(String name) async {
    setLoading(true);
    var response = await apiClient.createCategory({
      "name": name,
      "image": "string"
    });
    print(response.statusCode);
    print(response.error);
    print(response.body);
    if (response.statusCode == 200) {
      getCategories();
    }
    setLoading(false);
  }

  @override
  void onInit() {
    getCategories();
    super.onInit();
  }
}
