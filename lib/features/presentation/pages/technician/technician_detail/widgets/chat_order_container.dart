import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:fixit/utils/ext/ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ChatOrderContainer extends StatelessWidget {
  const ChatOrderContainer({
    super.key,
    required this.uid,
  });

  final String uid;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Theme.of(context).hintColor),
          left: BorderSide(color: Theme.of(context).hintColor),
          right: BorderSide(color: Theme.of(context).hintColor),
        ),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.w),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: Dimens.space20, horizontal: Dimens.space8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BlocListener<ChatCubit, ChatState>(
              listener: (context, state) {
                state.whenOrNull(
                  loading: () => context.show(),
                  failure: (message) {
                    context.dismiss();
                    message.toToastError(context);
                  },
                  success: (chatList) {
                    context.dismiss();

                    final chat = chatList
                        .firstWhere((element) => element.technicianUid == uid);
                    final technician = context
                        .read<TechnicianCubit>()
                        .technicians
                        .firstWhere((element) => element.uid == uid);

                    context.read<ChatCubit>().readChat(chat);
                    context.push(
                      Routes.roomChat.path,
                      extra: {
                        'chatListId': chat.id,
                        'technicianName': technician.name,
                        'technicianPicture': technician.profilePicture,
                      },
                    );
                  },
                );
              },
              child: ElevatedButton(
                onPressed: () {
                  if (context
                      .read<ChatCubit>()
                      .chatList
                      .any((element) => element.technicianUid == uid)) {
                    final technician = context
                        .read<TechnicianCubit>()
                        .technicians
                        .firstWhere((element) => element.uid == uid);
                    final chat = context
                        .read<ChatCubit>()
                        .chatList
                        .firstWhere((element) => element.technicianUid == uid);
                    context.push(
                      Routes.roomChat.path,
                      extra: {
                        'chatListId': chat.id,
                        'technicianName': technician.name,
                        'technicianPicture': technician.profilePicture,
                      },
                    );
                  } else {
                    context.read<ChatCubit>().newChat(uid);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).hintColor,
                  foregroundColor: Palette.background,
                  minimumSize: Size(180.w, 50.w),
                ),
                child: Text(Strings.of(context)!.chat),
              ),
            ),
            BlocBuilder<TechnicianCubit, TechnicianState>(
              builder: (_, __) {
                if (context
                    .read<TechnicianCubit>()
                    .technicians
                    .firstWhere((element) => element.uid == uid)
                    .inOrder!) {
                  return FilledButton(
                    onPressed: null,
                    style: FilledButton.styleFrom(
                      foregroundColor: Palette.background,
                      minimumSize: Size(180.w, 50.w),
                    ),
                    child: Text(Strings.of(context)!.technicianIsInOrder),
                  );
                }
                if (!(context
                    .read<TechnicianCubit>()
                    .technicians
                    .firstWhere((element) => element.uid == uid)
                    .isOnline!)) {
                  return FilledButton(
                    onPressed: null,
                    style: FilledButton.styleFrom(
                      foregroundColor: Palette.background,
                      minimumSize: Size(180.w, 50.w),
                    ),
                    child: Text(Strings.of(context)!.technicianIsOffline),
                  );
                }
                return FilledButton(
                  onPressed: () {
                    context.push(Routes.makeOrder.path, extra: uid);
                  },
                  style: FilledButton.styleFrom(
                    foregroundColor: Palette.background,
                    minimumSize: Size(180.w, 50.w),
                  ),
                  child: Text(Strings.of(context)!.orderNow),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
