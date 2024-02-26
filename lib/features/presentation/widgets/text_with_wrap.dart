import 'package:fixit/core/core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextWithWrap extends StatefulWidget {
  final String text;

  const TextWithWrap({super.key, required this.text});

  @override
  State<TextWithWrap> createState() => _TextWithWrapState();
}

class _TextWithWrapState extends State<TextWithWrap> {
  String firstHalf = '';
  String secondHalf = '';

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 150) {
      firstHalf = widget.text.substring(0, 150);
      secondHalf = widget.text.substring(150, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorTheme = Theme.of(context).extension<MyAppColors>()!;

    return Container(
      child: secondHalf.isEmpty
          ? Text(firstHalf)
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text.rich(
                  TextSpan(
                    style: textTheme.bodyMedium,
                    children: [
                      TextSpan(
                        text: flag
                            ? ("$firstHalf...  ")
                            : '${(firstHalf + secondHalf)}  ',
                      ),
                      TextSpan(
                        text: flag ? 'Read more' : 'Show less',
                        style: textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: colorTheme.blue,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            setState(() {
                              flag = !flag;
                            });
                          },
                      )
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
