import 'dart:convert';
import 'package:panda_test/features/chat/data/datasources/chat_datasource.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

class ChatRemoteDataSource implements ChatDataSource {
  late WebSocketChannel _channel;

  @override
  Stream<Map<String, dynamic>> connect(String accessToken) {
    _channel = WebSocketChannel.connect(
      Uri.parse('ws://34.60.180.123:3000/chat'),
    );

    _channel.sink.add(jsonEncode({'type': 'auth', 'accessToken': accessToken}));

    return _channel.stream.map((event) => jsonDecode(event));
  }

  @override
  void sendMessage(String accessToken, String text) {
    _channel.sink.add(jsonEncode({'type': 'message', 'text': text}));
  }

  @override
  void disconnect() {
    _channel.sink.close(status.goingAway);
  }
}
