import '../../../_imports.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
        onPressed: onPressed,
        child: const Icon(
          Icons.add,
          color: AppColors.white,
        ));
  }
}
