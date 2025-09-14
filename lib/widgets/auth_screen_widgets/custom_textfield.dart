import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatefulWidget {
  final String? title;
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final ValueChanged<String>? onChanged;
  final String? errorText;
  final FormFieldValidator<String>? validator; // <- new
  final double width;
  final double height;
  final TextInputAction textInputAction;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.title,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.errorText,
    this.validator,
    this.width = 400,
    this.height = 50,
    this.textInputAction = TextInputAction.next,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null) ...[
            Text(
              widget.title!,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: const Color(0xff221F1F),
              ),
            ),
            const SizedBox(height: 15),
          ],
          SizedBox(
            width: widget.width,
            height: widget.height,
            child: TextFormField(
              controller: widget.controller,
              keyboardType: widget.keyboardType,
              obscureText: _obscureText,
              textInputAction: widget.textInputAction,
              onChanged: widget.onChanged,
              validator: widget.validator, // <- use validator here
              autocorrect: !widget.obscureText,
              enableSuggestions: !widget.obscureText,
              decoration: InputDecoration(
                prefixIcon: widget.prefixIcon,
                suffixIcon: widget.obscureText
                    ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: const Color(0xff434343),
                  ),
                  onPressed: _toggleVisibility,
                )
                    : widget.suffixIcon,
                filled: true,
                fillColor: const Color(0xffFFFFFF),
                hintText: widget.hintText,
                hintStyle: GoogleFonts.mulish(
                  color: const Color(0xff505050),
                  fontWeight: FontWeight.bold,
                ),
                errorText: widget.errorText,
                isDense: true,
                contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xff505050), width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xff505050), width: 1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
