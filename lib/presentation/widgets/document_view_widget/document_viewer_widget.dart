import 'package:get/get.dart';
import 'package:goals_web/controllers/home/home_controller.dart';
import 'package:goals_web/core/api_client/api_urls.dart';
import 'package:goals_web/core/data_models/document_details.dart';
import '../../../_imports.dart';

class DocumentViewerWidget extends StatefulWidget {
  const DocumentViewerWidget(this.id, {super.key});
  final int id;

  @override
  State<DocumentViewerWidget> createState() => _DocumentViewerWidgetState();
}

class _DocumentViewerWidgetState extends State<DocumentViewerWidget> {
  DocumentDetails? details;

  final List<int?> ls = List.generate(10, (index) => null);

  bool isLoading = false;

  Future<void> get() async {
    setState(() {
      isLoading = true;
    });
    var result = await ApiClient.getInstance.getBookDetailsById(widget.id);
    print(result.statusCode);
    print(result.body);
    if (result.statusCode == 200) {
      details = DocumentDetails.fromJson(result.body);
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    get();
    super.initState();
  }

  ScrollController scrollController1 = ScrollController();

  @override
  Widget build(BuildContext context) {
    Get.put<HomeController>(HomeController());
    return Container(
      height: MediaQuery.of(context).size.height,
      margin: const EdgeInsets.all(15),
      // padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(15),
          // border: Border.all(color: AppColors.black)
      ),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Get.put<HomeController>(HomeController()).navigatorKey.currentState?.pop();
                  },
                  icon: const Icon(Icons.arrow_back)),
              Center(
                  child: Text(
                "${details?.name}",
                maxLines: 2,
                style: AppTextStyle.categoryTitleBlackTextStyle,
              )),
            ],
          ),
          const Divider(),
          Expanded(
            child: isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Row(
                    children: [

                      Expanded(
                        flex: 2,
                        child: Container(
                            color: AppColors.black.withOpacity(0.3),
                            child: ListView.builder(
                                itemCount: details?.images.length ?? 0,
                                itemBuilder: (c, i) => InkWell(
                                      onTap: () {
                                        var position = scrollController1
                                                .position.maxScrollExtent *
                                            (i) /
                                            (details!.images.length - 1);
                                        scrollController1.animateTo(position,
                                            duration:
                                                const Duration(seconds: 1),
                                            curve: Curves.easeOutCirc);
                                      },
                                      child: AspectRatio(
                                          aspectRatio: 2480 / 3508,
                                          child: Container(
                                              margin: const EdgeInsets.all(5),
                                              child: Image(
                                                image: NetworkImage(
                                                    "${ApiUrls.imageUrl}/${details?.images[i].url}"),
                                                fit: BoxFit.fitWidth,
                                              ))),
                                    ))),
                      ),
                      const VerticalDivider(),
                      Expanded(
                        flex: 7,
                        child: Container(
                          color: AppColors.black.withOpacity(0.3),
                          child: ListView.builder(
                              controller: scrollController1,
                              itemCount: details?.images.length ?? 0,
                              itemBuilder: (c, i) => AspectRatio(
                                  aspectRatio: 2480 / 3508,
                                  child: Container(
                                      margin: const EdgeInsets.all(5),
                                      child: Image(
                                        image: NetworkImage(
                                            "${ApiUrls.imageUrl}/${details?.images[i].url}"),
                                        fit: BoxFit.fitWidth,
                                      )))),
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
