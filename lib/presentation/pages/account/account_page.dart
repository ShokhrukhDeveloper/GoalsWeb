import 'package:get/get.dart';
import 'package:goals_web/presentation/pages/account/account_info_widget.dart';
import '../../../_imports.dart';
import '../../widgets/add_document_widget/custom_button.dart';
import '../../widgets/add_document_widget/custom_text_field.dart';
import 'account_edit_widget.dart';

class AccountPage extends GetView {
  const AccountPage({super.key});

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
        child: Row(
          children: [
           Expanded(child: AccountInfoWidget()),
            VerticalDivider(color: Colors.black,width: 10,),
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
