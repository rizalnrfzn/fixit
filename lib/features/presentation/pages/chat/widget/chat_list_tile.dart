import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:fixit/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
              child: Icon(Icons.done_all, size: Dimens.space16),
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
      trailing: Text(
        '${chatList.lastTime!.hour}.'
        '${chatList.lastTime!.minute}',
      ),
      onTap: () {
        context.push(
          Routes.roomChat.path,
          extra: {
            'chatListId': chatList.id,
            'technician': technician,
          },
        );
      },
    );
  }
}
