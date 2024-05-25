import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:fixit/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class ChatListTile extends StatelessWidget {
  const ChatListTile({
    super.key,
    required this.chatList,
    required this.technician,
  });

  final ChatList chatList;
  final Technician technician;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(technician.name!),
      subtitle: Row(
        children: [
          if (chatList.lastSender ==
              MainBoxMixin.mainBox?.get(MainBoxKeys.authUserId.name))
            Padding(
              padding: EdgeInsets.only(right: Dimens.space8),
              child: Icon(
                Icons.done_all,
                color:
                    chatList.technicianUnread == 0 ? Colors.blue : Colors.grey,
                size: Dimens.space16,
              ),
            ),
          Text(chatList.lastMessage!),
        ],
      ),
      leading: ProfilePicture(
        pictureUrl: technician.profilePicture!,
        radius: Dimens.space24,
        border: Dimens.space2,
        onTap: () {},
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            DateFormat.Hm().format(chatList.lastTime!),
          ),
          if (chatList.clientUnread != null && chatList.clientUnread != 0)
            CircleAvatar(
              backgroundColor: Theme.of(context).extension<MyAppColors>()!.blue,
              maxRadius: Dimens.space8,
              child: Center(
                child: Text(
                  '${chatList.clientUnread}',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Theme.of(context)
                            .extension<MyAppColors>()!
                            .background,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
      ),
      onTap: () {
        context.read<ChatCubit>().readChat(chatList);
        context.push(
          Routes.roomChat.path,
          extra: {
            'chatListId': chatList.id,
            'technicianName': technician.name,
            'technicianPicture': technician.profilePicture,
          },
        );
      },
    );
  }
}
