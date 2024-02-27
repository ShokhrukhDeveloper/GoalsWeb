import 'package:get/get.dart';
import 'package:goals_web/core/data_models/user_model.dart';
import '../../../../_imports.dart';
import '../../../../controllers/auth_controller.dart';
class SignUpButton extends GetView {
  const SignUpButton({super.key});
  static Rx<UserModel?> userModel =null.obs;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      padding: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.black.withOpacity(0.1),
          border: Border.all(color: AppColors.black.withOpacity(0.5))),
      height: 50,
      child: Obx(
        () => Row(
          children: [
            IconButton(
                onPressed: () {
                  if( AuthController.userModel.value != null) {
                    Get.toNamed(Routes.accountInfo);
                  }else{
                    Get.toNamed(Routes.sigIn);
                  }

                },
                icon: const Icon(
                  Icons.account_circle_outlined,
                  size: 36,
                  color: AppColors.black,
                )),
            AuthController.userModel.value == null
                ? const Text(
                    "Kirish",
                    style: AppTextStyle.categoryMenuBlackTextStyle,
                  )
                : Text(
                    "${AuthController.userModel.value?.fullName}",
                    style: AppTextStyle.categoryMenuBlackTextStyle,
                  ),
          ],
        ),
      ),
    );
  }
}
