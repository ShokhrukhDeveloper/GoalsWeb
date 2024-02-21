import 'package:get/get.dart';
import 'package:goals_web/presentation/widgets/pagenation_control_widget/control_button.dart';
import '../../../_imports.dart';

class PagenationControlWidget extends GetView {
  PagenationControlWidget({super.key});
  int current=1;
  int max=10;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 50,bottom: 10),
      height: 50,
      decoration: const BoxDecoration(

      ),
      child: Column(
        children: [
          Text("Sahifalar soni: $max"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ControlButton(onTap: (){}, icon: const Icon(Icons.arrow_back)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Text("$current",style: AppTextStyle.homeMenuBlackTextStyle,),
            ),
            ControlButton(onTap: (){}, icon: const Icon(Icons.arrow_forward)),

          ],
          ),
        ],
      ),
    );
  }
}
