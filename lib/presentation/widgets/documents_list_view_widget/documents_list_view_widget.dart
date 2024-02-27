import 'package:get/get.dart';
import 'package:goals_web/controllers/home/home_controller.dart';
import 'package:goals_web/presentation/widgets/add_category_widget/add_button.dart';
import 'package:goals_web/presentation/widgets/search_text_widget/search_text_widget.dart';
import '../../../_imports.dart';
import '../pagenation_control_widget/pagenation_control_widget.dart';
import 'document_view_item.dart';

class DocumentsListViewWidget extends GetView<HomeController> {
  const DocumentsListViewWidget(this.id, {super.key});
  final int id;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.black)),
      child: GetBuilder<HomeController>(builder: (ctr) {
        return controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Row(
                        children: [
                          IconButton(onPressed: (){
                            controller.navigatorKey.currentState?.pop();
                          }, icon: const Icon(Icons.arrow_back)),
                           Expanded(
                              child: Center(
                                  child: Text(
                            controller.selectedSubject?.name??"!",
                            maxLines: 2,
                            style: AppTextStyle.categoryTitleBlackTextStyle,
                          ))),
                          const Expanded(child: SearchTextWidget()),
                          AddButton(onPressed: () async {
                            await controller.navigatorKey.currentState
                                ?.pushNamed(Routes.addDocument,
                                    arguments:
                                        controller.selectedSubjectId.value);
                            await ctr.getDocumentList(ctr.selectedSubject!.id);
                          })
                        ],
                      ),
                    ),
                    const Divider(),
                    ...?controller.documentsList?.documents
                        .map<Widget>((e) => CategoryViewItemWidget(
                            onTap: () {
                              controller.navigatorKey.currentState?.pushNamed(
                                  Routes.documentView,
                                  arguments: e.id);
                              // controller.apiClient.getBookDetailsById(e.id);
                            },
                            title: e.name,
                            downloads: e.categoryId.toString())),
                    const Divider(),
                    PagenationControlWidget()
                  ],
                ),
              );
      }),
    );
  }
}
