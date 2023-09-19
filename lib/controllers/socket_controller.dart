import 'package:get/get.dart';
// import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../configs/apis/apis.dart';
import '../utils/utils.dart';

class SocketController extends GetxController {
  // late final WebSocketChannel? channel;
  final SecureStorage _secureStorage = SecureStorage();
  late IO.Socket socket;
  connectSocket() async {
    final token = await _secureStorage.getAuthenticationToken();
    socket = IO.io(BackendApis.socketBaseUrl, <String, dynamic>{
      'autoConnect': false,
      'transports': ['websocket'],
      'query': {'token': token}
    });
    // Connect to websocket
    socket.connect();
    socket.onConnect((handler) async {
      logger.d('sockets connected');

      socket.on('chat-3', (data) {
        logger.i(data);
      });
    });
    socket.onDisconnect((_) => logger.i('Connection Disconnection'));
    socket.onConnectError((data) {
      logger.d(data);
    });
    socket.onError((data) {
      logger.d(data);
    });
  }

  @override
  void dispose() {
    // Close the WebSocket connection when the widget is disposed
    // channel?.sink.close();
    super.dispose();
    socket.clearListeners();
    socket.destroy();
    socket.dispose();
    socket.disconnect();
    socket.io.disconnect();
    socket.io.close();
    socket.io.destroy(socket);
  }
}
