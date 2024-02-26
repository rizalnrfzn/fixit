part of 'chat_cubit.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState.loading() = _Loading;

  const factory ChatState.success(List<ChatList> chatList) = _Success;

  const factory ChatState.failure(String message) = _Failure;
}
