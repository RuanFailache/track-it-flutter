enum HttpMethod { get, post, put, delete }

abstract class HttpClient {
  Future<Map?> request({
    Map? body,
    required String url,
    required HttpMethod method,
  });
}
