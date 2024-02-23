import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:goals_web/presentation/widgets/add_document_widget/custom_drop_down.dart';

import '../../../_imports.dart';
import 'custom_text_field.dart';

class AddDocumentWidget extends GetView {
  const AddDocumentWidget({super.key});

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
            Center(
                child: Text(
              "Hujjat qo'shish",
              maxLines: 2,
              style: AppTextStyle.categoryTitleBlackTextStyle,
            )),
            Divider(),
            CustomTextFieldWidget(
              title: 'Hujjat nomi',
              hint: 'Hujjat nomi',
            ),

            SizedBox(
              height: 10,
            ),

            CustomTextFieldWidget(
              title: 'Hujjat haqida',
              hint: '',
              borderRadius: 5,
              maxLines: 5,
              contentPadding: EdgeInsets.all(10),
            ),

            SizedBox(
              height: 10,
            ),

            CustomDropDown(
                hint: "Tilni tanlang",
                options: [
                  "options",
                  "options1",
                  "options2",
                ],
                onChanged: (e) {}),

            SizedBox(
              height: 10,
            ),

            CustomTextFieldWidget(
              title: 'Hujjat haqida',
              hint: '',
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextFieldWidget(
              formatter: [FilteringTextInputFormatter.digitsOnly],
              title: 'Avto screenshotlar soni',
              hint: '5',
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextFieldWidget(
              formatter: [FilteringTextInputFormatter.digitsOnly],
              title: 'Narxi',
              hint: '0',
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
