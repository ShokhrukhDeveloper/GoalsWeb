import 'package:get/get.dart';
import 'package:goals_web/core/data_models/last_added_model.dart';
import '../../../controllers/auth_controller.dart';

import '../../../_imports.dart';
import '../../../controllers/home/home_controller.dart';
import '../add_category_widget/add_button.dart';
import '../search_text_widget/search_text_widget.dart';
import 'last_added_item.dart';

class LastAddedListViewWidget extends GetView<HomeController> {
  const LastAddedListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.black)),
      child:
      FutureBuilder<LastAddedModel?>(
        future: controller.getLasts(),
            builder: (context,snap) {
              if(snap.connectionState==ConnectionState.waiting) {
                return const Center(
                child: CircularProgressIndicator(),
              );
              }
              if(snap.connectionState==ConnectionState.done) {
                return SingleChildScrollView(
                      child:   Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 20, horizontal: 25),
                  child: Align(
                    alignment: Alignment.centerLeft,
                      child: Text(
                        "So'nngi qo'shilganlar",
                        maxLines: 2,
                        style: AppTextStyle.categoryTitleBlackTextStyle,
                      )),
                ),
                const Divider(),
                ...?snap.data?.document.map((e) => LastAddedItemWidget(
                    onTap: () {
                      // controller.selectedSubject=e;
                      // controller.navigatorKey.currentState
                      //     ?.pushNamed(Routes.subjectItemView,
                      //     arguments: e.id);
                      // controller.getDocumentList(e.id);
                    },
                    title: "${e.name}",
                    downloads: "")),
                const Divider(),
                // PagenationControlWidget()
              ],
                      ),
                    );
              }
              return const Text("xatolik yuz berdi");
            }
          ),
    );
  }
}
