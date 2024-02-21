import 'package:get/get.dart';

import '../../../_imports.dart';

class SearchTextWidget extends GetView {
  const SearchTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.zero
        ),
        hintText: 'Search...',
        suffixIcon: IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {

          },
        ),
      ),
    );
  }
}
