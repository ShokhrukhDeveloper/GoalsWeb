import 'package:goals_web/presentation/pages/sign_in_up/sign_in.dart';
import 'package:goals_web/presentation/pages/sign_in_up/sign_up.dart';
import 'package:goals_web/presentation/widgets/add_document_widget/custom_button.dart';
import 'package:goals_web/presentation/widgets/add_document_widget/custom_text_field.dart';

import '../../../_imports.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool singIn=true;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        actions: [
         singIn? CustomButton(text: "Ro'yhatdan o'tish", onPressed: (){
            singIn=false;
            setState(() {

            });
          },width: 160,):
          CustomButton(text: "Kirish", onPressed: (){
            singIn=true;
            setState(() {

            });
          },width: 160,),
          SizedBox(width: 20,)
        ],
      ),
      body: Center(
        child: singIn?const SignInWidget():const SignUpWidget(),
      ),
    );
  }
}
