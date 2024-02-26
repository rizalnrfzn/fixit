import 'package:fixit/core/core.dart';
import 'package:fixit/features/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.chat,
    required this.isMe,
  });

  final Chat chat;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorTheme = Theme.of(context).extension<MyAppColors>()!;

    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: Dimens.space4,
          horizontal: Dimens.space8,
        ),
        padding: EdgeInsets.all(Dimens.space12),
        decoration: BoxDecoration(
          color: isMe ? Colors.blue[200] : Colors.grey[300],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r),
            topRight: Radius.circular(12.r),
            bottomLeft: isMe ? Radius.circular(12.r) : const Radius.circular(0),
            bottomRight:
                isMe ? const Radius.circular(0) : Radius.circular(12.r),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(right: Dimens.space12),
              child: Text(
                '${chat.message}',
                style: textTheme.bodyMedium!.copyWith(color: Palette.text),
              ),
            ),
            SizedBox(height: Dimens.space4),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '${chat.timestamp!.hour}.${chat.timestamp!.minute}',
                  style: textTheme.labelMedium!.copyWith(color: Colors.grey),
                ),
                SizedBox(width: Dimens.space8),
                if (isMe)
                  Icon(
                    Icons.done_all,
                    color: chat.isRead! ? Colors.blue : Colors.grey,
                    size: Dimens.space16,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
