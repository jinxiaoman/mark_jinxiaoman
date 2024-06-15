// lib/app/data/appwrite_service.dart
import 'dart:typed_data';
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:get/get.dart';
import 'package:mark_jinxiaoman/app/data/global_state.dart';

class AppwriteService {
  late Client client;
  late Account account;
  late Avatars avatars;
  late Storage storage;

  AppwriteService() {
    client = Client()
        .setEndpoint(GlobalState.endpoint) // Appwrite 服务器 URL
        .setProject(GlobalState.projectId); // Project ID

    account = Account(client);
    avatars = Avatars(client);
    storage = Storage(client);
  }

  Future<User> createUser(String email, String password, String name) async {
    try {
      final user = await account.create(
        userId: ID.unique(),
        email: email,
        password: password,
        name: name,
      );
      return user;
    } catch (e) {
      throw Exception('Failed to create user: $e');
    }
  }

  Future<Session> createSession(String email, String password) async {
    try {
      final session = await account.createEmailPasswordSession(
        email: email,
        password: password,
      );
      return session;
    } catch (e) {
      throw Exception('Failed to create session: $e');
    }
  }

  Future<void> deleteSession(String sessionId) async {
    try {
      await account.deleteSession(sessionId: sessionId);
    } catch (e) {
      throw Exception('Failed to delete session: $e');
    }
  }

  Future<Uint8List> getAvatar(String name) async {
    final res = await avatars.getInitials(name: name);
    return res;
  }

  Future<Uint8List> getImageAvatar(String bucketId, String fileId) async {
    final res = await storage.getFilePreview(
      bucketId: bucketId,
      fileId: fileId,
      width: 100,
    );
    return res;
  }

  Future<File> uploadFile(String bucketId, InputFile file) async {
    return storage.createFile(
      bucketId: bucketId,
      fileId: ID.unique(),
      file: file,
    );
  }
}
