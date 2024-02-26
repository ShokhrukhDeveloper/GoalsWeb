import 'package:get/get.dart';
import 'package:goals_web/presentation/widgets/subject_view_widget/subject_item_widget.dart';
import '../../../_imports.dart';
import '../../../controllers/home/home_controller.dart';
import '../add_category_widget/add_button.dart';
import '../search_text_widget/search_text_widget.dart';

class SubjectViewWidget extends GetView<HomeController> {
  const SubjectViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.black)),
      child: GetBuilder<HomeController>(
          builder: (ctr) {
            return controller.isLoading
                ? const Center(
              child: CircularProgressIndicator(),
            )
                : SingleChildScrollView(
              child: Obx(() =>Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Row(
                          children: [
                            const Expanded(
                                child: Center(
                                    child: Text(
                                      "Fanlar",
                                      maxLines: 2,
                                      style: AppTextStyle.categoryTitleBlackTextStyle,
                                    ))),
                            const Expanded(child: SearchTextWidget()),
                            AddButton(onPressed: ()async {
                              await controller.navigatorKey.currentState
                                  ?.pushNamed(Routes.addDocument, arguments: controller.selectedSubjectId.value);
                              ctr.getCategories();
                            })
                          ],
                        ),
                      ),
                      const Divider(),
                      ...controller.selectedSubjects.map<Widget>((e) => SubjectViewItemWidget(
                          onTap: () {
                            controller.navigatorKey.currentState?.pushNamed(Routes.documentView,arguments: e.id);
                          },
                          title: e.name,
                          downloads: e.categoryId.toString())),
                      const Divider(),
                      // PagenationControlWidget()
                    ],
                  )
              ),
            );
          }
      ),
    );
  }
}
