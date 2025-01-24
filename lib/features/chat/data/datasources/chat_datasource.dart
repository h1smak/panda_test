abstract class ChatDataSource {
  Stream<Map<String, dynamic>> connect(String accessToken);
  void sendMessage(String accessToken, String text);
  void disconnect();
}
