
import 'package:goals_web/presentation/widgets/search_text_widget/search_text_widget.dart';

import '../../../_imports.dart';
import '../pagenation_control_widget/pagenation_control_widget.dart';
import 'category_view_item.dart';

class CategoryViewWidget extends StatelessWidget {
  const CategoryViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.black)
      ),
      child:  Column(
        children: [
         Padding(
           padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
           child: Row(
             children: [
               Expanded(child: Center(child: Text("Matematika",maxLines:2,style: AppTextStyle.categoryTitleBlackTextStyle,))), Expanded(child: SearchTextWidget()),
             ],
           ),
         ),
          Divider(),
          CategoryViewItemWidget(
              onTap: (){},
              title: "Algebraaik sonlar ustida amallar",
              downloads: '2'),
          CategoryViewItemWidget(
              onTap: (){},
              title: "Algebraaik sonlar ustida amallar",
              downloads: '2'),
          CategoryViewItemWidget(
              onTap: (){},
              title: "Algebraaik sonlar ustida amallar",
              downloads: '2'),
          CategoryViewItemWidget(
              onTap: (){},
              title: "Algebraaik sonlar ustida amallar",
              downloads: '2'),
          CategoryViewItemWidget(
              onTap: (){},
              title: "Algebraaik sonlar ustida amallar",
              downloads: '2'),
          CategoryViewItemWidget(
              onTap: (){},
              title: "Algebraaik sonlar ustida amallar",
              downloads: '2'),
          CategoryViewItemWidget(
              onTap: (){},
              title: "Algebraaik sonlar ustida amallar",
              downloads: '2'),
          CategoryViewItemWidget(
              onTap: (){},
              title: "Algebraaik sonlar ustida amallar",
              downloads: '2'),
          CategoryViewItemWidget(
              onTap: (){},
              title: "Algebraaik sonlar ustida amallar",
              downloads: '2'),
          CategoryViewItemWidget(
              onTap: (){},
              title: "Algebraaik sonlar ustida amallar",
              downloads: '2'),
          CategoryViewItemWidget(
              onTap: (){},
              title: "Algebraaik sonlar ustida amallar",
              downloads: '2'),
          CategoryViewItemWidget(
              onTap: (){},
              title: "Algebraaik sonlar ustida amallar",
              downloads: '2'),
          Divider(),
          PagenationControlWidget()


        ],
      ),
    );
  }
}
