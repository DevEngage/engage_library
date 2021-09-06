import 'dart:io';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:file_picker_cross/file_picker_cross.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:engage_library/constants/constants.dart';
// import 'package:games_revealed/theme.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
// import 'package:smart_select/smart_select.dart';

/* 
  TODO:
  [ ] toggle for bool val
  [ ] 
 */

class EngageInput<T> extends StatefulWidget {
  final EdgeInsets margin;
  final String hintText;
  final String labelText;
  final String helperText;
  final String type;
  final dynamic initialValue;
  final String? error;
  final TextInputType inputType;
  final TextInputAction inputAction;
  // final FileType fileType;
  final bool autofocus;
  final bool correct;
  final bool readOnly;
  final bool isDarkBackground;
  final bool noBottom;
  final int? maxLines;
  final DateFormat? dateFormat;
  final FocusNode? node;
  final Widget? smartLeading;
  final MaskTextInputFormatter? mask;
  final T? collection;
  final List<Map<String, String>>? items;
  // final List<SmartSelectOption<String>> smartOptions;
  final ValueChanged<dynamic>? onChanged;
  final ValueChanged<dynamic>? onSubmitted;
  final TextEditingController? controller;

  const EngageInput({
    Key? key,
    this.margin = const EdgeInsets.only(bottom: 10),
    this.hintText = '',
    this.labelText = '',
    this.helperText = '',
    this.error,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.done,
    // this.fileType = FileType.any,
    this.type = 'text',
    this.initialValue,
    this.autofocus = false,
    this.correct = false,
    this.readOnly = false,
    this.isDarkBackground = true,
    this.noBottom = false,
    this.maxLines,
    this.dateFormat,
    this.smartLeading,
    this.mask,
    this.collection,
    this.items,
    // this.smartOptions,
    this.node,
    this.onChanged,
    this.onSubmitted,
    this.controller,
  }) : super(key: key);

  @override
  EngageInputState createState() => EngageInputState<T>();
}

class EngageInputState<T> extends State<EngageInput> {
  bool obscureText = false;
  bool _focused = false;
  FocusNode? _node;
  MaskTextInputFormatter? maskFormatter;
  WhitelistingTextInputFormatter? numberFormatter;
  // List<SmartSelectOption<String>> _smartOptions = [];
  bool isLoading = true;
  dynamic _value;
  late TextInputType inputType;
  TextEditingController? _controller;

  EngageInputState();

  @override
  void initState() {
    super.initState();
    inputType = widget.inputType;
    if (widget.type == 'password') {
      obscureText = true;
    } else if (widget.type == 'phone') {
      maskFormatter = MaskTextInputFormatter(
          mask: '+# (###) ###-###-####', filter: {"#": RegExp(r'[0-9]')});
    } else if (widget.type == 'number') {
      numberFormatter = WhitelistingTextInputFormatter.digitsOnly;
      inputType = TextInputType.number;
    }
    if (widget.mask != null) {
      maskFormatter = widget.mask!;
    }
    _node = widget.node ?? FocusNode();
    _node?.addListener(_handleFocusChange);
    // dateValue = widget.initialValue;
    if (widget.collection != null) {
      loadList();
    } else {
      // _smartOptions = widget.smartOptions;
      setState(() {
        isLoading = false;
      });
    }

    _controller = widget.controller; // ?? TextEditingController();

    _value = widget.initialValue;
  }

  loadList() async {
    // setState(() {
    //   if (response.success) {
    //     _smartOptions = getSmartCategories(response.results ?? []);
    //   } else {
    //     _smartOptions = getSmartCategories([]);
    //   }
    //   isLoading = false;
    // });
  }

  void _handleFocusChange() {
    if (_node?.hasFocus != _focused) {
      setState(() {
        _focused = _node!.hasFocus;
      });
    }
  }

  @override
  void dispose() {
    _node?.removeListener(_handleFocusChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(margin: widget.margin, child: getInputType(widget.type));
  }

  getSmartCategories(list) {
    // return SmartSelectOption.listFrom<String, dynamic>(
    //     source: list,
    //     value: (val, dynamic game) => game.objectId,
    //     title: (val, dynamic game) => game.name);
  }

  getInputType(String type) {
    switch (type) {
      case 'smartsingle':
        return smartsingle();
      case 'smartmulti':
        return smartmulti();
      case 'date':
        return dateInput();
      case 'file':
        return fileInput();
      case 'image':
        return imageInput();
      case 'youtube':
        return youtubeInput();
      case 'checkbox':
        return checkboxInput();
      case 'list':
        return listInput();
      default:
        return textInput();
    }
  }

  textInput() {
    var style = widget.isDarkBackground
        ? TextStyle(
            color: AppThemes.figmaWhite,
          )
        : TextStyle(
            color: AppThemes.figmaBlackDark,
          );
    if (_controller == null)
      return TextFormField(
          focusNode: _node,
          maxLines: widget.maxLines,
          keyboardType: inputType,
          textInputAction: widget.inputAction,
          obscureText: obscureText,
          onChanged: (String value) => handleChanged(value),
          autofocus: widget.autofocus,
          initialValue: _value,
          onFieldSubmitted: widget.onSubmitted,
          inputFormatters: getMask(),
          cursorColor: AppThemes.colorOrange,
          style: style,
          decoration: getInputDecoration());
    else
      return TextFormField(
          focusNode: _node,
          maxLines: widget.maxLines,
          keyboardType: inputType,
          textInputAction: widget.inputAction,
          obscureText: obscureText,
          onChanged: (String value) => handleChanged(value),
          autofocus: widget.autofocus,
          initialValue: _value,
          onFieldSubmitted: widget.onSubmitted,
          inputFormatters: getMask(),
          cursorColor: AppThemes.colorOrange,
          controller: _controller,
          style: style,
          decoration: getInputDecoration());
  }

  checkboxInput() {
    // return Row(
    //   children: <Widget>[
    //     Text('test'),
    //   ],
    // );

    return decorationBox(
        size: 60.0,
        padding: null,
        child: CheckboxListTile(
          title: Text(widget.labelText,
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20)),
          onChanged: (value) => handleChanged(value),
          value: _value,
        ));
  }

  // dateInput() {
  //   return TextFormField(
  //       focusNode: _node,
  //       maxLines: widget.maxLines,
  //       keyboardType: widget.inputType,
  //       textInputAction: widget.inputAction,
  //       obscureText: obscureText,
  //       onChanged: (String value) {
  //         // widget.dateFormat ?? DateFormat("MMM d, yyyy hh:mm a");
  //         handleChanged(value);
  //       },
  //       autofocus: widget.autofocus,
  //       initialValue: widget.initialValue,
  //       onFieldSubmitted: widget.onSubmitted,
  //       onTap: () async {
  //         final date = await showDatePicker(
  //             context: context,
  //             firstDate: DateTime(1900),
  //             initialDate: widget.initialValue ?? DateTime.now(),
  //             lastDate: DateTime(2100));
  //         if (date != null) {
  //           final time = await showTimePicker(
  //             context: context,
  //             initialTime:
  //                 TimeOfDay.fromDateTime(widget.initialValue ?? DateTime.now()),
  //           );
  //           handleChanged(DateTimeField.combine(date, time));
  //         } else {
  //           handleChanged(widget.initialValue);
  //         }
  //       },
  //       decoration: getInputDecoration());
  // }

  dateInput() {
    return DateTimeField(
        focusNode: _node,
        maxLines: widget.maxLines ?? 1,
        keyboardType: widget.inputType,
        textInputAction: widget.inputAction,
        obscureText: obscureText,
        format: widget.dateFormat ?? DateFormat("MMM d, yyyy hh:mm a"),
        onChanged: (DateTime? value) => handleChanged(value),
        autofocus: widget.autofocus,
        initialValue: _value,
        onShowPicker: (context, currentValue) async {
          final date = await showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
          if (date != null) {
            final time = await showTimePicker(
              context: context,
              initialTime:
                  TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
            );
            return DateTimeField.combine(date, time);
          } else {
            return currentValue;
          }
        },
        // onFieldSubmitted: widget.onSubmitted,
        decoration: getInputDecoration());
  }

  smartsingle() {
    return decorationBox(
      size: 60,
      padding: null,
      // child: SmartSelect<String>.single(
      //     enabled: !widget.readOnly,
      //     isLoading: isLoading,
      //     leading: widget.collection != null &&
      //             widget.collection.getForm != null &&
      //             widget.readOnly == false
      //         ? IconButton(
      //             icon: Icon(Icons.add),
      //             onPressed: goToQuickAdd,
      //           )
      //         : widget.smartLeading,
      //     title: widget.labelText,
      //     value: _value,
      //     options: _smartOptions,
      //     choiceType: SmartSelectChoiceType.chips,
      //     modalType: SmartSelectModalType.bottomSheet,
      //     onChange: (val) => handleChanged(val)),
    );
  }

  smartmulti() {
    return decorationBox(
      size: 70,
      padding: null,
      // child: SmartSelect<String>.multiple(
      //     enabled: !widget.readOnly,
      //     isLoading: isLoading,
      //     isTwoLine: true,
      //     leading: widget.collection != null &&
      //             widget.collection.getForm != null &&
      //             widget.readOnly == false
      //         ? IconButton(
      //             icon: Icon(Icons.add),
      //             onPressed: goToQuickAdd,
      //           )
      //         : widget.smartLeading,
      //     title: widget.labelText,
      //     value: _value,
      //     options: _smartOptions,
      //     choiceType: SmartSelectChoiceType.chips,
      //     modalType: SmartSelectModalType.bottomSheet,
      //     onChange: (val) => handleChanged(val)),
    );
  }

  imageInput() {
    return decorationBox(
      padding: const EdgeInsets.only(left: 10, right: 4, bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(widget.labelText,
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20)),
          // if (_value is ParseFile)
          //   GestureDetector(
          //       onTap: () async {
          //         // FilePickerCross picker =
          //         //     FilePickerCross(type: FileTypeCross.image);
          //         // await picker.pick();
          //         // File file = File.fromRawPath(picker.toUint8List());
          //         // handleChanged(file);
          //       },
          //       child: Container(
          //           padding: const EdgeInsets.symmetric(vertical: 16),
          //           child: Image.network(_value.url)))
          // else
          //   FlatButton(
          //     child: Text('Upload Image'),
          //     onPressed: () async {
          //       // FilePickerCross picker =
          //       //     FilePickerCross(type: FileTypeCross.image);
          //       // await picker.pick();
          //       // File file = File.fromRawPath(picker.toUint8List());
          //       // handleChanged(file);
          //     },
          //   ),
        ],
      ),
    );
  }

  fileInput() {
    return decorationBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(widget.labelText,
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20)),
          // if (_value is ParseFile)
          //   GestureDetector(
          //     onTap: () async {
          //       // FilePickerCross picker = FilePickerCross(type: widget.fileType);
          //       // await picker.pick();
          //       // File file = File.fromRawPath(picker.toUint8List());
          //       // handleChanged(file);
          //     },
          //     child: Text(_value.url),
          //   )
          // // child: Container(
          // //     padding: const EdgeInsets.symmetric(vertical: 16),
          // //     child: Image.network(_value.url)))
          // else
          //   FlatButton(
          //     child: Text('Upload File'),
          //     onPressed: () async {
          //       // FilePickerCross picker = FilePickerCross(type: widget.fileType);
          //       // await picker.pick();
          //       // File file = File.fromRawPath(picker.toUint8List());
          //       // handleChanged(file);
          //     },
          //   ),
        ],
      ),
    );
  }

  listInput() {
    return decorationBox(
        child: Expanded(
      child: ListView(
        children: <Widget>[ListTile(title: Text('title goes here'))],
      ),
    ));
  }

  youtubeInput() {
    return textInput();
  }

  decorationBox({
    Widget? child,
    double size = 100,
    padding = const EdgeInsets.only(bottom: 16),
  }) {
    return Container(
      height: size,
      padding: padding,
      decoration: getDecoration(),
      child: child,
    );
  }

  getDecoration() {
    return BoxDecoration(
      color: widget.isDarkBackground ? AppThemes.colorOrange : null,
      borderRadius: BorderRadius.all(Radius.circular(6)),
      border: Border.all(
          color: widget.isDarkBackground
              ? AppThemes.colorOrange
              : Colors.grey.withOpacity(.6)),
    );
    // hintText: widget.hintText,
    // labelText: widget.labelText,
    // border: OutlineInputBorder(),
    // helperText: widget.error ?? _focused ? widget.helperText : '',
    // // helperStyle: TextStyle(
    // //     color: widget.error != null ? colorRed : colorBerry),
    // suffixIcon: getIcon());
  }

  getInputDecoration() {
    var style = widget.isDarkBackground
        ? TextStyle(
            color: AppThemes.figmaWhite,
          )
        : TextStyle(
            color: AppThemes.figmaBlackDark,
          );
    var outline = widget.isDarkBackground
        ? OutlineInputBorder()
            .copyWith(borderSide: BorderSide(color: AppThemes.colorOrange))
        : OutlineInputBorder();
    return InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        hintStyle: style,
        helperStyle: style,
        labelStyle: style,
        fillColor: AppThemes.figmaWhite,
        enabledBorder: outline,
        border: outline,
        helperText: helperText(),
        suffixIcon: getIcon());
  }

  handleChanged(dynamic value) {
    if (widget.controller == null)
      setState(() {
        _value = value;
      });
    if (widget.onChanged != null) {
      widget.onChanged!(value);
    }
    if (widget.type == 'date' && widget.onSubmitted != null) {
      widget.onSubmitted!(value);
    } else if (widget.type == 'image' && widget.onSubmitted != null) {
      widget.onSubmitted!(value);
    }
  }

  getIcon() {
    if (widget.type == 'password') {
      return passwordIcon();
    } else if (widget.correct) {
      return correctIcon();
    } else if (widget.type == 'password') {
      return searchIcon();
    }
  }

  getMask() {
    if (maskFormatter != null) {
      return [maskFormatter];
    } else if (numberFormatter != null) {
      return [numberFormatter];
    }
    return null;
  }

  passwordIcon() {
    return IconButton(
      icon: Icon(
        // Based on passwordVisible state choose the icon
        obscureText ? Icons.visibility : Icons.visibility_off,
        // color: colorGray,
      ),
      onPressed: () {
        // Update the state i.e. toogle the state of passwordVisible variable
        setState(() {
          obscureText = !obscureText;
        });
      },
    );
  }

  correctIcon() {
    return IconButton(
      icon: Icon(
        // Based on passwordVisible state choose the icon
        obscureText ? Icons.visibility : Icons.check,
        // color: colorMint,
        size: 34,
      ),
      onPressed: () => null,
    );
  }

  searchIcon() {
    return IconButton(
      icon: Icon(
        Icons.search,
        // color: colorMint,
        size: 34,
      ),
      onPressed: () => null,
    );
  }

  goToQuickAdd() {
    if (widget.collection != null && widget.collection.getForm != null) {
      Navigator.pushNamed(context, '/quickAdd',
          arguments: {'collection': widget.collection});
    }
  }

  helperText() {
    if (widget.error != null) {
      return widget.error;
    } else if (_focused) {
      return widget.helperText;
    } else {
      return widget.noBottom ? null : '';
    }
  }
}
