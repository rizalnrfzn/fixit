import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Parent(
      appBar: MyAppBar(context, title: Strings.of(context)!.chat).call(),
      child: SafeArea(
        child: BlocBuilder<ChatCubit, ChatState>(
          builder: (_, state) {
            return state.when(
              loading: () => const Center(child: Loading()),
              failure: (message) => Empty(errorMessage: message),
              success: (chatList) {
                return BlocBuilder<TechnicianCubit, TechnicianState>(
                  builder: (_, state) {
                    return Column(
                      children: List.generate(
                        chatList.length,
                        (index) {
                          return ChatListTile(
                            chatList: chatList[index],
                            technician: context
                                .read<TechnicianCubit>()
                                .technicians
                                .firstWhere(
                                  (element) =>
                                      element.uid ==
                                      chatList[index].technicianUid,
                                ),
                          );
                        },
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
