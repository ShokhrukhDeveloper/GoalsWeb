import 'package:get/get.dart';

import '../../../_imports.dart';

class DocumentViewerWidget extends StatelessWidget {
    DocumentViewerWidget({super.key});
   final List ls= List.generate(10, (index) => null);
   ScrollController scrollController=ScrollController();
   ScrollController scrollController1=ScrollController();
   @override
   Widget build(BuildContext context) {
     return  Container(
       height: MediaQuery.of(context).size.height,
       margin: EdgeInsets.all(15),
       padding: EdgeInsets.all(15),
       decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(15),
           border: Border.all(color: AppColors.black)
       ),
       child: Column(
         children: [
           Center(child: Text("Matematika fanlar qiroli ",

             maxLines:2,style: AppTextStyle.categoryTitleBlackTextStyle,)),
            Divider(),
           Expanded(

             child: Row(
               children: [
                 Expanded(
                 flex: 2,
                   child: ListView.builder(
                     controller: scrollController,
                       itemCount: ls.length,
                       itemBuilder: (c,i)=>
                       InkWell(
                           onTap: (){
                             var x=scrollController1.position.maxScrollExtent*(i)/(ls.length-1);
                             scrollController1.animateTo(x, duration: const Duration(seconds: 1), curve:  Curves.easeOutCirc);
                           },
                         child: AspectRatio(
                             aspectRatio: 2480/3508,
                             child: Container(
                                 margin: EdgeInsets.all(5),
                                 child:  Image(image: NetworkImage("https://picsum.photos/480/608"),fit: BoxFit.fitWidth,))),
                       )
                   ),
                 ),
                 const VerticalDivider(),
                 Expanded(
                   flex: 7,
                   child: ListView.builder(
                       controller: scrollController1,
                       itemCount: ls.length,
                       itemBuilder: (c,i)=>
                       AspectRatio(
                           aspectRatio: 2480/3508,
                           child: Container(
                               margin: const EdgeInsets.all(5),
                               child: const Image(image: NetworkImage("https://picsum.photos/400/608"),fit: BoxFit.fitWidth,)))
                   ),
                 ),
             ],
             ),
           ),
         ],
       ),
     );
   }
 }
