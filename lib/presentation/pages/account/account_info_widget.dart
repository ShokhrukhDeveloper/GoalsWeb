import 'package:get/get.dart';
import 'package:goals_web/controllers/auth_controller.dart';

import '../../../_imports.dart';

class AccountInfoWidget extends GetView {
  const AccountInfoWidget({super.key});
  String role(int? re)=> switch(re) {
      0=>"SuperAdmin",
      1=>"Admin",
      3=>"Foydalanuvchi",
      _=>"Foydalanuvchi"
    };

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        
          const Icon(Icons.person,size: 100,color: AppColors.blue,),

          Text("${AuthController.userModel.value?.fullName}",style: AppTextStyle.homeMenuBlackTextStyle,),
          Container(
            width: 200,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.black)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Text("Ma'lumot")),
                Divider(),
                Text("Balans: ${AuthController.userModel.value?.balanse}"),
                SizedBox(height: 10,),
                Text("Role: ${role(AuthController.userModel.value?.role)}"),
                SizedBox(height: 10,),
                Text("Tel: ${AuthController.userModel.value?.phone}"),
                SizedBox(height: 10,),
                Text("Email:  ${AuthController.userModel.value?.email??"(yo'q)"}"),
                SizedBox(height: 10,),
                Text("Yaratilgan: ${AuthController.userModel.value?.createdAt?.substring(0,10)}"),
              ],
            ),
          )

        ],
      ),
    );
  }
}
