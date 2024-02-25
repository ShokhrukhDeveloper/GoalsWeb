import 'package:goals_web/core/data_models/language_list.dart';

import '../../../_imports.dart';

class CustomDropDown<T> extends StatefulWidget {
  CustomDropDown(
      {super.key, this.controller, required this.hint, required this.options, required this.onChanged, });
  final TextEditingController? controller;
  final String hint;
  final List<Language> options;
  final Function(Language announceDetail) onChanged;
  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {

  Language?  selectedOption;
  @override  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(top: 20),
      width: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.hint),
          const SizedBox(height: 5,),
          DropdownButton<Language>(
            isDense: true,
            isExpanded: true,
            value:selectedOption?? widget.options.first,
            items: widget.options.map<DropdownMenuItem<Language>>((Language option) {
              return DropdownMenuItem<Language>(
                value: option,
                child: Text(option.name),
              );
            }).toList(),
            onChanged: (Language? newValue) {
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