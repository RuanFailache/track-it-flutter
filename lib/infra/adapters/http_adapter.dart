import 'dart:convert';

import 'package:http/http.dart';
import 'package:track_it/data/data.dart';

class HttpClientAdapter extends HttpClient {
  HttpClientAdapter({required this.client});

  final Client client;

  @override
  Future<Map?> request({
    Map? body,
    required String url,
    required HttpMethod method,
  }) async {
    final encodedBody = body != null ? jsonEncode(body) : null;
    final urlAsUri = Uri.parse(url);

    final clientResponse = await (() {
      switch (method) {
        case HttpMethod.get:
          return client.get(urlAsUri);
        case HttpMethod.post:
          return client.post(urlAsUri, body: encodedBody);
        case HttpMethod.put:
          return client.put(urlAsUri, body: encodedBody);
        case HttpMethod.delete:
          return client.delete(urlAsUri, body: encodedBody);
        default:
          throw HttpError.unknown;
      }
    })();

    final statusCode = clientResponse.statusCode;

    if (statusCode == 204 || clientResponse.body.isEmpty) {
      return null;
    }

    if (statusCode >= 200 && statusCode < 300) {
      return jsonDecode(clientResponse.body);
    }

    throw HttpErrorUtils.getErrorByStatusCode(statusCode);
  }
}
