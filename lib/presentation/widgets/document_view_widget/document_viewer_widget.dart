import 'package:get/get.dart';
import 'package:goals_web/controllers/home/home_controller.dart';
import 'package:goals_web/core/data_models/document_details.dart';
import '../../../_imports.dart';

class DocumentViewerWidget extends StatefulWidget {
    DocumentViewerWidget(this.id, {super.key});
    final int id;

  @override
  State<DocumentViewerWidget> createState() => _DocumentViewerWidgetState();
}

class _DocumentViewerWidgetState extends State<DocumentViewerWidget> {
    DocumentDetails? details;

   final List ls= List.generate(10, (index) => null);

  bool isLoading=false;

   Future<void> get()async{
     setState(() {
       isLoading=true;
     });
     var result = await ApiClient.getInstance.getBookById(widget.id);
     print(result.statusCode);
     print(result.body);
     if(result.statusCode!=200)
     {
       details=DocumentDetails.fromJson(result.body);
     }
     setState(() {
       isLoading=false;
     });
   }

   @override
  void initState() {
    get();
    super.initState();
  }
   ScrollController scrollController1=ScrollController();

   @override
   Widget build(BuildContext context) {
     return  Container(
       height: MediaQuery.of(context).size.height,
       margin: const EdgeInsets.all(15),
       padding: EdgeInsets.all(15),
       decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(15),
           border: Border.all(color: AppColors.black)
       ),
       child: Column(
         children: [
           const Center(child: Text("Matematika fanlar qiroli ",
             maxLines:2,style: AppTextStyle.categoryTitleBlackTextStyle,)),
            const Divider(),
           Expanded(

             child:isLoading?
                const Center(child: CircularProgressIndicator(),)
                 : Row(
               children: [
                 Expanded(
                 flex: 2,
                   child: ListView.builder(
                     // controller: scrollController,
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
