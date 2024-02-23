import '../../../_imports.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.backgroundColor, this.overlayColor, required this.text, required this.onPressed, this.textColor, this.width});
  final Color? backgroundColor;
  final Color? overlayColor;
  final String text;
  final VoidCallback onPressed;
  final Color? textColor;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(

          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(backgroundColor??AppColors.black),
            overlayColor: MaterialStatePropertyAll<Color>(overlayColor??AppColors.blue)
          ),
          child:  Text(text,style: TextStyle(color:textColor?? AppColors.white),),
      ),
    );
  }
}
