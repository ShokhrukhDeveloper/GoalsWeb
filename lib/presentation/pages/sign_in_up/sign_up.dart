import '../../../_imports.dart';
import '../../widgets/add_document_widget/custom_button.dart';
import '../../widgets/add_document_widget/custom_text_field.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Ro'yhatdan o'tish",style: AppTextStyle.categoryTitleBlackTextStyle,),
        CustomTextFieldWidget(hint: "Login",width: 300,),
        SizedBox(height: 10,),
        CustomTextFieldWidget(hint: "Parol o'yab toping",width: 300,),
        SizedBox(height: 10,),
        CustomTextFieldWidget(hint: "Parolni qayta kriting ",width: 300,),
        SizedBox(height: 10,),
        CustomButton(text: "Ro'yhatdan o'tish", onPressed: (){}, width: 300,)
      ],
    );
  }
}
