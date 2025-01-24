import 'package:panda_test/features/chat/domain/repos/chat_repository.dart';

class SendMessageUseCase {
  final ChatRepository chatRepository;

  SendMessageUseCase({required this.chatRepository});

  void execute(String accessToken, String text) {
    chatRepository.sendMessage(accessToken, text);
  }
}
