import 'dart:convert';
import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:http/http.dart';
import 'dart:html' as html; // Import this for web
import 'package:http/http.dart' as http;
import 'dart:typed_data';
import '../../../helper/cache_helper.dart';
import '../../../model/message.dart';
import '../../../utils/constant.dart';

part 'individual_state.dart';

class IndividualCubit extends Cubit<IndividualState> {
  IndividualCubit() : super(IndividualInitial());

  static IndividualCubit get(context) => BlocProvider.of(context);
  IO.Socket? socket;
  ImagePicker picker = ImagePicker();
  bool sendButton = false;
  XFile? file;
  final List<Message> messageList = [];
  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();
  int popTime = 0;
  List<Messages> allChat = [];
  setPopTime(int p) {
    popTime = p;
    emit(SetPopTime());
  }

  sendButtonMessage(String value) {
    if (value.isNotEmpty) {
      sendButton = true;
      emit(ShowSendButton());
    } else {
      sendButton = false;
      emit(HiddenSendButton());
    }
  }

  Future<void> connect(String id, String targetId) async {
    socket = IO.io("http://192.168.56.1:5000/", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false
    });
    socket!.connect();
    socket!.emit("signin", id);
    socket!.onConnect((data) {
      print("Connected");
      fetchChatHistory(id, targetId);
      socket!.on("message", (msg) {
        print("رسالة مستلمة: ${msg["message"]}");
        print("مسار الصورة: ${msg['path']}");
        print(msg);
        setMessage("destination", msg["message"], msg['path'],false);
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    });
    print(socket!.connected);
  }

  void sendMessage(String message, String sourceId, String targetId, String path) {
    setMessage("source", message, path,true);
    socket!.emit("message", {
      "message": message,
      "sourceId": sourceId,
      "targetId": targetId,
      "path": path,
      "isSender": true
    });
  }

  void setMessage(String type, String message, String path, bool isSender) {
    Messages messages = Messages(
        message: message,
        timestamp: DateTime.now().toString().substring(10, 16),
        path: path,
        isSender: isSender
    );
    allChat.add(messages);
   print(messages.path);
    emit(SetMessage());
  }

  Future<void> onImageSend(String imagePath, String message, BuildContext context) async {
    if (kDebugMode) {
      print("Attempting to send image: $imagePath with message: $message");
    }

    for (int i = 0; i < popTime; i++) {
      Navigator.pop(context);
    }
    setPopTime(0);

    const isWeb = kIsWeb;
    if (isWeb) {
      // Handling web file upload
      try {
        final reader = html.FileReader();
        final file = html.File([await html.HttpRequest.request(imagePath)], 'image.jpg');

        reader.readAsArrayBuffer(file);
        reader.onLoadEnd.listen((e) async {
          final formData = html.FormData();
          //formData.appendBlob('img', file);
          formData.appendBlob('img', Blob([reader.result], 'image/jpg'));
          final response = await html.HttpRequest.request(
            'http://192.168.56.1:5000/routes/add-image',
            method: 'POST',
            sendData: formData,
          );

          if (response.status == 200 || response.status == 201) {
            emit(SuccessSend());
            if (kDebugMode) {
              print("Image sent successfully.");
            }

            setMessage("source", message, imagePath, true);
            socket!.emit("message", {
              "message": message,
              "path": imagePath,
              "isSender": true
            });
          } else {
            emit(ErrorSend());
            if (kDebugMode) {
              print("Failed to send image: ${response.status}");
            }
          }
        });
      } catch (error) {
        emit(ErrorSend());
        if (kDebugMode) {
          print("Error sending image: $error");
        }
      }
    } else {
      // Handling mobile file upload
      try {
        var request = http.MultipartRequest(
            "POST", Uri.parse("http://192.168.56.1:5000/routes/add-image"));
        request.files.add(await http.MultipartFile.fromPath('img', imagePath));
        request.headers['Content-Type'] = 'multipart/form-data';

        http.StreamedResponse response = await request.send();
        var httpResponse = await http.Response.fromStream(response);
        var data = json.decode(httpResponse.body);
        print(data['path']);
        if (response.statusCode == 200 || response.statusCode == 201) {
          emit(SuccessSend());
          if (kDebugMode) {
            print("Image sent successfully.");
          }
          setMessage("source", message, imagePath, true);
          socket!.emit("message", {
            "message": message,
            "path": data['path'],
            "isSender": true
          });
        } else {
          emit(ErrorSend());
          if (kDebugMode) {
            print("Failed to send image: ${response.statusCode}");
          }
        }
      } catch (error) {
        emit(ErrorSend());
        if (kDebugMode) {
          print("Error sending image: $error");
        }
      }
    }
  }
  Future<void> getChat({required String userId, required String targetId}) async {
    try {
      emit(ChatLoading());
      http.Response response = await http.get(
        Uri.parse("${Constants().baseUrl}${Constants().chat}/$userId/$targetId"),
        headers: {
          "Content-Type": "application/json",
          "token": CacheHelper.getData(key: "token")
        },
      );

      if (kDebugMode) {
        print(response.body);
      } // For debugging

      if (response.statusCode == 200) {
        List<dynamic> chatResponse =
        jsonDecode(response.body); // Expecting a List
        allChat = chatResponse.map((chat) => Messages.fromJson(chat)).toList();
        print(chatResponse);
        emit(ChatLoaded());
      } else {
        emit(ChatError());
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(ChatError());
    }
  }
  Future<void> fetchChatHistory(String userId, String targetId) async {
    await getChat(userId: userId, targetId: targetId);
    emit(ChatLoaded());
  }
}
