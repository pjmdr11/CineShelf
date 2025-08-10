import 'package:cine_shelf/core/extensions/responsive_util.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextInput extends StatefulWidget {
  final String? label;
  final String? hint;
  final String? value;
  final String id;
  final Map? errorMap;
  final String? initialvalue;
  final int? maxLines;
  final bool? row;
  final bool? readOnly;
  final bool? autoFocus;
  final bool? required;
  final int? maxLength;
  final TextInputType? inputType;
  final bool? isDense;
  final FormFieldValidator<String?>? inputValidator;
  final TextInputAction? inputAction;
  final TextStyle? errorStyle, textStyle, hintStyle, labelStyle;
  final InputBorder? labelBorder, errorBorder, disabledBorder, focusedBorder;
  final Widget? primaryIcon, trailingIcon;
  final TextEditingController? controller;
  final Function(String id, String value)? onValueChanged;
  final Color? backgroundColor;

  const CustomTextInput({
    super.key,
    this.label,
    this.hint,
    required this.id,
    this.primaryIcon,
    this.trailingIcon,
    this.inputAction,
    this.isDense,
    this.autoFocus,
    this.readOnly,
    this.value,
    this.errorMap,
    this.initialvalue,
    this.inputType,
    this.row,
    this.maxLines,
    this.maxLength,
    this.errorStyle,
    this.textStyle,
    this.hintStyle,
    this.labelStyle,
    this.labelBorder,
    this.errorBorder,
    this.disabledBorder,
    this.focusedBorder,
    this.controller,
    this.onValueChanged,
    this.backgroundColor,
    this.inputValidator,
    this.required,
  });

  @override
  State<CustomTextInput> createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  late final TextEditingController _controller;
  late final InputBorder _inputBorder;
  bool _obscureValue = true;

  @override
  void initState() {
    super.initState();
    _controller =
        widget.controller ??
        TextEditingController(text: widget.initialvalue ?? '');
    _inputBorder =
        widget.focusedBorder ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide(color: Colors.white),
        );
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [labelWidget(), _textFormWidget()],
    );
  }

  Widget labelWidget() {
    if (widget.label?.isEmpty ?? true) {
      return Container();
    } else {
      return Padding(
        padding: const EdgeInsets.only(bottom: 12, left: 8),
        child: Text(
          widget.label ?? "",
          style:
              widget.labelStyle ??
              Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Colors.white,
                fontSize: 14.rf(),
              ),
        ),
      );
    }
  }

  Widget? _getSuffixIcon() {
    if (widget.inputType == TextInputType.visiblePassword) {
      var icon = _obscureValue ? Icons.visibility_off : Icons.visibility;
      return InkWell(
        onTap: () {
          setState(() {
            _obscureValue = !_obscureValue;
          });
        },
        child: Icon(icon, color: Theme.of(context).iconTheme.color, size: 18),
      );
    } else {
      return widget.trailingIcon;
    }
  }

  // FormFieldValidator<String>? _getInputValidator(String value) {
  //   if (widget.inputValidator != null) {
  //     return widget.inputValidator;
  //   }
  //   return null;
  // }
  String? _getInputValidator(String? value) {
    if (widget.inputValidator != null) {
      return widget.inputValidator?.call(value);
    } else if (widget.required == true) {
      if (value?.isEmpty == true) {
        return "error.text_field_required".tr(
          namedArgs: {'field_label': widget.label ?? ""},
        );
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  Widget _textFormWidget() {
    return TextFormField(
      controller: _controller,
      readOnly: widget.readOnly ?? false,
      autofocus: widget.autoFocus ?? false,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines ?? 1,
      validator: _getInputValidator,
      keyboardType: widget.inputType ?? TextInputType.text,
      cursorWidth: 1.0,
      obscureText: widget.inputType == TextInputType.visiblePassword
          ? _obscureValue
          : false,
      textInputAction: widget.inputAction ?? TextInputAction.done,
      style: widget.textStyle ?? Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        isDense: widget.isDense ?? false,
        hintText: widget.hint ?? "",
        suffix: _getSuffixIcon(),
        hintStyle:
            widget.hintStyle ??
            Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(
                context,
              ).textTheme.bodyMedium?.color?.withAlpha(200),
              fontSize: 12.rf(),
            ),
        errorStyle:
            widget.errorStyle ??
            Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.red.shade300,
              fontSize: 9.rf(),
            ),
        filled: true,
        fillColor: widget.backgroundColor ?? Colors.transparent,
        prefixIcon: widget.primaryIcon,
        suffixIcon: widget.trailingIcon,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 12.r),
        counter: null,
        hintFadeDuration: Duration(milliseconds: 500),
        border: _inputBorder,
        disabledBorder: _inputBorder,
        errorBorder:
            widget.errorBorder ??
            _inputBorder.copyWith(
              borderSide: BorderSide(color: Colors.red.shade600),
            ),
        enabledBorder: widget.disabledBorder ?? _inputBorder,
        focusedBorder: widget.focusedBorder ?? _inputBorder,
      ),
      onChanged: (String value) {
        widget.onValueChanged?.call(widget.id, value);
      },
    );
  }
}
