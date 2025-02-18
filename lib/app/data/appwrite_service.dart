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
  late Databases databases;

  AppwriteService() {
    client = Client()
        .setEndpoint(GlobalState.endpoint) // Appwrite 服务器 URL
        .setProject(GlobalState.projectId); // Project ID

    account = Account(client);
    avatars = Avatars(client);
    storage = Storage(client);
    databases = Databases(client);
  }

// 获取用户信息
  Future<User> getUser() async {
    try {
      final user = await account.get();
      return user;
    } catch (e) {
      throw Exception('Failed to get user: $e');
    }
  }

  // 创建用户
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

// 创建会话/登录
  Future<Session> Login(String email, String password) async {
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

// 删除会话/退出登录
  Future<void> logout(String sessionId) async {
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

  // 数据库操作
  // 获取所有文档
  Future<List<Document>> getDocuments(String collectionId) async {
    try {
      final response = await databases.listDocuments(
          databaseId: GlobalState.databaseId, collectionId: collectionId);
      return response.documents;
    } catch (e) {
      throw Exception('Failed to get documents: $e');
    }
  }

  // 创建文档
  Future<Document> createDocument(
      String collectionId, Map<String, dynamic> data) async {
    try {
      final response = await databases.createDocument(
        databaseId: GlobalState.databaseId,
        collectionId: collectionId,
        documentId: 'unique()', // 自动生成唯一ID
        data: data,
      );
      return response;
    } catch (e) {
      throw Exception('Failed to create document: $e');
    }
  }

  // 更新文档
  Future<Document> updateDocument(
      String collectionId, String documentId, Map<String, dynamic> data) async {
    try {
      final response = await databases.updateDocument(
        databaseId: GlobalState.databaseId,
        collectionId: collectionId,
        documentId: documentId,
        data: data,
      );
      return response;
    } catch (e) {
      throw Exception('Failed to update document: $e');
    }
  }

  // 删除文档
  Future<void> deleteDocument(String collectionId, String documentId) async {
    try {
      await databases.deleteDocument(
        databaseId: GlobalState.databaseId,
        collectionId: collectionId,
        documentId: documentId,
      );
    } catch (e) {
      throw Exception('Failed to delete document: $e');
    }
  }
}
