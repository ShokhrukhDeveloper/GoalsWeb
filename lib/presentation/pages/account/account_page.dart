import 'package:get/get.dart';
import 'package:goals_web/controllers/auth_controller.dart';
import 'package:goals_web/core/storage/local_storage.dart';
import 'package:goals_web/presentation/pages/account/account_info_widget.dart';
import '../../../_imports.dart';
import '../../widgets/add_document_widget/custom_button.dart';
import '../../widgets/add_document_widget/custom_text_field.dart';
import 'account_edit_widget.dart';

class AccountPage extends GetView {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 28.0),
            child: IconButton(onPressed: (){
              AuthController.userModel.value=null;
              LocalStorage.logout();
              Get.back();
            }, icon: const Icon(Icons.logout,size: 30,)),
          )],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: AppColors.black)),
        child: const Row(

          children: [
           Expanded(child: AccountInfoWidget()),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: VerticalDivider(),
            ),
            Expanded(child: AccountEditWidget()),
      
      
            // CustomButton(
            //   text: 'Saqlash',
            //   onPressed: () {},
            // ),
            // const SizedBox(
            //   height: 10,
            // ),
          ],
        ),
      ),
    );
  }
}
