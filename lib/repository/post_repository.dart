import '../data/network/BaseApiService.dart';
import '../data/network/NetworkApiService.dart';
import '../res/app_url.dart';

class PostRepository {
  BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> lastPostApi() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.postsEndPoint);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> searchApi(String param) async {
    String updatedParam = Uri.encodeComponent(param);
    try {
      dynamic response = await _apiServices
          .getGetApiResponse(AppUrl.postsEndPoint + '?search=${updatedParam}');
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> bultenApi() async {
    try {
      dynamic response = await _apiServices
          .getGetApiResponse(AppUrl.postsEndPoint + '?categories=251');
      return response;
    } catch (e) {
      throw e;
    }
  }
}
