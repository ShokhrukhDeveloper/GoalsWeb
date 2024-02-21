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
      margin: EdgeInsets.only(left: 50,bottom: 10),
      height: 50,
      decoration: BoxDecoration(

      ),
      child: Row(
      children: [
      Text("Sahifalar soni $max"),
        const SizedBox(width: 100,),
        ControlButton(onTap: (){}, icon: Icon(Icons.arrow_back)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Text("$current",style: AppTextStyle.homeMenuBlackTextStyle,),
        ),
        ControlButton(onTap: (){}, icon: Icon(Icons.arrow_forward)),

      ],
      ),
    );
  }
}
