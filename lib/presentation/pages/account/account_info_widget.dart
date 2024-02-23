import 'package:get/get.dart';

import '../../../_imports.dart';

class AccountInfoWidget extends GetView {
  const AccountInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 50,),
          Icon(Icons.person,size: 100,color: AppColors.blue,),

          const Text("New User",style: AppTextStyle.homeMenuBlackTextStyle,),
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
                Text("Jinsi: Erkak"),
                SizedBox(height: 10,),
                Text("Tel: +998997531097"),
                SizedBox(height: 10,),
                Text("Jinsi: Erkak"),
                SizedBox(height: 10,),
                Text("Tel: +998997531097"),
              ],
            ),
          )

        ],
      ),
    );
  }
}
