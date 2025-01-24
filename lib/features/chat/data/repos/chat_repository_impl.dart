import 'package:panda_test/features/chat/data/datasources/chat_datasource.dart';
import 'package:panda_test/features/chat/domain/entities/message.dart';
import 'package:panda_test/features/chat/domain/repos/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatDataSource chatDataSource;

  ChatRepositoryImpl({required this.chatDataSource});

  @override
  Stream<Message> connect(String accessToken) {
    return chatDataSource.connect(accessToken).map((event) {
      if (event['type'] == 'new_message') {
        final message = event['message'];
        return Message(
          userId: message['userId'],
          username: message['username'],
          text: message['text'],
        );
      }
      throw Exception('Unknown event type');
    });
  }

  @override
  void sendMessage(String accessToken, String text) {
    chatDataSource.sendMessage(accessToken, text);
  }

  @override
  void disconnect() {
    chatDataSource.disconnect();
  }
}
