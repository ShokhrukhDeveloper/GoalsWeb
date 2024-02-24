import 'package:get/get.dart';
import 'package:goals_web/controllers/home/home_controller.dart';
import '../../../_imports.dart';
import '../add_document_widget/custom_button.dart';
import '../add_document_widget/custom_text_field.dart';


class AddCategoryWidget extends GetView<HomeController> {
   AddCategoryWidget({super.key});
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
                  "Categoriya qo'shish",
                  maxLines: 2,
                  style: AppTextStyle.categoryTitleBlackTextStyle,
                )),
            const Divider(),
             CustomTextFieldWidget(
              title: 'Categoriya nomi',
              hint: 'Categoriya nomi',
              controller: ctr,
            ),
            SizedBox(
              height: 10,
            ),
            CustomButton(text: 'Saqlash', onPressed: () {
              controller.createCategory(ctr.text);
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
