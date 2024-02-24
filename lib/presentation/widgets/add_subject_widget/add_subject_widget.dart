
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../_imports.dart';
import '../../../controllers/home/home_controller.dart';
import '../add_document_widget/custom_button.dart';
import '../add_document_widget/custom_text_field.dart';

class AddSubjectWidget extends GetView<HomeController> {
  AddSubjectWidget( {required this.categoryId,super.key});
  final int categoryId;
  final TextEditingController ctr=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.black)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Center(
                child: Text(
                  "Fan qo'shish",
                  maxLines: 2,
                  style: AppTextStyle.categoryTitleBlackTextStyle,
                )),
            const Divider(),
            CustomTextFieldWidget(
              title: 'Fan nomi',
              hint: 'Fan nomi',
              controller: ctr,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(text: 'Saqlash', onPressed: () {
              controller.createSubjectByCategoryId(categoryId:categoryId,name:ctr.text);
            },
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
