import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDropdown extends StatefulWidget {
  String selectedValue;
  final List<String> values;
  final List<String> labels;
  Function(String?)? onchangedF;
  CustomDropdown({
    Key? key,
    required this.selectedValue,
    required this.values,
    required this.labels,
    required this.onchangedF,
  }) : super(key: key);

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 378,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: widget.selectedValue,
          dropdownColor: Colors.white,
          elevation: 3,
          style: const TextStyle(color: Colors.black, fontSize: 10),
          onChanged: widget.onchangedF,
          items: List.generate(
            widget.values.length,
            (index) {
              return DropdownMenuItem<String>(
                value: widget.values[index],
                child: Text(
                  widget.labels[index],
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.black,
                      ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
