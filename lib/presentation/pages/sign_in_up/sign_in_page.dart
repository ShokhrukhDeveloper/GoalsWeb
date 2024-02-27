import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:goals_web/controllers/auth_controller.dart';
import 'package:goals_web/presentation/pages/sign_in_up/sign_in.dart';
import 'package:goals_web/presentation/pages/sign_in_up/sign_up.dart';
import 'package:goals_web/presentation/widgets/add_document_widget/custom_button.dart';
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
    return  GetBuilder<AuthController>(
      builder: (ctr) {
        return Scaffold(
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
              const SizedBox(width: 20,)
            ],
          ),
          body:ctr.isLoading?Center(child: CircularProgressIndicator(),): Center(
            child: singIn?const SignInWidget():const SignUpWidget(),
          ),
        );
      }
    );
  }
}
