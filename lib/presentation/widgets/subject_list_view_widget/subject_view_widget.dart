import 'package:get/get.dart';
import 'subject_list_item_widget.dart';
import '../../../_imports.dart';
import '../../../controllers/home/home_controller.dart';
import '../add_category_widget/add_button.dart';
import '../search_text_widget/search_text_widget.dart';

class SubjectListViewWidget extends GetView<HomeController> {
  const SubjectListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.black)),
      child: GetBuilder<HomeController>(builder: (ctr) {
        return controller.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Obx(() => Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Center(
                                      child: Text(
                                controller.selectedCategory?.name ?? "!",
                                maxLines: 2,
                                style: AppTextStyle.categoryTitleBlackTextStyle,
                              ))),
                              const Expanded(child: SearchTextWidget()),
                              AddButton(onPressed: () async {
                                await controller.navigatorKey.currentState
                                    ?.pushNamed(Routes.addSubject,
                                        arguments:
                                            controller.selectedCategory?.id);

                              })
                            ],
                          ),
                        ),
                        const Divider(),
                        ...controller.selectedSubjects
                            .map<Widget>((e) => SubjectViewItemWidget(
                                onTap: () {
                                  controller.selectedSubject=e;
                                  controller.navigatorKey.currentState
                                      ?.pushNamed(Routes.subjectItemView,
                                          arguments: e.id);
                                  controller.getDocumentList(e.id);
                                },
                                title: e.name,
                                downloads: e.categoryId.toString())),
                        const Divider(),
                        // PagenationControlWidget()
                      ],
                    )),
              );
      }),
    );
  }
}
