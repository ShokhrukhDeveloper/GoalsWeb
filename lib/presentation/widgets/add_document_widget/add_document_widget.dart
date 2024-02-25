import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:goals_web/controllers/home/home_controller.dart';
import 'package:goals_web/core/api_client/api_urls.dart';
import 'package:goals_web/presentation/widgets/add_document_widget/custom_drop_down.dart';
import '../../../_imports.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';
import 'package:http/http.dart' as http;

class AddDocumentWidget extends StatefulWidget {
  const AddDocumentWidget({super.key, required this.subjectId});

  final int subjectId;
  @override
  State<AddDocumentWidget> createState() => _AddDocumentWidgetState();
}

class _AddDocumentWidgetState extends State<AddDocumentWidget> {
  PlatformFile? _file;
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController screenshotController = TextEditingController();
  int? languageId;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'doc',
        'docx',
      ],
      allowMultiple: false,
      withData: false,
      withReadStream: true,
    );

    if (result != null) {
      setState(() {
        _file = result.files.first;
      });
    }
  }

  Future<void> _sendData(
      {required PlatformFile file, required Map<String, String> body}) async {
    setState(() {});
    try {
      var request =
          http.MultipartRequest('POST', Uri.parse(ApiUrls.uploadDocument));
      request.fields.addAll(body);
      final fileReadStream = _file?.readStream;
      if (fileReadStream == null) {
        throw Exception('Cannot read file from null stream');
      }
      final stream = http.ByteStream(fileReadStream);
      request.files.add(http.MultipartFile('file', stream, _file!.size,
          filename: _file!.name));
      final response = await request.send();
      debugPrint(response.statusCode.toString());
      debugPrint(response.reasonPhrase);
      if (response.statusCode == 200) {
      } else {}
      setState(() {});
    } catch (e) {}
  }

  bool loading = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctr) {
      return Container(
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: AppColors.black)),
        child: loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    const Center(
                        child: Text(
                      "Hujjat qo'shish",
                      maxLines: 2,
                      style: AppTextStyle.categoryTitleBlackTextStyle,
                    )),
                    const Divider(),
                    InkWell(
                      onTap: _pickFile,
                      child: CustomTextFieldWidget(
                        title: 'Faylni tanlang',
                        hint: '${_file?.name ?? "Faylni tanlang"}',
                        enabled: false,
                      ),
                    ),
                    CustomTextFieldWidget(
                      title: 'Hujjat nomi',
                      hint: 'Hujjat nomi',
                      controller: nameController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFieldWidget(
                      title: 'Hujjat haqida',
                      hint: '',
                      borderRadius: 5,
                      maxLines: 5,
                      controller: descriptionController,
                      contentPadding: EdgeInsets.all(10),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (ctr.languageList?.language != null)
                      CustomDropDown(
                          hint: "Tilni tanlang",
                          options: ctr.languageList?.language ?? [],
                          onChanged: (e) {
                            ctr.selectedLanguage = e;
                          }),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFieldWidget(
                      formatter: [FilteringTextInputFormatter.digitsOnly],
                      title: 'Avto screenshot soni',
                      hint: '5',
                      controller: screenshotController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFieldWidget(
                      formatter: [FilteringTextInputFormatter.digitsOnly],
                      title: 'Narxi',
                      hint: '0',
                      controller: priceController,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomButton(
                      text: 'Saqlash',
                      onPressed: () async {
                        setState(() {
                          loading = true;
                        });
                        _sendData(file: _file!, body: {
                          "subject_id": "${widget.subjectId}",
                          "name": nameController.text,
                          "description": descriptionController.text,
                          "number_of_screenshots":
                              screenshotController.text.isEmpty
                                  ? '5'
                                  : screenshotController.text,
                          "price": priceController.text,
                          "language_id": "${ctr.selectedLanguage?.id ?? 1}",
                        }).onError((error, stackTrace) {
                          setState(() {
                            loading = false;
                            Get.snackbar(
                                "Xatolik yuz berdi $error", "$stackTrace");
                          });
                        }).whenComplete(
                            () => ctr.navigatorKey.currentState?.pop());
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
      );
    });
  }
}
