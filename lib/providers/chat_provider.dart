import 'package:flutter/material.dart';
import 'package:panda_test/features/chat/data/datasources/chat_remote_datasource.dart';
import 'package:panda_test/features/chat/data/repos/chat_repository_impl.dart';
import 'package:panda_test/features/chat/domain/entities/message.dart';

class ChatProvider with ChangeNotifier {
  final _chatRepository = ChatRepositoryImpl(
    chatDataSource: ChatRemoteDataSource(),
  );

  final List<Message> _messages = [];
  late Stream<Message> _messageStream;
  bool _isConnected = false;

  List<Message> get messages => _messages;
  bool get isConnected => _isConnected;

  void connect(String accessToken) {
    _isConnected = true;

    _messageStream = _chatRepository.connect(accessToken);
    _messageStream.listen((message) {
      _messages.add(message);
      notifyListeners();
    });
  }

  void sendMessage(String accessToken, String text) {
    _chatRepository.sendMessage(accessToken, text);
  }

  void disconnect() {
    _chatRepository.disconnect();
    _isConnected = false;
    _messages.clear();
    notifyListeners();
  }
}
