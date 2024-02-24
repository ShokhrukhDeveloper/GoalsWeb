import 'package:get/get.dart';
import 'package:goals_web/_imports.dart';
import 'package:goals_web/controllers/home/home_controller.dart';
import 'package:goals_web/presentation/pages/account/account_page.dart';
import 'package:goals_web/presentation/pages/home/widgets/signup_button.dart';
import 'package:goals_web/presentation/widgets/add_category_widget/add_category_widget.dart';
import 'package:goals_web/presentation/widgets/add_document_widget/add_document_widget.dart';
import 'package:goals_web/presentation/widgets/document_view_widget/document_viewer_widget.dart';
import '../../widgets/category_menu_widget/category_menu_widget.dart';
import '../../widgets/category_view_widget/category_view_widget.dart';
import '../../widgets/home_menu_widget/home_menu_widget.dart';

class HomePage extends GetView<HomeController> {
   HomePage({super.key});
   final navigatorKey = GlobalKey<NavigatorState>();
   @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctr) {
      ctr.navigatorKey=navigatorKey;
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white.withOpacity(0.2),
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
          actions: const [SignUpButton()],
        ),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: double.infinity,
              decoration:
                  BoxDecoration(border: Border.all(color: AppColors.black)),
              width: 200,
              child: const SingleChildScrollView(child: HomeMenu()),
            ),
            if(false) const Expanded(child: AccountPage()),
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CategoryMenuWidget(),
                     Expanded(
                       child: Navigator(
                            key: navigatorKey,
                            initialRoute: Routes.addCategory,
                            onGenerateRoute: (setting ) {

                              late Widget page ;
                              if(setting.name==Routes.addDocument)
                              {
                                int? id = setting.arguments as int;
                                page= DocumentViewerWidget();
                              } else if(setting.name==Routes.addDocument)
                              {
                                int? id = setting.arguments as int;
                                page= const AddDocumentWidget();
                              } else if(setting.name==Routes.addCategory)
                              {
                                page= AddCategoryWidget();
                              }
                              else if(setting.name==Routes.subjectView){
                                  int? id = setting.arguments as int;
                                  page=const CategoryViewWidget();
                                }
                              else{
                                page=const SizedBox();
                              }


                              return MaterialPageRoute(
                                  builder: (c) => Center(
                                    child: LayoutBuilder(
                                            builder: (context, constraints) {
                                          if (constraints.maxWidth > 800) {
                                            // Wide screen layout
                                            return SizedBox(
                                              width: 800,
                                              child: page,
                                            );
                                          } else {
                                            // Regular screen layout
                                            return page;
                                          }
                                        }),
                                  ));
                            }),
                     ),


                  ],
                )),
          ],
        ),
      );
    });
  }
}
