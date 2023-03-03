import 'package:app_base/data/di/config.dart';
import 'package:app_base/data/source/network/api_result_handler.dart';
import 'package:app_base/data/source/network/http_utils.dart';
import 'package:app_base/data/source/network/endpoints.dart' as endPoints;

class PostRepository {
  Future<ApiResults> getPost(int id) async {
    return await getIt<HttpUtils>().getData(
      endPoint: endPoints.post,
      pathVariables: {'id': id},
    );
  }

  Future<ApiResults> getPosts(int page, int limit) async {
    return await getIt<HttpUtils>().getData(
      endPoint: endPoints.posts,
      queryParameters: {
        '_start': page,
        '_limit': limit,
      },
    );
  }

  // TEMP: For example only
  Future<ApiResults> getPostFail() async {
    return await getIt<HttpUtils>().getData(
      endPoint: 'invalid-endpoint',
    );
  }
}
