import 'package:flutter/material.dart';

class ReadMoreText extends StatelessWidget {
  final String text;
  final int maxLines;
  final double maxWidth;
  final String readMoreText;
  final String readLessText;
  final TextStyle textStyle;
  final TextStyle textButtonStyle;

  const ReadMoreText(
    this.text, {
    super.key,
    required this.textStyle,
    required this.textButtonStyle,
    this.maxLines = 3,
    required this.maxWidth,
    this.readMoreText = 'Read More',
    this.readLessText = 'Show Less',
  });

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isExpanded = ValueNotifier(false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ValueListenableBuilder(
          valueListenable: isExpanded,
          builder: (context, value, child) {
            return Text(
              text,
              style: textStyle,
              maxLines: value ? null : maxLines,
              overflow: value ? TextOverflow.visible : TextOverflow.ellipsis,
            );
          },
        ),
        isTextVisible(text, textStyle, maxLines, maxWidth)
            ? GestureDetector(
                onTap: () {
                  isExpanded.value = !isExpanded.value;
                },
                child: ValueListenableBuilder(
                  valueListenable: isExpanded,
                  builder: (context, value, child) {
                    return Text(
                      value ? readLessText : readMoreText,
                      style: textButtonStyle,
                    );
                  },
                ),
              )
            : SizedBox.shrink(),
      ],
    );
  }
}

///check if the text can take all the available space
bool isTextVisible(
    String text, TextStyle textStyle, int maxLines, double maxWidth) {
  final TextPainter textPainter = TextPainter(
    text: TextSpan(text: text, style: textStyle),
    maxLines: maxLines,
    textDirection: TextDirection.ltr,
  );
  textPainter.layout(maxWidth: maxWidth);
  return textPainter.didExceedMaxLines;
}
