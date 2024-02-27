import 'package:get/get.dart';
import 'package:goals_web/_imports.dart';
import 'package:goals_web/controllers/home/home_controller.dart';
import 'package:goals_web/presentation/pages/account/account_page.dart';
import 'package:goals_web/presentation/pages/home/widgets/signup_button.dart';
import 'package:goals_web/presentation/widgets/add_category_widget/add_category_widget.dart';
import 'package:goals_web/presentation/widgets/add_document_widget/add_document_widget.dart';
import 'package:goals_web/presentation/widgets/add_subject_widget/add_subject_widget.dart';
import 'package:goals_web/presentation/widgets/document_view_widget/document_viewer_widget.dart';
import 'package:page_transition/page_transition.dart';
import '../../widgets/documents_list_view_widget/documents_list_view_widget.dart';
import '../../widgets/home_menu_widget/home_menu_widget.dart';
import '../../widgets/last_added_document/last_added_document_widget.dart';
import '../../widgets/subject_list_view_widget/subject_view_widget.dart';

class HomePage extends GetView<HomeController> {
   HomePage({super.key});
   final navigatorKey = GlobalKey<NavigatorState>();
   @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctr) {
      ctr.navigatorKey=navigatorKey;
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
          actions: const [SignUpButton()],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("assets/bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: double.infinity,
                decoration:
                BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    border: Border.all(color: AppColors.black)),
                width: 200,
                child: const SingleChildScrollView(child: HomeMenu()),
              ),
              Expanded(
                child: Navigator(

                     key: navigatorKey,
                     initialRoute: Routes.sigIn,
                     onGenerateRoute: (setting ) {
                       late Widget page ;
                       if(setting.name==Routes.documentView)
                       {
                         int? id = setting.arguments as int;
                         page = DocumentViewerWidget(id);
                       } else
                         if(setting.name==Routes.addDocument)
                       {
                         int id = setting.arguments as int;
                         page =  AddDocumentWidget(subjectId: id);
                       } else if(setting.name==Routes.addCategory)
                       {
                         page = AddCategoryWidget();
                       }
                       else if(setting.name==Routes.addSubject){
                           int? id = setting.arguments as int;
                           page = AddSubjectWidget(categoryId: id);
                         }
                       else if(setting.name==Routes.subjectView){
                           // int? id =  setting.arguments as int;
                           page =  const SubjectListViewWidget();
                         }
                       else if(setting.name==Routes.subjectItemView){
                           int? id =  setting.arguments as int;
                           page =  DocumentsListViewWidget(id);
                         }
                       else{
                         page = const LastAddedListViewWidget();
                       }
                       return PageTransition(
                           type: PageTransitionType.fade,
                           duration: const Duration(seconds: 1),
                           // childCurrent: CircularProgressIndicator(),
                           // alignment: Alignment.topCenter,
                           curve: Curves.linear,
                           child:Scaffold(
                             backgroundColor: Colors.transparent,
                           body:Align(
                             alignment: Alignment.topCenter,
                             child:  LayoutBuilder(
                                       builder: (context, constraints) {
                                     if (constraints.maxWidth > 900) {
                                       // Wide screen layout
                                       return Container(
                                         height: MediaQuery.of(context).size.height,
                                         color: Colors.white,
                                         width: 900,
                                         child: page,
                                       );
                                     } else {
                                       // Regular screen layout
                                       return page;
                                     }
                                   }),
                             ),
                           ));
                     })
              ),
            ],
          ),
        ),
      );
    });
  }
}
