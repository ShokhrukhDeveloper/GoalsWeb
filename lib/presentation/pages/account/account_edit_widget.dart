import 'package:get/get.dart';
import 'package:goals_web/presentation/widgets/add_document_widget/custom_button.dart';
import 'package:goals_web/presentation/widgets/add_document_widget/custom_text_field.dart';

import '../../../_imports.dart';

class AccountEditWidget extends GetView{
  const AccountEditWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return   SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50,),
          const Text("Ma'lumotlarni to'ldirish",style: AppTextStyle.categoryTitleBlackTextStyle,),
          const CustomTextFieldWidget(title:"To'liq FISh",hint: "To'liq FISh"),
          const SizedBox(height: 10,),
          const CustomTextFieldWidget(title:"Tugulgan sana",hint: "Tugulgan sana"),
          const SizedBox(height: 10,),
          const CustomTextFieldWidget(title:"Email",hint: "Email"),
          const SizedBox(height: 15,),
          CustomButton(text: "Saqlash", onPressed: (){}),
          const SizedBox(height: 25,),





        ],
      ),
    );
  }
}
