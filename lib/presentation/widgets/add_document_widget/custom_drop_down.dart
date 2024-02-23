import '../../../_imports.dart';

class CustomDropDown extends StatefulWidget {
  CustomDropDown(
      {super.key, this.controller, required this.hint, required this.options, required this.onChanged, });
  final TextEditingController? controller;
  final String hint;
  final List<String> options;
  final Function(String announceDetail) onChanged;
  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {

  String?  selectedOption;
  @override  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(top: 20),
      width: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.hint),
          const SizedBox(height: 5,),
          DropdownButton<String>(
            isDense: true,
            isExpanded: true,
            value:selectedOption?? widget.options.first,
            items: widget.options.map<DropdownMenuItem<String>>((String option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(option),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {

                if(newValue!=null){
                  widget.onChanged(newValue);
                  selectedOption=newValue;
                }
              });
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}