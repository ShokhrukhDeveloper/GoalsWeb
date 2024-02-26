import 'package:get/get.dart';
import '../../../_imports.dart';

class SubjectViewItemWidget extends GetView {
  const SubjectViewItemWidget( {required this.onTap, required this.title, this.icon, required this.downloads,super.key});
  final VoidCallback onTap;
  final String title;
  final String downloads;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 3),
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
            border: Border.symmetric(
              horizontal: BorderSide(color: AppColors.black.withOpacity(0.5)),
              vertical: BorderSide(color: AppColors.black.withOpacity(0.5),
                  width: 2),
              
            )
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.all(5),
              width: 50,
              height: 50,
              
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: AppColors.black.withOpacity(0.3))
              ),
              child: const Center(child: Icon(Icons.subject,size: 50,),),
            ),
            Flexible(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(title,
                  style: AppTextStyle.categoryTitleBlackTextStyle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  // const Icon(Icons.download_done_sharp,size: 30,),
                  Text(downloads,style: AppTextStyle.categoryMenuBlackTextStyle,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
