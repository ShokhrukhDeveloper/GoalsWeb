import '../../../_imports.dart';

class ControlButton extends StatelessWidget {
  const ControlButton({super.key, required this.onTap, required this.icon});
  final VoidCallback onTap;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.black),
          borderRadius: BorderRadius.circular(15)
        ),
        child: Center(
          child: icon,
        ),
      ),
    );
  }
}
