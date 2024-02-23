import '../../../_imports.dart';
import '../../widgets/add_document_widget/custom_button.dart';
import '../../widgets/add_document_widget/custom_text_field.dart';

class SignInWidget extends StatelessWidget {
  const SignInWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Kirish",style: AppTextStyle.categoryTitleBlackTextStyle,),
        CustomTextFieldWidget(hint: "Login",width: 300,),
        SizedBox(height: 10,),
        CustomTextFieldWidget(hint: "Parol",width: 300,),
        SizedBox(height: 10,),
        CustomButton(text: "Kirish", onPressed: (){}, width: 300,)
      ],
    );
  }
}
