import 'package:easyrishta/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomtextFormfield extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType inputType;
  final String hinttext;
  final String label;

  final bool obscureText;
  final bool readOnly;
  final Color baseColor;
  final Color borderColor;
  final Color errorColor;
  final Color fillColor;
  final IconData? prefixIconData;
  final IconData? suffixIconData;
  final ValueChanged<bool>? onPrefixIconTap;

  const CustomtextFormfield({
    super.key,
    required this.inputType,
    required this.controller,
    required this.hinttext,
    required this.label,
    required this.obscureText,
    required this.readOnly,
    required this.baseColor,
    required this.borderColor,
    required this.errorColor,
    required this.fillColor,
    this.prefixIconData,
    this.suffixIconData,
    this.onPrefixIconTap,
  });

  @override
  State<CustomtextFormfield> createState() => _CustomtextFormfieldState();
}

class _CustomtextFormfieldState extends State<CustomtextFormfield> {
  late Color currentColor;
  late String errorText;
  bool obsecure = true;
  @override
  void initState() {
    super.initState();
    currentColor = widget.borderColor;
    errorText = '';
    validateInput(errorText);
    setState(() {
      obsecure = widget.obscureText;
    });
  }

  void validateInput(String input) {
    setState(() {
      errorText = input.isEmpty ? 'This field is required.' : '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: TextFormField(
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: AppColors.BlackColor, fontWeight: FontWeight.normal),
              obscureText: obsecure,
              keyboardType: widget.inputType,
              controller: widget.controller,
              onChanged: validateInput,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(top: 30, left: 10),
                focusColor: AppColors.BlackColor,
                filled: true,
                fillColor: widget.fillColor,
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: AppColors.BlackColor,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    width: 0.5,
                  ),
                ),
                hintText: widget.hinttext,
                prefixIcon: widget.prefixIconData != null
                    ? GestureDetector(
                        onTap: () {
                          if (widget.onPrefixIconTap != null) {
                            widget.onPrefixIconTap!(widget.obscureText);
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 1.0),
                          child: Icon(
                            widget.prefixIconData,
                            size: 24,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      )
                    : null,
                suffixIcon: widget.suffixIconData != null
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            setState(() {
                              if (obsecure) {
                                obsecure = false;
                              } else {
                                obsecure = true;
                              }
                            });
                          });
                        },
                        child: Icon(
                          obsecure
                              ? Icons.remove_red_eye
                              : Icons.remove_red_eye_outlined,
                          size: 22,
                          color: AppColors.actionbut,
                        ),
                      )
                    : null,
              ),
            ),
          ),
          //const SizedBox(height: 6),
          // Text(
          //   errorText,
          //   style: TextStyle(
          //     color: widget.errorColor,
          //     fontSize: 12,
          //   ),
          // ),
        ],
      ),
    );
  }
}

/////////////// ----------------------   Widget of textfield ///////////////////////////
Widget customtextfield(
  BuildContext context,
  inputtype,
  controller,
  hinttext,
  obscureText,
  prefixIconData,
  suffixIconData,
) {
  return CustomtextFormfield(
    baseColor: AppColors.whiteColor,
    borderColor: AppColors.BlackColor,
    inputType: inputtype,
    controller: controller,
    errorColor: Colors.red,
    fillColor: AppColors.whiteColor,
    hinttext: hinttext,
    // inputType: TextInputType.text,
    label: "First Name",
    obscureText: obscureText,
    readOnly: false,
    onPrefixIconTap: (value) {},
    prefixIconData: prefixIconData,
    suffixIconData: suffixIconData,
  );
}

//////////// -----------------  Widget of texfield in container -------------- //////////////
Widget textfield(BuildContext context, controller, hinttext) {
  return Container(
      width: 378.w,
      height: 78.h,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: AppColors.BlackColor,
          width: 0.5.w,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hinttext,
              hintStyle: const TextStyle(color: AppColors.BlackColor),
              labelStyle: const TextStyle(color: AppColors.BlackColor)),
        ),
      ));
}
