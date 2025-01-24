import 'package:panda_test/features/chat/domain/entities/message.dart';

abstract class ChatRepository {
  Stream<Message> connect(String accessToken);
  void sendMessage(String accessToken, String text);
  void disconnect();
}
