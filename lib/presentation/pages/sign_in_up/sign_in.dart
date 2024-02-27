import 'package:get/get.dart';
import 'package:goals_web/controllers/auth_controller.dart';

import '../../../_imports.dart';
import '../../widgets/add_document_widget/custom_button.dart';
import '../../widgets/add_document_widget/custom_text_field.dart';

class SignInWidget extends GetView<AuthController> {
  const SignInWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Kirish",style: AppTextStyle.categoryTitleBlackTextStyle,),
        CustomTextFieldWidget(
          hint: "Telefon raqami",
          width: 300,
          controller: controller.login,
        ),
        const SizedBox(height: 10,),
        CustomTextFieldWidget(
          hint: "Parol",
          width: 300,
          controller: controller.password,
        ),
        const SizedBox(height: 10,),
        SizedBox(height:50,child: CustomButton(text: "Kirish", onPressed: controller.signIn, width: 300,))
      ],
    );
  }
}
