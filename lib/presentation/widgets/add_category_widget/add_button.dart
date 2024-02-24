import '../../../_imports.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
      child: FloatingActionButton.small(
          onPressed: onPressed,
          backgroundColor: AppColors.green,
          child: const Icon(
            Icons.add,
            color: AppColors.white,
          )),
    );
  }
}
