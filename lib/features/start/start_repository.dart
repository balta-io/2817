import 'package:flutter_api_rest/shared/services/custom_dio.dart';

import '../../shared/models/post.dart';

abstract class StartRepository {
  Future<List<Post>> getPosts();
}

class StartRepositoryImpl implements StartRepository {
  final client = CustomDio();
  @override
  Future<List<Post>> getPosts() async {
    try {
      final response = await client.get("/photos");
      final data = response.data as List;
      return data.map((e) => Post.fromMap(e)).toList();
    } catch (e) {
      throw Exception("Nao foi possivel buscar os dados");
    }
  }
}
