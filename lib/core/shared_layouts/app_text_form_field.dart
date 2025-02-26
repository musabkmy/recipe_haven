import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show TextInputFormatter;
import 'package:recipe_haven/config/extensions/context_extensions.dart';
import 'package:recipe_haven/constants/app_colors.dart';
import 'package:recipe_haven/constants/app_styles.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.hintText,
    required this.initialValue,
    this.keyboardType = TextInputType.text,
    required this.onChanged,
    this.validator,
    this.suffixIcon,
    this.textInputAction = TextInputAction.next,
    this.obscureText = false,
    this.inputFormatters,
    this.enableInteractiveSelection = true,
    this.autovalidateMode = AutovalidateMode.onUnfocus,
    this.autofillHints,
  });
  final String? hintText;
  final String initialValue;
  final TextInputType keyboardType;
  final void Function(String) onChanged;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final TextInputAction textInputAction;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final bool enableInteractiveSelection;
  final AutovalidateMode autovalidateMode;
  final Iterable<String>? autofillHints;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
      validator: validator,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      style: context.bodyMedium,
      obscuringCharacter: '•',
      obscureText: obscureText,
      autocorrect: false,
      enableSuggestions: false,
      autovalidateMode: autovalidateMode,
      autofillHints: autofillHints,
      enableInteractiveSelection: enableInteractiveSelection,
      inputFormatters: inputFormatters,
      decoration: _inputDecoration(hintText: hintText, suffixIcon: suffixIcon),
      //override default on long press layout
      // contextMenuBuilder: (context, editableTextState) {
      //   return AdaptiveTextSelectionToolbar(
      //     anchors: editableTextState.contextMenuAnchors,
      //     children: [
      //       TextButton(
      //         onPressed: () {
      //           Clipboard.setData(
      //             ClipboardData(text: editableTextState.textEditingValue.text),
      //           );
      //         },
      //         child: Text('Custom Copy'),
      //       ),
      //     ],
      //   );
      // },

      //FocusNode: focusNode,
      // autofocus:autofocus,

      // textAlign: ,
      // textAlignVertical: ,
      // smartDashesType:,
      // smartQuotesType:,
      // maxLength:,
      // maxLengthEnforcement: MaxLengthEnforcement.enforced,
      // expands: false,
      // onTap:,
      // onTapAlwaysCalled: false,
      // onTapOutside:,
      // onTapUpOutside:,
      // onEditingComplete:,
      // onFieldSubmitted:,
      // onSaved:,
      // enabled,
      // cursorWidth = 2.0,
      // cursorHeight:,
      // cursorRadius:,
      // cursorColor:,
      // cursorErrorColor:,
      // cursorOpacityAnimates,
      // keyboardAppearance:,
      // scrollPadding: EdgeInsets.all(20.0),
      // ignorePointers:,

      //control copy/paste/etc or may add more like translate
      // selectionControls:,

      //with max length
      // InputCounterWidgetBuilder? buildCounter,
      // scrollPhysics:,
      // scrollController:,

      //AI-based word suggestions from user behavior
      // enableIMEPersonalizedLearning:,

      // mouseCursor:,

      //Enables or disables spell-checking
      //  spellCheckConfiguration:,

      //zoom bubble
      //  magnifierConfiguration:,

      //Adds an undo/redo history
      //  undoController:,

      //advance keyboard commands
      //callback function used in Flutter's text input system to handle custom commands sent from the IME (Input Method Editor),
      //such as a keyboard or voice input system.
      //  appPrivateCommandCallback: (String command, Map<String, dynamic> args) {
      //   if (command == "custom_insert") {
      //     print("Custom insert command received with args: $args");
      //   } else if (command == "speech_input") {
      //     print("Speech-to-text command received: ${args['transcription']}");
      //   }
      // },

      // selectionHeightStyle: ui.BoxHeightStyle.strut,
      // selectionWidthStyle: ui.BoxWidthStyle.tight,
      // dragStartBehavior: DragStartBehavior.start,

      //Custom text input experiences
      // contentInsertionConfiguration:,

      //control user state like focused and hover
      //  statesController:,

      // Clip: Clip.hardEdge,
      // stylusHandwritingEnabled: EditableText.defaultStylusHandwritingEnabled,
      // canRequestFocus: true,
    );
  }

  InputDecoration _inputDecoration({
    required String? hintText,
    required Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hintText,
      suffixIcon: suffixIcon,

      errorBorder: AppStyles.outlineInputBorderXS(color: AppColors.error),
      focusedBorder: AppStyles.outlineInputBorderM(color: AppColors.grey400),
      focusedErrorBorder: AppStyles.outlineInputBorderM(
        color: AppColors.errorOnFocused,
      ),
      disabledBorder: AppStyles.outlineInputBorderM(
        color: AppColors.errorOnFocused,
      ),
      enabledBorder: AppStyles.outlineInputBorderXS(color: AppColors.grey400),

      // contentPadding:,
      // constraints:,

      // filled: ,
      // fillColor: ,
      // focusColor: ,
      // hoverColor: ,

      // enabled: ,

      // icon: ,
      // iconColor: ,

      // label: ,
      // labelText: ,
      // labelStyle: ,

      // border:,

      // helper: ,
      // helperText:,
      // helperStyle:,
      // helperMaxLines:,

      // hintStyle: ,
      // hintTextDirection: ,
      // hintMaxLines:,
      // hintFadeDuration: ,
      // maintainHintHeight: ,
      // alignLabelWithHint: ,

      // error:,
      // errorText: ,
      // errorStyle: ,
      // errorMaxLines:,

      // floatingLabelBehavior: ,
      // floatingLabelAlignment: ,
      // floatingLabelStyle: ,

      // prefixIcon: ,
      // prefix: ,
      // prefixText: ,
      // prefixStyle: ,
      // prefixIconColor: ,
      // prefixIconConstraints: ,

      // suffix: ,
      // suffixText: ,
      // suffixStyle: ,
      // suffixIconColor: ,
      // suffixIconConstraints: ,

      // counter: ,
      // counterText: ,
      // counterStyle: ,
      // semanticCounterText: ,
    );
  }
}
