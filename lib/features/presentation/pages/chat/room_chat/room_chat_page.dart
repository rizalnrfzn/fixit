import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:fixit/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoomChatPage extends StatefulWidget {
  const RoomChatPage({
    super.key,
    required this.chatListId,
    required this.technician,
  });

  final String chatListId;
  final Technician technician;

  @override
  State<RoomChatPage> createState() => _RoomChatPageState();
}

class _RoomChatPageState extends State<RoomChatPage> {
  late TextEditingController _conMessage;

  bool _isComposing = false;

  @override
  void initState() {
    _conMessage = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _conMessage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorTheme = Theme.of(context).extension<MyAppColors>()!;

    return Parent(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          title: Row(
            children: [
              ProfilePicture(
                pictureUrl: widget.technician.profilePicture!,
                radius: Dimens.space20,
                border: Dimens.space2,
                onTap: () {},
              ),
              SizedBox(width: Dimens.space12),
              Text(
                widget.technician.name!,
                style:
                    textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          elevation: 0,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                return state.when(
                  loading: () => const Center(
                    child: Loading(),
                  ),
                  failure: (message) => Empty(errorMessage: message),
                  success: (chatList) {
                    return Expanded(
                      child: SingleChildScrollView(
                        reverse: true,
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: Dimens.space16),
                          child: Column(
                            children: List.generate(
                              chatList
                                  .firstWhere((element) =>
                                      element.id == widget.chatListId)
                                  .chats!
                                  .length,
                              (index) => Padding(
                                padding: EdgeInsets.only(
                                  top: index == 0 ? Dimens.space12 : 0,
                                  bottom: index ==
                                          (chatList
                                                  .firstWhere((element) =>
                                                      element.id ==
                                                      widget.chatListId)
                                                  .chats!
                                                  .length -
                                              1)
                                      ? Dimens.space12
                                      : 0,
                                ),
                                child: ChatBubble(
                                  chat: chatList
                                      .firstWhere((element) =>
                                          element.id == widget.chatListId)
                                      .chats![index],
                                  isMe: chatList
                                          .firstWhere((element) =>
                                              element.id == widget.chatListId)
                                          .chats![index]
                                          .sender ==
                                      MainBoxMixin.mainBox
                                          ?.get(MainBoxKeys.authUserId.name),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            Container(
              decoration: BoxDecoration(
                color: colorTheme.background,
                border: Border(
                  top: BorderSide(color: colorTheme.shadow!),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimens.space8,
                  vertical: Dimens.space8,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: colorTheme.background,
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: Dimens.space8),
                            Expanded(
                              child: TextField(
                                controller: _conMessage,
                                textInputAction: TextInputAction.send,
                                maxLines: null,
                                minLines: 1,
                                onChanged: (text) {
                                  setState(() {
                                    _isComposing = text.isNotEmpty;
                                  });
                                },
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Type your message...',
                                  isCollapsed: true,
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 10.0),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.image),
                              onPressed: () {
                                // Implementasi untuk menambahkan lampiran file
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _isComposing ? colorTheme.blue : Colors.grey,
                      ),
                      child: SizedBox(
                        height: Dimens.space46,
                        width: Dimens.space46,
                        child: IconButton(
                          icon: const Icon(Icons.send, color: Colors.white),
                          onPressed: _isComposing
                              ? () {
                                  context.read<ChatCubit>().sendChat(
                                        PostChatParams(
                                          chat: Chat(
                                            message: _conMessage.text,
                                            timestamp: DateTime.now(),
                                            sender: context
                                                .read<ChatCubit>()
                                                .chatList
                                                .firstWhere((element) =>
                                                    element.id ==
                                                    widget.chatListId)
                                                .clientUid,
                                            recipient: context
                                                .read<ChatCubit>()
                                                .chatList
                                                .firstWhere((element) =>
                                                    element.id ==
                                                    widget.chatListId)
                                                .technicianUid,
                                            isRead: false,
                                          ),
                                          chatList: context
                                              .read<ChatCubit>()
                                              .chatList
                                              .firstWhere((element) =>
                                                  element.id ==
                                                  widget.chatListId),
                                        ),
                                      );
                                  setState(() {
                                    _isComposing = false;
                                    _conMessage.text = '';
                                  });
                                }
                              : null,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
