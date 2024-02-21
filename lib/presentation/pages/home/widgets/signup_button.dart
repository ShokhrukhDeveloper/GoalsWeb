import 'package:get/get.dart';

import '../../../../_imports.dart';

class SignUpButton extends GetView {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.only(right: 20),
      padding: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color:  AppColors.black.withOpacity(0.1),
        border: Border.all(color: AppColors.black.withOpacity(0.5))
      ),
      height: 50,
      child: Row(
        children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.account_circle_outlined,
                size: 36,
                color: AppColors.black,
              )),
          Text("Kirish",style: AppTextStyle.categoryMenuBlackTextStyle,),
        ],
      ),
    );
  }
}
