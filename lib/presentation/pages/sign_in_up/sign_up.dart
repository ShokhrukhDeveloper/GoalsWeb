import 'package:get/get.dart';
import 'package:goals_web/controllers/auth_controller.dart';

import '../../../_imports.dart';
import '../../widgets/add_document_widget/custom_button.dart';
import '../../widgets/add_document_widget/custom_text_field.dart';

class SignUpWidget extends GetView<AuthController> {
  const SignUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Ro'yhatdan o'tish",style: AppTextStyle.categoryTitleBlackTextStyle,),
         CustomTextFieldWidget(hint: "Login",width: 300,
           controller: controller.login,
         ),
        const SizedBox(height: 10,),
         CustomTextFieldWidget(hint: "Parol o'yab toping",width: 300,
           controller: controller.password,
         ),
        const SizedBox(height: 10,),
        CustomTextFieldWidget(hint: "Parolni qayta kriting ",width: 300,
          controller: controller.passwordAgain,
        ),
        const SizedBox(height: 10,),
        CustomButton(text: "Ro'yhatdan o'tish", onPressed: controller.signUp, width: 300,)
      ],
    );
  }
}
